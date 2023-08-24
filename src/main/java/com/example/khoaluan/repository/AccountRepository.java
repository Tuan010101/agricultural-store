package com.example.khoaluan.repository;

import com.example.khoaluan.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Long> {
    boolean existsByUser(String user);
    boolean existsByUserAndPass(String user, String pass);
    Account findByUser(String user);
    Account findByAccountId(Long accountId);
}
