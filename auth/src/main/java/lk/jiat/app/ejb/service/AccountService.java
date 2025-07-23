package lk.jiat.app.ejb.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.AccountServiceLocal;

import java.util.List;

@Stateless
public class AccountService implements AccountServiceLocal {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void addAccount(Account account) {
        em.persist(account);
    }

    @Override
    public void updateAccount(Account account) {
        em.merge(account);
    }

    @Override
    public Account getAccountByNumber(String accountNumber) {
        try {
            return em.createQuery("SELECT a FROM Account a WHERE a.accountNumber = :accountNumber", Account.class)
                    .setParameter("accountNumber", accountNumber)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }    }

    @Override
    public Account getAccountByUser(User user) {
        if (user == null) {
            return null;
        }

        try {
            return em.createQuery("SELECT a FROM Account a WHERE a.user = :user", Account.class)
                    .setParameter("user", user)
                    .setMaxResults(1)  // Limit to 1 result
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public Account getAccountById(Long id) {
        return em.find(Account.class, id);

    }

    @Override
    public List<Account> getAllAccounts() {
        return em.createQuery("SELECT a FROM Account a", Account.class).getResultList();
    }
}