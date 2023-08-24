package com.example.khoaluan.service.cart;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Cart;
import com.example.khoaluan.repository.cartRepository.CartRepository;
import com.example.khoaluan.repository.cartRepository.CartRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartRepository cartRepository;

    @Autowired
    CartRepositoryCustom cartRepositoryCustom;

    @Override
    public void save(Cart cart) {
        cartRepository.save(cart);
    }

    @Override
    public void saveAll(List<Cart> carts) {
        cartRepository.saveAll(carts);
    }

    @Override
    public Long countByAccountId(Long id) {
        return cartRepository.countByAccountId(id);
    }

    @Override
    public boolean existsByProductIdAndAccountAndStatus(Long productId, Account account, Long status) {
        return cartRepository.existsByProductIdAndAccountAndStatus(productId, account, status);
    }

    @Override
    public void update(Cart cartRequest) {
        Cart cart = cartRepository.findByProductIdAndAccount(cartRequest.getProductId(), cartRequest.getAccount());
        cart.setAmount(cart.getAmount() + cartRequest.getAmount());
        cartRepository.save(cart);
    }

    @Override
    public void deleteByCartId(Long cartId) {
        cartRepository.deleteByCartId(cartId);
    }

    @Override
    public List<CartDto> getListCartDtoByAccountId(Long accountId) {
        return cartRepositoryCustom.getListCartDtoByAccountId(accountId);
    }

    @Override
    public void increaseProduct(Long cartId) {
        Cart cart = cartRepository.findByCartId(cartId);
        if(cart.getAmount() < 50){
            cart.setAmount(cart.getAmount() + 1);
            cartRepository.save(cart);
        }
    }

    @Override
    public void decreaseProduct(Long cartId) {
        Cart cart = cartRepository.findByCartId(cartId);
        if(cart.getAmount() > 1){
            cart.setAmount(cart.getAmount() - 1);
            cartRepository.save(cart);
        }
    }

    @Override
    public void updateStatus(Long account_id, Cart cart) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        Date now = new Date();
        Date dateNow = format.parse(format.format(now));
        List<Cart> carts = cartRepository.findByAccount_AccountIdAndStatus(account_id, 0L);
        List<Cart> cartsUpdate = new ArrayList<>();
        for (Cart cart1 : carts){
            cart1.setStatus(1L);
            cart1.setAddress(cart.getAddress());
            cart1.setEmail(cart.getEmail());
            cart1.setPhone(cart.getPhone());
            cart1.setName(cart.getName());
            cart1.setPaymentMethod("Thanh toán khi nhận hàng");
            cart1.setStatusShip(0L);
            cart1.setDate(dateNow);
            cartsUpdate.add(cart1);
        }
        cartRepository.saveAll(cartsUpdate);
    }

    @Override
    public List<Cart> findByAccount_AccountIdAndStatus1(Long account_id, Long status) {
        return cartRepository.findByAccount_AccountIdAndStatus1(account_id, status);
    }

    @Override
    public List<Cart> findByAccount_AccountIdAndDate(Long account_id, Date date) {
        return cartRepository.findByAccount_AccountIdAndDate(account_id, date);
    }
}
