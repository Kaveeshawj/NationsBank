package lk.jiat.app.core.service;

import jakarta.ejb.Local;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.User;

import java.util.List;

@Local
public interface AccountServiceLocal {
    void addAccount(Account account);
    void updateAccount(Account account);
    Account getAccountByNumber(String accountNumber);
    Account getAccountByUser(User user);
    Account getAccountById(Long id);

    List<Account> getAllAccounts();

}
