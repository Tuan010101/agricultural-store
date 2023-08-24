package com.example.khoaluan.service.product;

import com.example.khoaluan.model.Product;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ProductService {

    void saveProduct(Product product);

    List<Product> findAllProduct();

    List<Product> findAllProductByCateId(Long id);

    Product findByProductId(Long id);

    @Transactional
    void deleteByProductId(Long productId);

    @Transactional
    Boolean updateProduct(Product product);

    List<Product> findByName(String name);

    List<Product> find4LatestProducts();

    List<Product> findAll();
}
