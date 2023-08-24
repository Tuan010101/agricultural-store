package com.example.khoaluan.controller;

import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Cart;
import com.example.khoaluan.model.Category;
import com.example.khoaluan.model.Product;
import com.example.khoaluan.service.cart.CartService;
import com.example.khoaluan.service.category.CategoryService;
import com.example.khoaluan.service.product.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class ShopController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    @GetMapping("/categories")
    public String shop(Model model, @ModelAttribute Product product) {

        log.info("product: {}", product);


        //Search
        if(product.getName() != null){
            List<Category> categories;
            categories = categoryService.findAllCategory();
            List<Product> allProductList;
            allProductList = productService.findByName(product.getName());

            int activeCategory = 0;
            String active = "shop";
            model.addAttribute("active", active);
            model.addAttribute("activeCategory", activeCategory);
            model.addAttribute("categories", categories);
            model.addAttribute("allProductList", allProductList);
            return "shop";
        }

        List<Category> categories;
        categories = categoryService.findAllCategory();
        List<Product> allProductList;
        allProductList = productService.findAllProduct();

        int activeCategory = 0;
        String active = "shop";
        model.addAttribute("active", active);
        model.addAttribute("activeCategory", activeCategory);
        model.addAttribute("categories", categories);
        model.addAttribute("allProductList", allProductList);
        return "shop";
    }

    @GetMapping("/categories/{id}")
    public String shop(Model model, @PathVariable Long id) {
        List<Category> categories;
        categories = categoryService.findAllCategory();

        List<Product> productListByCateId;
        productListByCateId = productService.findAllProductByCateId(id);

        String active = "shop";
        model.addAttribute("active", active);
        model.addAttribute("activeCategory", id);
        model.addAttribute("categories", categories);
        model.addAttribute("allProductList", productListByCateId);
        return "shop";
    }

    @GetMapping("/products/{id}")
    public String productSingle(Model model, @PathVariable Long id) {
        Product product = productService.findByProductId(id);

        List<Product> products = productService.find4LatestProducts();

        model.addAttribute("product", product);
        model.addAttribute("id",id);
        model.addAttribute("fourLatestProducts", products);
        return "product-single";
    }
}
