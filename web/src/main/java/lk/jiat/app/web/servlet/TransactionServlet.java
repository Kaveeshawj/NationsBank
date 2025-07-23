package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.app.core.exception.LoginFailedException;
import lk.jiat.app.core.model.*;
import lk.jiat.app.core.service.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@WebServlet("/transaction")
public class TransactionServlet extends HttpServlet {

    @EJB
    private TransactionService transactionService;

    @EJB
    private UserService userService;

    @EJB
    private TransactionTypeService transactionTypeService;

    @EJB
    private AccountServiceLocal accountService;

    @EJB
    private ScheduledService scheduledService;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User fromUser = (User) session.getAttribute("currentUser");

        if (fromUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        try {
            String toAccountNumber = req.getParameter("recipient");
            String amountStr = req.getParameter("amount");
            String description = req.getParameter("description");
            String scheduleTimeStr = req.getParameter("scheduleTime");

            if (toAccountNumber == null || toAccountNumber.trim().isEmpty()) {
                throw new LoginFailedException("Recipient account number is required");
            }

            if (amountStr == null || amountStr.trim().isEmpty()) {
                throw new LoginFailedException("Amount is required");
            }

            BigDecimal amount;
            try {
                amount = new BigDecimal(amountStr);
                if (amount.compareTo(BigDecimal.ZERO) <= 0) {
                    throw new LoginFailedException("Amount must be greater than zero");
                }
            } catch (NumberFormatException e) {
                throw new LoginFailedException("Invalid amount format");
            }

            TransactionType type = transactionTypeService.findById(1);
            User toUser = userService.getUserByAccountNumber(toAccountNumber.trim());
            if (toUser == null) {
                throw new LoginFailedException("Invalid recipient account number");
            }

            if (toUser.getId().equals(fromUser.getId())) {
                throw new LoginFailedException("You cannot transfer money to your own account");
            }

            if (!"ACTIVE".equalsIgnoreCase(toUser.getStatus())) {
                throw new LoginFailedException("Cannot transfer to an inactive user");
            }

            Account fromAccount = accountService.getAccountByUser(fromUser);
            Account toAccount = accountService.getAccountByUser(toUser);

            if (fromAccount.getBalance().compareTo(amount) < 0) {
                throw new LoginFailedException("Insufficient balance");
            }

            // Check if scheduled
            if (scheduleTimeStr != null && !scheduleTimeStr.trim().isEmpty()) {
                LocalDateTime dateTime = LocalDateTime.parse(scheduleTimeStr);
                if (dateTime.isBefore(LocalDateTime.now())) {
                    throw new LoginFailedException("Scheduled time must be in the future");
                }

                Date scheduledDate = Date.from(dateTime.atZone(ZoneId.systemDefault()).toInstant());

                Transaction transaction = new Transaction();
                transaction.setFrom_account(fromAccount);
                transaction.setToAccount(toAccount);
                transaction.setAmount(amount);
                transaction.setDescription(description != null ? description.trim() : "Scheduled Transfer");
                transaction.setTransaction_type(type);
                transaction.setStatus("PENDING");

                transaction.setScheduledDate(scheduledDate);
                scheduledService.scheduleTransfer(transaction);

                String formattedDateTime = dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
                session.setAttribute("flashMessage", "Transaction scheduled for " + formattedDateTime);

            } else {
                fromAccount.setBalance(fromAccount.getBalance().subtract(amount));
                toAccount.setBalance(toAccount.getBalance().add(amount));

                accountService.updateAccount(fromAccount);
                accountService.updateAccount(toAccount);

                Transaction transaction = new Transaction();
                transaction.setFrom_account(fromAccount);
                transaction.setToAccount(toAccount);
                transaction.setAmount(amount);
                transaction.setDescription(description != null ? description.trim() : "Transfer");
                transaction.setTransaction_type(type);
                transaction.setStatus("COMPLETED");
                transaction.setScheduledDate(null);

                transactionService.saveTransaction(transaction);

                session.setAttribute("userAccount", fromAccount);
                session.setAttribute("userBalance", fromAccount.getBalance());
                session.setAttribute("flashMessage", "Transaction completed successfully!");
            }

            resp.sendRedirect(req.getContextPath() + "/dashboard");

        } catch (LoginFailedException e) {
            session.setAttribute("flashMessage", "Error: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/user/transactions.jsp");
        } catch (Exception e) {
            session.setAttribute("flashMessage", "An unexpected error occurred. Please try again.");
            resp.sendRedirect(req.getContextPath() + "/user/transactions.jsp");
        }
    }
}

