package com.example.khoaluan.repository.cartRepository;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.dto.ProductDto;

import java.util.List;

public interface CartRepositoryCustom {

    List<CartDto> getListCartDtoByAccountId(Long accountId);

    List<CartDto> getListCartDtoByAccountIdAndStatus1(Long accountId);

    List<CartDto> getListCartDtoByAdminAndStatus1();
}
