package com.example.khoaluan.service.cart;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Cart;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

public interface CartService {

    void save(Cart cart);

    void saveAll(List<Cart> carts);

    Long countByAccountId(Long id);

    boolean existsByProductIdAndAccountAndStatus(Long productId, Account account, Long status);

    void update(Cart cart);

    void deleteByCartId(Long cartId);

    List<CartDto> getListCartDtoByAccountId(Long accountId);

    void increaseProduct(Long cartId);

    void decreaseProduct(Long cartId);

    void updateStatus(Long account_id, Cart cart) throws ParseException;

    List<Cart> findByAccount_AccountIdAndStatus1(Long account_id, Long status);

    List<Cart> findByAccount_AccountIdAndDate(Long account_id, Date date);
}
