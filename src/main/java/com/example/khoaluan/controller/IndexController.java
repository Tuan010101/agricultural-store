package com.example.khoaluan.controller;

import com.example.khoaluan.model.Product;
import com.example.khoaluan.repository.AccountRepository;
import com.example.khoaluan.service.cart.CartService;
import com.example.khoaluan.service.product.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    ProductService productService;

    @GetMapping(value = { "/", "/index"})
    public String index(Model model) {

        List<Product> products = productService.find4LatestProducts();

        String active = "index";
        model.addAttribute("active", active);
        model.addAttribute("fourLatestProducts", products);
        return "index";
    }
    @GetMapping("/about")
    public String about(Model model) {

        String active = "about";
        model.addAttribute("active", active);
        return "about";
    }

    @GetMapping("/contact")
    public String contact(Model model) {

        String active = "contact";
        model.addAttribute("active", active);
        return "contact";
    }
    @GetMapping("/menu")
    public String menu(Model model) {

        String active = "menu";
        model.addAttribute("active", active);
        return "menu";
    }

    @GetMapping("/services")
    public String services(Model model) {

        String active = "services";
        model.addAttribute("active", active);
        return "services";
    }
}
