package com.example.khoaluan.service.category;

import com.example.khoaluan.model.Category;
import com.example.khoaluan.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public List<Category> findAllCategory() {
        return categoryRepository.findAll();
    }

    @Override
    public Category findByNameOfCategory(String nameOfCategory) {
        return categoryRepository.findByNameOfCategory(nameOfCategory);
    }
}
