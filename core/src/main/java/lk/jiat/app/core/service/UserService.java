package lk.jiat.app.core.service;

import jakarta.ejb.Remote;
import lk.jiat.app.core.model.User;

import java.util.List;

@Remote
public interface UserService {
    User getUserById(Long id);

    User getUserByUsername(String username);

    User addUser(User user);

    List<User> getAllUsers();

    User getUserByAccountNumber(String accountNumber);


    void updateUser(User user);

    void deleteUser(User user);

    boolean validate(String username, String password);
    User getUserWithAccountsById(Long id);





}
