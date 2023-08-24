package com.example.khoaluan.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TableDto {
    private Long id;
    private Long tableNumber;
    private Long amount;
    private String name;
    private Double price;
    private String date;
}
