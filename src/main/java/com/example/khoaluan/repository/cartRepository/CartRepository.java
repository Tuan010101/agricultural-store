package com.example.khoaluan.repository.cartRepository;

import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public interface CartRepository extends JpaRepository<Cart, Long> {

    @Query(value = "SELECT count(product_id) FROM coffee.cart where account_id = ?1 and status = 0", nativeQuery = true)
    Long countByAccountId(Long id);

    boolean existsByProductIdAndAccountAndStatus(Long productId, Account account, Long status);

    Cart findByProductIdAndAccount(Long productId, Account account);

    @Transactional
    void deleteByCartId(Long cartId);

    Cart findByCartId(Long cartId);

//    @Query(value = "SELECT * FROM coffee.cart where status = 0 and account_id = ?1;", nativeQuery = true)
    List<Cart> findByAccount_AccountIdAndStatus(Long account_id, Long status);

    @Query(value = "SELECT * FROM coffee.cart where status = 1 and account_id = ?1 order by date desc;", nativeQuery = true)
    List<Cart> findByAccount_AccountIdAndStatus1(Long account_id, Long status);

    List<Cart> findByAccount_AccountIdAndDate(Long account_id, Date date);
}
