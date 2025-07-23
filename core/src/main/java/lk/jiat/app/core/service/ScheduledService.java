package lk.jiat.app.core.service;

import jakarta.ejb.Local;
import jakarta.ejb.Remote;

import jakarta.ejb.Timer;
import lk.jiat.app.core.model.Transaction;

@Local
public interface ScheduledService {
    void scheduleTransfer(Transaction transaction);

    void processScheduledTransfer(Timer timer);


}
