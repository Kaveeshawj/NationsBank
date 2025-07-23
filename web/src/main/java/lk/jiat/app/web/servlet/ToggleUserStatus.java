package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.UserService;

import java.io.IOException;

@WebServlet("/admin/toggleUserStatus")
public class ToggleUserStatus extends HttpServlet {

    @EJB
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long userId = Long.parseLong(request.getParameter("userId"));

        User user = userService.getUserById(userId);

        if (user != null) {
            String newStatus = "ACTIVE".equals(user.getStatus()) ? "INACTIVE" : "ACTIVE";
            user.setStatus(newStatus);
            userService.updateUser(user);
        }

        response.sendRedirect(request.getContextPath() + "/admin/users"); // update as needed
    }
}


