package lk.jiat.app.ejb.bean;

import jakarta.annotation.Resource;
import jakarta.ejb.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.Transaction;
import lk.jiat.app.core.model.User;
import lk.jiat.app.core.service.*;

import java.math.BigDecimal;
import java.util.logging.Logger;
import java.util.logging.Level;

import jakarta.ejb.Timer;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ScheduledSessionBean implements ScheduledService {


    @Resource
    private TimerService timerService;

    // Method to create a one-time timer for a future date
    @Override
    public void scheduleTransfer(Transaction transaction) {
        try {
            em.persist(transaction);

            TimerConfig config = new TimerConfig(transaction, false);
            timerService.createSingleActionTimer(transaction.getScheduledDate(), config);
            logger.info("Scheduled transfer created for user: " + transaction.getFrom_account());


        } catch (Exception e) {
            logger.log(Level.SEVERE, "Failed to schedule transfer", e);
            throw new EJBException("Failed to schedule transfer: " + e.getMessage());
        }
    }


    // Triggered automatically by the EJB container when the timer fires
    // Retrieve accounts, validate balance, transfer funds

    @Timeout
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    @Override
    public void processScheduledTransfer(Timer timer) {
        Transaction transaction = (Transaction) timer.getInfo();

        try {
            logger.info("Processing scheduled transfer for transaction ID: " + transaction.getId());

            Account fromAccount = accountService.getAccountById(transaction.getFrom_account().getId());
            Account toAccount = accountService.getAccountById(transaction.getToAccount().getId());

            if (fromAccount == null || toAccount == null) {
                logger.severe("Account not found for users");
                transaction.setStatus("FAILED");
                transactionService.updateTransaction(transaction);
                return;
            }

            BigDecimal amount = transaction.getAmount();

            if (fromAccount.getBalance().compareTo(amount) < 0) {
                logger.warning("Insufficient balance for scheduled transfer. Transaction ID: " + transaction.getId());
                transaction.setStatus("FAILED");
                transactionService.updateTransaction(transaction);
                return;
            }

            fromAccount.setBalance(fromAccount.getBalance().subtract(amount));
            toAccount.setBalance(toAccount.getBalance().add(amount));

            accountService.updateAccount(fromAccount);
            accountService.updateAccount(toAccount);
            transaction.setStatus("COMPLETED");
            transactionService.updateTransaction(transaction);
            logger.info("Scheduled transfer completed successfully for transaction ID: " + transaction.getId());

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error processing scheduled transfer", e);
            throw new EJBException("Failed to process scheduled transfer: " + e.getMessage());
        }
    }


    private static final Logger logger = Logger.getLogger(ScheduledSessionBean.class.getName());


    @EJB
    private TransactionService transactionService;

    @EJB
    private UserService userService;

    @EJB
    private AccountServiceLocal accountService;

    @EJB
    private TransactionTypeService transactionTypeService;


    @PersistenceContext
    private EntityManager em;


}

