package lk.jiat.app.web.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.app.core.exception.LoginFailedException;

import java.io.IOException;

@WebServlet("/redirect-after-login")
public class RedirectAfterLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.isUserInRole("ADMIN")) {
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
        } else if (request.isUserInRole("USER")) {
            response.sendRedirect(request.getContextPath() + "/user/index.jsp");
        } else {
            System.out.println("Authentication role failed");
            throw new LoginFailedException("Role Failed");
        }
    }
}
