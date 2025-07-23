package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.app.core.model.Transaction;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.TransactionService;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/transactions")
public class UserTransactionHistory extends HttpServlet  {

    @EJB
    private TransactionService transactionService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User currentUser = (User) req.getSession().getAttribute("currentUser");
        List<Transaction> userTransactions = transactionService.getTransactionsByUser(currentUser.getId());

        req.setAttribute("transactions", userTransactions);
        req.getRequestDispatcher("/user/viewTransactions.jsp").forward(req, resp);
    }
}
