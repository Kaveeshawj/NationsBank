package lk.jiat.app.ejb.bean;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.app.core.model.TransactionType;
import lk.jiat.app.core.service.TransactionTypeService;

@Stateless
public class TransactionTypeSessionBean implements TransactionTypeService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public TransactionType findById(int id) {
        return em.find(TransactionType.class, id);
    }
}
