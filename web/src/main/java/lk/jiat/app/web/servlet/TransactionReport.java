package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.app.core.model.Transaction;
import lk.jiat.app.core.service.TransactionService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/transactionReport")
public class TransactionReport extends HttpServlet {

    @EJB
    private TransactionService transactionService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Transaction> transactions = transactionService.getAllTransactions(); // or filtered
        if (transactions == null) {
            System.out.println("Transaction list is null");
        }
        req.setAttribute("transactions", transactions);
        req.getRequestDispatcher("/admin/transactionReport.jsp").forward(req, resp);
    }

}


