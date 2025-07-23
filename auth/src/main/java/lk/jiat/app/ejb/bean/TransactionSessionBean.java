package lk.jiat.app.ejb.bean;


import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.app.core.model.Transaction;
import lk.jiat.app.core.service.TransactionService;

import java.util.List;

@Stateless
public class TransactionSessionBean implements TransactionService {

    @PersistenceContext
    private EntityManager em;

    // Fund transfers must be atomic, so we use REQUIRED to either commit or
    // rollback all changes
    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
    public void saveTransaction(Transaction transaction) {
        em.persist(transaction);
    }


    // Read-only operation; no transaction needed
    @Override
    @TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
    public List<Transaction> getAllTransactions() {
        return em.createQuery("SELECT t FROM Transaction t ORDER BY t.createdAt DESC", Transaction.class)
                .getResultList();
    }

    @Override
    public List<Transaction> getTransactionsByUser(Long userId) {
        return em.createQuery(
                        "SELECT t FROM Transaction t WHERE t.from_account.user.id = :userId OR t.toAccount.user.id = :userId ORDER BY t.createdAt DESC",
                        Transaction.class)
                .setParameter("userId", userId)
                .getResultList();
    }


    @Override
    public void updateTransaction(Transaction transaction) {
        em.merge(transaction);

    }
}




