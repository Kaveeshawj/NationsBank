package lk.jiat.app.core.service;

import jakarta.ejb.Local;
import jakarta.ejb.Lock;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.app.core.model.AccountType;

import java.util.List;

@Local
public interface AccountTypeServiceLocal {

    List<AccountType> getAllAccountTypes();

    AccountType getAccountTypeById(Long id);

    void addAccountType(AccountType accountType);

    void updateAccountType(AccountType accountType);

    void deleteAccountType(Long id);
}
