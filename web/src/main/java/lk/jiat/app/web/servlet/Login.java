package lk.jiat.app.web.servlet;

import jakarta.annotation.security.DeclareRoles;
import jakarta.ejb.EJB;
import jakarta.inject.Inject;
import jakarta.security.enterprise.AuthenticationStatus;
import jakarta.security.enterprise.SecurityContext;
import jakarta.security.enterprise.authentication.mechanism.http.AuthenticationParameters;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.app.core.exception.LoginFailedException;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.UserService;
import lk.jiat.app.core.util.Encryption;

import java.io.IOException;

@DeclareRoles({"ADMIN", "USER"})
@WebServlet("/login")
public class Login extends HttpServlet {

    @Inject
    private SecurityContext securityContext;

    @EJB
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession oldSession = request.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate();
        }
        HttpSession session = request.getSession(true);

        User user = null;
        try {
            user = userService.getUserByUsername(username);
            if (user == null) {
                throw new LoginFailedException("User not found");
            }

            if (!"ACTIVE".equalsIgnoreCase(user.getStatus())) {
                throw new LoginFailedException("User is deleted or inactive");
            }
        } catch (LoginFailedException e) {
            session.setAttribute("flashMessage", "Login failed: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        AuthenticationParameters parameters = AuthenticationParameters.withParams()
                .credential(new UsernamePasswordCredential(username, password));

        System.out.println("parameters :" + parameters);
        AuthenticationStatus status = securityContext.authenticate(request, response, parameters);
        System.out.println("status:" + status);


        if (status == AuthenticationStatus.SUCCESS) {
            System.out.println("Authentication successful");


            response.sendRedirect(request.getContextPath() + "/redirect-after-login");



        } else {
            System.out.println("Authentication failed");
            throw new LoginFailedException("Invalid username or password");
        }

    }
}
