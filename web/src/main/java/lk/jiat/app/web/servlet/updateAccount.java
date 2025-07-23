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
import lk.jiat.app.core.service.UserService;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.IOException;

@WebServlet("/admin/updateUser")
public class updateAccount extends HttpServlet {

    @EJB
    private UserService userService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam != null) {
                Long userId = Long.parseLong(idParam);


                User user = userService.getUserById(userId);
                if (user != null) {
                    User users = userService.getUserWithAccountsById(userId);
                    request.setAttribute("editUser", users);
                }
            }

            request.getRequestDispatcher("/admin/updateUser.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp?error=loadUserError");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get form parameters
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String accountTypeId = request.getParameter("accountType");

            // Find the user by username
            User user = userService.getUserByUsername(username);
            if (user != null) {
                // Update user fields
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setPassword(password);

                Account account = new Account();
                // Set account type
                AccountType accountType = new AccountType();
                accountType.setId(Long.parseLong(accountTypeId));
                account.setAccountType(accountType);

                // Update user in database
                userService.updateUser(user);

                System.out.println("User updated!");
                response.sendRedirect(request.getContextPath() + "/admin/index.jsp?success=true");
            } else {
                // User not found
                response.sendRedirect(request.getContextPath() + "/admin/updateUser.jsp?error=userNotFound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp?error=unknown");
        }
    }
}
