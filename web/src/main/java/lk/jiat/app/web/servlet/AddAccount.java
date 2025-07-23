package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.AccountType;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.AccountServiceLocal;
import lk.jiat.app.core.service.AccountTypeServiceLocal;
import lk.jiat.app.core.service.UserService;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/admin/addAccount")
public class AddAccount extends HttpServlet {

    @EJB
    private AccountServiceLocal accountService;

    @EJB
    private AccountTypeServiceLocal accountTypeService;

    @EJB
    private UserService userService; // Optional, if assigning to a specific user

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        double balance = Double.parseDouble(request.getParameter("balance"));
        long accountTypeId = Long.parseLong(request.getParameter("accountTypeId"));
        long userId = Long.parseLong(request.getParameter("userId"));

        AccountType accountType = accountTypeService.getAccountTypeById(accountTypeId);
        User user = userService.getUserById(userId);

        Account account = new Account();
        account.setAccountNumber(accountNumber);
        account.setBalance(BigDecimal.valueOf(balance));
        //account.setInterestRate(interestRate);
        account.setAccountType(accountType);
        account.setUser(user);

        accountService.addAccount(account);

        response.sendRedirect("addAccounts.jsp");
    }
}
