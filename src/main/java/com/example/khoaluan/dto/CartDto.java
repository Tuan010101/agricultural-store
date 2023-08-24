package com.example.khoaluan.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
    private Long cartId;
    private Long amount;
    private String image;
    private String name;
    private String description;
    private Double price;
    private String date;
    private String userName;
    private String userAddress;
    private String userEmail;
    private String userPhone;
    private String paymentMethod;
    private Long statusShip;
    private Long accountId;
}
