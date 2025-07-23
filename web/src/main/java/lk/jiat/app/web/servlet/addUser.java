package lk.jiat.app.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.app.core.exception.LoginFailedException;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.AccountType;
import lk.jiat.app.core.model.Role;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.AccountServiceLocal;
import lk.jiat.app.core.service.AccountTypeServiceLocal;
import lk.jiat.app.core.service.UserService;
import lk.jiat.app.core.util.Encryption;

import java.io.IOException;

@WebServlet("/admin/addUser")
public class addUser extends HttpServlet {

    @EJB
    private AccountServiceLocal accountService;

    @EJB
    private AccountTypeServiceLocal accountTypeService;

    @EJB
    private UserService userService;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String accNo = request.getParameter("accNo");
            String accTypeId = request.getParameter("accType");

            if (accNo == null || accNo.isEmpty()) {
                throw new ServletException("Account number is required.");
            }

            String encryptedPassword = Encryption.encrypt(password);

            User user = new User();
            user.setUsername(username);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPassword(encryptedPassword);

            Role role = new Role();
            role.setId(1L);
            user.setRole(role);

            User persistedUser = userService.addUser(user);
            Account account = accountService.getAccountByNumber(accNo);

            if (account == null) {
                throw new LoginFailedException("Account number does not exist.");
            }

            if (account.getUser() != null) {
                throw new LoginFailedException("Account is already assigned to another user.");
            }

            account.setUser(persistedUser);

            if (accTypeId != null && !accTypeId.isEmpty()) {
                AccountType accType = accountTypeService.getAccountTypeById(Long.parseLong(accTypeId));
                account.setAccountType(accType);
            }

            accountService.updateAccount(account);

            response.sendRedirect(request.getContextPath() + "/admin/addUser.jsp?success=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/addUser.jsp?error=" + e.getMessage());
        }
    }

}
