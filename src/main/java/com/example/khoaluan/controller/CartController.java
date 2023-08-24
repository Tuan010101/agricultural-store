package com.example.khoaluan.controller;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Cart;
import com.example.khoaluan.model.Product;
import com.example.khoaluan.service.account.AccountService;
import com.example.khoaluan.service.cart.CartService;
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
import java.util.List;

@Slf4j
@Controller
public class CartController {

    @Autowired
    CartService cartService;

    @Autowired
    AccountService accountService;

    @Autowired
    ProductService productService;

    @GetMapping("/cart")
    public String cart(Model model,
                       HttpSession session) {

        Account account = (Account) session.getAttribute("account");
        if(account == null){
            List<Product> products = productService.find4LatestProducts();
            model.addAttribute("fourLatestProducts", products);
            return "cart";
        }

        List<CartDto> cartDtos = cartService.getListCartDtoByAccountId(account.getAccountId());
        long sum = 0;
        for (CartDto cartDto : cartDtos){
            sum += cartDto.getAmount() * cartDto.getPrice();
        }

        List<Product> products = productService.find4LatestProducts();

        String active = "shop";
        model.addAttribute("active", active);
        model.addAttribute("cartDtos", cartDtos);
        model.addAttribute("sum", sum);
        model.addAttribute("fourLatestProducts", products);
        return "cart";
    }

    @PostMapping("/cart/items")
    public String addItemsToCart(Model model,
                                 HttpSession session,
                                 @ModelAttribute Cart cart) {

        Long pathId = cart.getProductId();
        Account account = (Account) session.getAttribute("account");
        if(account == null){
            return "redirect:/products/"+pathId+"?status=insert_faild";
        }
        cart.setAccount(account);
        cart.setStatus(0L);

        //Neu da ton tai san pham trong gio hang thi chi can tang so luong san pham
        if(cartService.existsByProductIdAndAccountAndStatus(cart.getProductId(), cart.getAccount(), 0L)) {
            cartService.update(cart);
            return "redirect:/products/"+pathId+"?status=insert_success";
        }
        cartService.save(cart);

        // reload amount cart
        Long quantity = (Long) session.getAttribute("quantity");
        quantity++;
        session.setAttribute("quantity",quantity);
        return "redirect:/products/"+pathId+"?status=insert_success";
    }

    @PostMapping("/cart/delete/{id}")
    public String deleteProduct(Model model , HttpSession session, @PathVariable Long id){

        log.info("cartId delete: {}", id);

        cartService.deleteByCartId(id);

        Long quantity = (Long) session.getAttribute("quantity");
        quantity--;
        session.setAttribute("quantity",quantity);

        return "redirect:/cart?status=delete_success";
    }

    @PostMapping("/cart/{cartId}/increase")
    public String increaseProductInCart(Model model, @PathVariable Long cartId){
        log.info("increase cartId: {}", cartId);
        cartService.increaseProduct(cartId);
        return "redirect:/cart";
    }

    @PostMapping("/cart/{cartId}/decrease")
    public String decreaseProductInCart(Model model, @PathVariable Long cartId){
        log.info("decrease cartId: {}", cartId);
        cartService.decreaseProduct(cartId);
        return "redirect:/cart";
    }
}
