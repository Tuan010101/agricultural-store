package com.example.khoaluan.service.account;

import com.example.khoaluan.model.Account;

public interface AccountService {
    boolean existsByUser(String user);

    boolean existsByUserAndPass(String user, String pass);

    void save(Account account);

    Account findByUser(String user);

    Account findByAccountId(Long accountId);
}
