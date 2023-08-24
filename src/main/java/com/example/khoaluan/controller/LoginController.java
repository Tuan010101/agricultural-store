package com.example.khoaluan.controller;

import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Product;
import com.example.khoaluan.repository.AccountRepository;
import com.example.khoaluan.service.account.AccountService;
import com.example.khoaluan.service.cart.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    AccountService accountService;

    @Autowired
    CartService cartService;

    //Đăng nhập
    @GetMapping("/sign-in")
    public String login() {
        return "sign-in";
    }

    @PostMapping("/sign-in")
    public String postSignIn(@RequestParam("user") String user,
                             @RequestParam("pass") String pass,
                             Model model,
                             HttpSession session){
        if(accountService.existsByUserAndPass(user, pass)){
            Account account;
            account = accountService.findByUser(user);
            session.setAttribute("account", account);

            Long quantity = cartService.countByAccountId(account.getAccountId());
            session.setAttribute("quantity", quantity);
            return "index";
        }
        int p = 1;
        model.addAttribute("p", p);
        return "sign-in";
    }

    //Đăng ký
    @GetMapping("/sign-up")
    public String signUp() {
        return "sign-up";
    }

    @PostMapping("/sign-up")
    public String postSignUp(@RequestParam("user") String user,
                             @RequestParam("pass") String pass,
                             @RequestParam("rePass") String rePass,
                             Model model) {
        int p;
            if(!pass.equals(rePass)){
            p = 1;
            model.addAttribute("p", p);
            return "sign-up";
        }
        if(!accountService.existsByUser(user)){
            Account account = new Account();
            account.setUser(user);
            account.setPass(pass);
            account.setRole((long) 0);
            accountService.save(account);
            p = 2;
        }else {
            p = 3;
        }
        model.addAttribute("p", p);
        return "sign-up";
    }

    //Đăng xuất
    @GetMapping("/logout")
    public String getLogOut(HttpSession session){
        session.removeAttribute("account");
        session.removeAttribute("quantity");
        return "index";
    }
}
