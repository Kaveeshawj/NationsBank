package lk.jiat.app.core.service;

import jakarta.ejb.Local;
import lk.jiat.app.core.model.Transaction;

import java.util.List;
import java.util.Timer;

@Local
public interface TransactionService {
    void saveTransaction(Transaction transaction);
    void updateTransaction(Transaction transaction);
    List<Transaction> getAllTransactions();
    List<Transaction> getTransactionsByUser(Long userId);

}
