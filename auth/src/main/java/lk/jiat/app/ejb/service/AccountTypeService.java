package lk.jiat.app.ejb.service;


import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.app.core.model.AccountType;
import lk.jiat.app.core.service.AccountTypeServiceLocal;

import java.util.List;

@Stateless
public class AccountTypeService implements AccountTypeServiceLocal {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<AccountType> getAllAccountTypes() {
        return entityManager.createQuery("SELECT at FROM AccountType at", AccountType.class)
                .getResultList();
    }

    @Override
    public AccountType getAccountTypeById(Long id) {
        return entityManager.find(AccountType.class, id);
    }

    @Override
    public void addAccountType(AccountType accountType) {
        entityManager.persist(accountType);
    }

    @Override
    public void updateAccountType(AccountType accountType) {
        entityManager.merge(accountType);
    }

    @Override
    public void deleteAccountType(Long id) {
        AccountType accountType = entityManager.find(AccountType.class, id);
        if (accountType != null) {
            entityManager.remove(accountType);
        }
    }
}