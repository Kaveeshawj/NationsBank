package lk.jiat.app.ejb.bean;

import jakarta.annotation.security.DeclareRoles;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.UserService;
import lk.jiat.app.core.util.Encryption;

import java.util.List;

@DeclareRoles({"USER", "ADMIN", "SUPER_ADMIN"})
@Stateless
public class UserSessionBean implements UserService {

    @PersistenceContext
    private EntityManager em;


    @RolesAllowed({"USER", "ADMIN", "SUPER_ADMIN"})
    @Override
    public void updateUser(User user) {
        em.merge(user);
    }


    @RolesAllowed({"ADMIN", "SUPER_ADMIN"})
    @Override
    public void deleteUser(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User is null");
        }

        User managedUser = em.find(User.class, user.getId());
        if (managedUser == null) return;

        managedUser.setStatus("INACTIVE");

        for (Account acc : managedUser.getAccounts()) {
            if (!hasLinkedTransactions(acc.getId())) {
                acc.setStatus("INACTIVE");
                em.merge(acc);
            } else {
                System.out.println("Account ID " + acc.getId() + " has transactions. Skipping status update.");
            }
        }

        em.merge(managedUser);
    }

    @RolesAllowed({"ADMIN", "SUPER_ADMIN"})
    @Override
    public User addUser(User user) {
        em.persist(user);
        em.flush();
        return user;
    }


    @Override
    public User getUserById(Long id) {
        return em.find(User.class, id);
    }


    @Override
    public User getUserByUsername(String username) {
        try {
            return em.createNamedQuery("User.findByUsername", User.class)
                    .setParameter("username", username)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (Exception e) {
            e.printStackTrace(); // optional logging
            return null;
        }
    }


    @Override
    public List<User> getAllUsers() {
        return em.createQuery("SELECT DISTINCT u FROM User u LEFT JOIN FETCH u.accounts", User.class)
                .getResultList();
    }


    @Override
    public User getUserByAccountNumber(String accountNumber) {
        try {
            return em.createQuery(
                            "SELECT u FROM Account a JOIN a.user u WHERE a.accountNumber = :acc", User.class)
                    .setParameter("acc", accountNumber)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }


    private boolean hasLinkedTransactions(Long accountId) {
        try {
            Long count = em.createQuery(
                            "SELECT COUNT(t) FROM Transaction t WHERE t.from_account.id = :accId OR t.toAccount.id = :accId",
                            Long.class
                    )
                    .setParameter("accId", accountId)
                    .getSingleResult();

            return count != null && count > 0;
        } catch (Exception e) {
            e.printStackTrace(); // Optional log
            return true; // Defensive fallback
        }
    }


    @Override
    public boolean validate(String username, String password) {
        try {
            User user = getUserByUsername(username);
            if (user == null) {
                System.out.println("User not found for username: " + username);
                return false;
            }

            String encryptedInput = Encryption.encrypt(password);
            System.out.println("Encrypted input: " + encryptedInput);
            System.out.println("Password from DB: " + user.getPassword());

            return user.getPassword().equals(encryptedInput);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User getUserWithAccountsById(Long id) {
        return em.createQuery("SELECT u FROM User u LEFT JOIN FETCH u.accounts WHERE u.id = :id", User.class)
                .setParameter("id", id)
                .getSingleResult();
    }


}
