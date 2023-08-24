package com.example.khoaluan.service.product;

import com.example.khoaluan.model.Product;
import com.example.khoaluan.repository.productRepository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductRepository productRepository;

    @Override
    public void saveProduct(Product product) {
        productRepository.save(product);
    }

    @Override
    public List<Product> findAllProduct() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> findAllProductByCateId(Long id) {
        return productRepository.findAllByCateId(id);
    }

    @Override
    public Product findByProductId(Long id) {
        return productRepository.findByProductId(id);
    }

    @Override
    public void deleteByProductId(Long productId) {
        productRepository.deleteByProductId(productId);
    }

    @Override
    public Boolean updateProduct(Product productNew) {
        Product product = productRepository.findByProductId(productNew.getProductId());
        product.setPrice(productNew.getPrice());
        product.setDescription(productNew.getDescription());
        product.setCateId(productNew.getCateId());
        product.setImage(productNew.getImage());
        product.setName(productNew.getName());
        return true;
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public List<Product> find4LatestProducts() {
        return productRepository.find4LatestProducts();
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

}
