package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.AccountServiceLocal;

import java.io.IOException;

@WebServlet("/dashboard")

public class indexServlet extends HttpServlet {

    @EJB
    private AccountServiceLocal accountService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user != null) {
            Account freshAccount = accountService.getAccountByUser(user);
            session.setAttribute("userAccount", freshAccount);
            session.setAttribute("userBalance", freshAccount.getBalance());
        }

        req.getRequestDispatcher("/user/index.jsp").forward(req, resp);
    }
}
