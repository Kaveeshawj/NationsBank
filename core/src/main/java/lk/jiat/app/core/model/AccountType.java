package lk.jiat.app.core.model;

import jakarta.persistence.*;

@Entity
@Table(name = "accounttype")
public class AccountType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "accountType", nullable = false)
    private String accountType;

    public AccountType() {}

    public AccountType(String accountType) {
        this.accountType = accountType;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }
}
