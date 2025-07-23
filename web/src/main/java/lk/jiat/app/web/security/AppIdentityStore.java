package lk.jiat.app.web.security;

import jakarta.ejb.EJB;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.security.enterprise.credential.Credential;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.security.enterprise.identitystore.CredentialValidationResult;
import jakarta.security.enterprise.identitystore.IdentityStore;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.AccountServiceLocal;
import lk.jiat.app.core.service.AccountTypeServiceLocal;
import lk.jiat.app.core.service.UserService;

import java.math.BigDecimal;
import java.util.Set;

@ApplicationScoped
public class AppIdentityStore implements IdentityStore {

    @EJB
    private UserService userService;

    @Inject
    private ServletContext servletContext;

    @Inject
    private HttpSession httpSession;

    @EJB
    private AccountServiceLocal accountService;

    @Override
    public CredentialValidationResult validate(Credential credential) {
        if (credential instanceof UsernamePasswordCredential) {
            UsernamePasswordCredential upc = (UsernamePasswordCredential) credential;

            String username = upc.getCaller();
            String password = upc.getPasswordAsString();

            System.out.println("Username: " + username);
            System.out.println("Password: " + password);

            try {
                boolean isValid = userService.validate(username, password);
                if (isValid) {
                    User user = userService.getUserByUsername(username);

                    if (user == null || !"ACTIVE".equalsIgnoreCase(user.getStatus())) {
                        return CredentialValidationResult.INVALID_RESULT;
                    }

                    httpSession.setAttribute("currentUser", user);

                    Account account = accountService.getAccountByUser(user);

                    if (account != null) {
                        BigDecimal balance = account.getBalance();

                        httpSession.setAttribute("userAccount", account);
                        httpSession.setAttribute("userBalance", balance);
                    }

                    if (user != null && user.getRole() != null) {
                        String roleName = user.getRole().getRole();
                        System.out.println("******Role: " + roleName);

                        servletContext.setAttribute("userRole", roleName);

                        return new CredentialValidationResult(username, Set.of(roleName));
                    }

                    System.out.println("Username: " + username);
                    System.out.println("Password: " + password);
                    System.out.println("Validation status: " + isValid);



                    return new CredentialValidationResult(username, Set.of("USER"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return CredentialValidationResult.INVALID_RESULT;
    }
}
