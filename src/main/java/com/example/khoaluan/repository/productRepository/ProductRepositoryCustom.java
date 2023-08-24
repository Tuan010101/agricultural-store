package com.example.khoaluan.repository.productRepository;

import com.example.khoaluan.dto.ProductDto;

import java.util.List;

public interface ProductRepositoryCustom {

    List<ProductDto> getListProductDto();

    List<ProductDto> findByNameAndCateId(String name, String cateId);
}
