package lk.jiat.app.ejb.bean;

import jakarta.ejb.Schedule;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.Transaction;
import lk.jiat.app.core.model.TransactionType;
import lk.jiat.app.core.service.AccountServiceLocal;
import lk.jiat.app.core.service.TransactionService;

import java.math.BigDecimal;
import java.util.List;

@Stateless
public class InterestTimerBean {

    @Inject
    private AccountServiceLocal accountService;

    @Inject
    private TransactionService transactionService;

    //daily interest is calculated but balance will not update in the account
    @Schedule(hour = "0", minute = "0", second = "0", persistent = true)
    public void accrueDailyInterest() {
        List<Account> accounts = accountService.getAllAccounts();

        for (Account account : accounts) {
            if (!"SAVINGS".equalsIgnoreCase(account.getAccountType().getAccountType())) continue;

            BigDecimal balance = account.getBalance();
            BigDecimal interest = balance.multiply(DAILY_INTEREST_RATE);

            // Accumulate interest (don't add to balance yet)
            BigDecimal currentAccrued = account.getAccruedInterest() != null ? account.getAccruedInterest() : BigDecimal.ZERO;
            account.setAccruedInterest(currentAccrued.add(interest));

            accountService.updateAccount(account);
            System.out.println("Accrued " + interest + " for account " + account.getAccountNumber());
        }
    }

    //interest will be credited to the account ath the last day of each month at 12AM
    @Schedule(dayOfMonth = "Last", hour = "0", minute = "0", second = "0", persistent = true)
    public void creditMonthlyInterest() {
        List<Account> accounts = accountService.getAllAccounts();

        for (Account account : accounts) {
            if (!"SAVINGS".equalsIgnoreCase(account.getAccountType().getAccountType())) continue;

            BigDecimal totalInterest = account.getAccruedInterest();
            if (totalInterest == null || totalInterest.compareTo(BigDecimal.ZERO) <= 0) continue;

            // Add to balance
            account.setBalance(account.getBalance().add(totalInterest));

            // Reset accrued interest
            account.setAccruedInterest(BigDecimal.ZERO);
            accountService.updateAccount(account);

            // Save transaction
            Transaction tx = new Transaction();
            tx.setToAccount(account);
            tx.setAmount(totalInterest);
            tx.setDescription("Monthly interest credited");
            tx.setStatus("COMPLETED");
            tx.setFrom_account(null);

            TransactionType interestType = new TransactionType();
            interestType.setId(4); // INTEREST
            tx.setTransaction_type(interestType);

            transactionService.saveTransaction(tx);

            System.out.println("Credited monthly interest of " + totalInterest + " to " + account.getAccountNumber());
        }
    }



    private static final BigDecimal ANNUAL_INTEREST_RATE = new BigDecimal("0.05");
    private static final BigDecimal DAILY_INTEREST_RATE = ANNUAL_INTEREST_RATE.divide(new BigDecimal("365"), 5, BigDecimal.ROUND_HALF_UP);



}




