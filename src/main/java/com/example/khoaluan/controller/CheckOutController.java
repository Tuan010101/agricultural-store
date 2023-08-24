package com.example.khoaluan.controller;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Category;
import com.example.khoaluan.service.cart.CartService;
import com.example.khoaluan.service.category.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class CheckOutController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    CartService cartService;

    @GetMapping("/checkout")
    public String checkout(Model model, HttpSession session) {

        Account account = (Account) session.getAttribute("account");
        if(account == null){
            return "sign-in";
        }

        List<CartDto> cartDtos = cartService.getListCartDtoByAccountId(account.getAccountId());
        if(cartDtos.isEmpty()){
            return "redirect:/cart?status=fail_checkout";
        }
        long sum = 0;
        for (CartDto cartDto : cartDtos){
            sum += cartDto.getAmount() * cartDto.getPrice();
        }

        List<Category> categories;
        categories = categoryService.findAllCategory();

        String active = "shop";
        model.addAttribute("active", active);
        model.addAttribute("categories", categories);
        model.addAttribute("cartDtos", cartDtos);
        model.addAttribute("sum", sum);
        return "checkout";
    }
}
