package com.example.khoaluan.repository.productRepository;

import com.example.khoaluan.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findAll();

    List<Product> findAllByCateId(Long cateId);

    Product findByProductId(Long id);

    @Query(value = "SELECT * FROM product order by product.id desc limit 4;", nativeQuery = true)
    List<Product> findProductLimit4();

    void deleteByProductId(Long productId);

    @Query(value = "SELECT * FROM coffee.product where product.name like %?1%", nativeQuery = true)
    List<Product> findByName(String name);

    @Query(value = "SELECT * FROM coffee.product order by product.id desc limit 4", nativeQuery = true)
    List<Product> find4LatestProducts();
}
