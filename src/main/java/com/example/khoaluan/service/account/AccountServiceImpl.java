package com.example.khoaluan.service.account;

import com.example.khoaluan.model.Account;
import com.example.khoaluan.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountRepository accountRepository;

    @Override
    public boolean existsByUser(String user) {
        return accountRepository.existsByUser(user);
    }

    @Override
    public boolean existsByUserAndPass(String user, String pass) {
        return accountRepository.existsByUserAndPass(user, pass);
    }

    @Override
    public void save(Account account) {
        accountRepository.save(account);
    }

    @Override
    public Account findByUser(String user) {
        return accountRepository.findByUser(user);
    }

    @Override
    public Account findByAccountId(Long accountId) {
        return accountRepository.findByAccountId(accountId);
    }
}
