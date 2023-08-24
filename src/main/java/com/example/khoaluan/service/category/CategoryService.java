package com.example.khoaluan.service.category;

import com.example.khoaluan.model.Category;

import java.util.List;

public interface CategoryService {

    List<Category> findAllCategory();

    Category findByNameOfCategory(String nameOfCategory);
}
