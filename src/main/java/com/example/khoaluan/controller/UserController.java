package com.example.khoaluan.controller;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Cart;
import com.example.khoaluan.repository.cartRepository.CartRepositoryCustom;
import com.example.khoaluan.service.cart.CartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
public class UserController {

    @Autowired
    CartService cartService;

    @Autowired
    CartRepositoryCustom cartRepositoryCustom;

    @GetMapping("/user/history")
    public String history(Model model, HttpSession session){
        Account account = (Account) session.getAttribute("account");
        if(account == null){
            return "sign-in";
        }
        List<List<CartDto>> listsCarts = new ArrayList<>();
        List<CartDto> coincideCart = new ArrayList<>();
        List<CartDto> carts = new ArrayList<>();
        if(account.getRole() != 1L){
            carts = cartRepositoryCustom.getListCartDtoByAccountIdAndStatus1(account.getAccountId());
            if(carts.size() == 1){
                listsCarts.add(new ArrayList<>(carts));
                model.addAttribute("listsCarts", listsCarts);
                return "order-history";
            }
        }else {
            carts = cartRepositoryCustom.getListCartDtoByAdminAndStatus1();
        }

        for(int i = 0; i < carts.size() - 1; i++) {
            coincideCart.add(carts.get(i));
            if (i + 1 != carts.size() - 1) {
                if (!carts.get(i).getDate().equals(carts.get(i + 1).getDate())) {
                    listsCarts.add(new ArrayList<>(coincideCart));
                    coincideCart.clear();
                }
            } else {
                if(carts.get(i).getDate().equals(carts.get(i + 1).getDate())){
                    coincideCart.add(carts.get(i + 1));
                    listsCarts.add(new ArrayList<>(coincideCart));
                }else {
                    listsCarts.add(new ArrayList<>(coincideCart));
                    coincideCart.clear();
                    coincideCart.add(carts.get(i+1));
                    listsCarts.add(new ArrayList<>(coincideCart));
                }
            }
        }

        model.addAttribute("listsCarts", listsCarts);
        return "order-history";
    }

    @PostMapping("/user/history")
    public String orderHistory(Model model, @ModelAttribute Cart cart, HttpSession session) throws ParseException {
        Account account = (Account) session.getAttribute("account");
        if(account == null){
            return "sign-in";
        }
        cartService.updateStatus(account.getAccountId(), cart);

        Long quantity = 0L;
        session.setAttribute("quantity", quantity);
        return "redirect:/user/history";
    }

    @PostMapping("/user/history/delete/{accountId}/{dateString}")
    public String deleteOrder(Model model, @PathVariable Long accountId, @PathVariable String dateString){

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = dateFormat.parse(dateString);
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<Cart> carts = cartService.findByAccount_AccountIdAndDate(accountId, date);

        List<Cart> cartListUpdate = new ArrayList<>();

        for(Cart cart : carts){
            cart.setStatus(2L);
            cartListUpdate.add(cart);
        }
        cartService.saveAll(cartListUpdate);

        return "redirect:/user/history?status=cancel_success";
    }

    @PostMapping("/user/history/update-status-ship/{accountId}/{dateString}")
    public String updateShipOrder(Model model, @PathVariable Long accountId, @PathVariable String dateString, @ModelAttribute CartDto cartDto){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = dateFormat.parse(dateString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Cart> carts = cartService.findByAccount_AccountIdAndDate(accountId, date);

        List<Cart> cartListUpdate = new ArrayList<>();

        for(Cart cart : carts){
            cart.setStatusShip(cartDto.getStatusShip());
            cartListUpdate.add(cart);
        }
        cartService.saveAll(cartListUpdate);

        return "redirect:/user/history?status=update_success";
    }
}
