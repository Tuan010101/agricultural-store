package com.example.khoaluan.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name = "id")
    private Long categoryId;

    @Column(name = "category_name")
    private String nameOfCategory;
}
