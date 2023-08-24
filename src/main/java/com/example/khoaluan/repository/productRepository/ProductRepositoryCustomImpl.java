package com.example.khoaluan.repository.productRepository;

import com.example.khoaluan.dto.ProductDto;
import lombok.RequiredArgsConstructor;
import org.hibernate.transform.Transformers;
import org.hibernate.type.*;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductRepositoryCustomImpl implements ProductRepositoryCustom {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<ProductDto> getListProductDto(){
        List<ProductDto> res = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT p.id as productId, c.category_name as nameOfCategory, p.description as description, p.image as image, p.name, p.price as price FROM product p inner join category c on c.id = p.cate_id");

        res = entityManager.unwrap(org.hibernate.Session.class).createNativeQuery(sql.toString())
                .addScalar("productId", LongType.INSTANCE)
                .addScalar("name", StringType.INSTANCE)
                .addScalar("image", StringType.INSTANCE)
                .addScalar("price", DoubleType.INSTANCE)
                .addScalar("description", StringType.INSTANCE)
                .addScalar("nameOfCategory", StringType.INSTANCE)
                .setResultTransformer(Transformers.aliasToBean(ProductDto.class))
                .list();
        entityManager.close();
        return res;
    }

    @Override
    public List<ProductDto> findByNameAndCateId(String name, String cateId) {
        List<ProductDto> res = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT p.id as productId, c.category_name as nameOfCategory, p.description as description, p.image as image, p.name, p.price as price FROM product p inner join category c on c.id = p.cate_id");
        sql.append(" where p.name like '%").append(name).append("%' ");
        sql.append(" and p.cate_id like '%").append(cateId).append("' ");
        res = entityManager.unwrap(org.hibernate.Session.class).createNativeQuery(sql.toString())
                .addScalar("productId", LongType.INSTANCE)
                .addScalar("name", StringType.INSTANCE)
                .addScalar("image", StringType.INSTANCE)
                .addScalar("price", DoubleType.INSTANCE)
                .addScalar("description", StringType.INSTANCE)
                .addScalar("nameOfCategory", StringType.INSTANCE)
                .setResultTransformer(Transformers.aliasToBean(ProductDto.class))
                .list();
        entityManager.close();
        return res;
    }
}
