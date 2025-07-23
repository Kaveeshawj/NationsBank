package lk.jiat.app.web.servlet;

import jakarta.annotation.Resource;
import jakarta.ejb.EJB;
import jakarta.inject.Inject;
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
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/register")
public class Register extends HttpServlet {

    @EJB
    private UserService userService;

    @EJB
    private AccountServiceLocal accountService;

    @EJB
    private AccountTypeServiceLocal accountTypeService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String accNo = request.getParameter("accNo");
        String accTypeId = request.getParameter("accType");

        String encryptedPassword = Encryption.encrypt(password);

        Long roleId = 1L;

        User user = new User();
        user.setUsername(username);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(encryptedPassword);


        Role role = new Role();
        role.setId(roleId);
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
        accountService.updateAccount(account);


        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }


}
