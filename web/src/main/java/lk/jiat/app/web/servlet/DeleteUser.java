package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/deleteUser")
public class DeleteUser extends HttpServlet {

    @EJB
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long userId = Long.parseLong(request.getParameter("id"));
            User user = userService.getUserById(userId);
            if (user != null) {
                userService.deleteUser(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<User> users = userService.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/viewAccounts.jsp").forward(request, response);
        System.out.println("deleted user");
    }
}
