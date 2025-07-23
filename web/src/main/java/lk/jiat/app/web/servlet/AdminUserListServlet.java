package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class AdminUserListServlet extends HttpServlet {

    @EJB
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userService.getAllUsers();  // userService is UserSessionBean
        request.setAttribute("users", users);


        for (User u : users) {
            System.out.println("User: " + u.getUsername());
            if (u.getAccounts() == null || u.getAccounts().isEmpty()) {
                System.out.println("→ No accounts for user: " + u.getUsername());
            } else {
                for (Account a : u.getAccounts()) {
                    System.out.println("→ Account: " + a.getAccountNumber() + ", Balance: " + a.getBalance());
                }
            }
        }


        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/viewAccounts.jsp");
        dispatcher.forward(request, response);
    }
}
