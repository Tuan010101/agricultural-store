package com.example.khoaluan.repository.cartRepository;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.dto.ProductDto;
import lombok.RequiredArgsConstructor;
import org.hibernate.transform.Transformers;
import org.hibernate.type.DateType;
import org.hibernate.type.DoubleType;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CartRepositoryCustomImpl implements CartRepositoryCustom{

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<CartDto> getListCartDtoByAccountId(Long accountId) {
        List<CartDto> res = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT c.id as cartId, c.amount as amount, p.image as image, p.name as name, p.description as description, p.price as price ");
        sql.append(" FROM coffee.cart as c ");
        sql.append(" inner join coffee.product as p ");
        sql.append(" on c.product_id = p.id ");
        sql.append(" where c.account_id = ").append(accountId);
        sql.append(" and c.status = 0");

        res = entityManager.unwrap(org.hibernate.Session.class).createNativeQuery(sql.toString())
                .addScalar("cartId", LongType.INSTANCE)
                .addScalar("amount", LongType.INSTANCE)
                .addScalar("image", StringType.INSTANCE)
                .addScalar("name", StringType.INSTANCE)
                .addScalar("description", StringType.INSTANCE)
                .addScalar("price", DoubleType.INSTANCE)
                .setResultTransformer(Transformers.aliasToBean(CartDto.class))
                .list();
        entityManager.close();
        return res;
    }

    @Override
    public List<CartDto> getListCartDtoByAccountIdAndStatus1(Long accountId) {
        List<CartDto> res = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT c.id as cartId, c.amount as amount, p.image as image, p.name as name, p.price as price, ");
        sql.append(" c.date as date, c.user_address as userAddress, c.user_email as userEmail, c.status_ship as statusShip, ");
        sql.append(" c.user_name as userName, c.user_phone as userPhone, c.payment_method as paymentMethod ");
        sql.append(" FROM coffee.cart as c ");
        sql.append(" inner join coffee.product as p ");
        sql.append(" on c.product_id = p.id ");
        sql.append(" where c.account_id = ").append(accountId);
        sql.append(" and c.status = 1");
        sql.append(" order by c.date desc");

        res = entityManager.unwrap(org.hibernate.Session.class).createNativeQuery(sql.toString())
                .addScalar("cartId", LongType.INSTANCE)
                .addScalar("amount", LongType.INSTANCE)
                .addScalar("image", StringType.INSTANCE)
                .addScalar("name", StringType.INSTANCE)
                .addScalar("price", DoubleType.INSTANCE)
                .addScalar("date", StringType.INSTANCE)
                .addScalar("userAddress", StringType.INSTANCE)
                .addScalar("userEmail", StringType.INSTANCE)
                .addScalar("userName", StringType.INSTANCE)
                .addScalar("userPhone", StringType.INSTANCE)
                .addScalar("paymentMethod", StringType.INSTANCE)
                .addScalar("statusShip", LongType.INSTANCE)
                .setResultTransformer(Transformers.aliasToBean(CartDto.class))
                .list();
        entityManager.close();
        return res;
    }

    @Override
    public List<CartDto> getListCartDtoByAdminAndStatus1() {
        List<CartDto> res = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT c.id as cartId, c.amount as amount, p.image as image, p.name as name, p.price as price, ");
        sql.append(" c.date as date, c.user_address as userAddress, c.user_email as userEmail, c.status_ship as statusShip, ");
        sql.append(" c.user_name as userName, c.user_phone as userPhone, c.payment_method as paymentMethod, c.account_id as accountId ");
        sql.append(" FROM coffee.cart as c ");
        sql.append(" inner join coffee.product as p ");
        sql.append(" on c.product_id = p.id ");
        sql.append(" where c.status = 1 ");
        sql.append(" order by c.date desc");

        res = entityManager.unwrap(org.hibernate.Session.class).createNativeQuery(sql.toString())
                .addScalar("cartId", LongType.INSTANCE)
                .addScalar("amount", LongType.INSTANCE)
                .addScalar("image", StringType.INSTANCE)
                .addScalar("name", StringType.INSTANCE)
                .addScalar("price", DoubleType.INSTANCE)
                .addScalar("date", StringType.INSTANCE)
                .addScalar("userAddress", StringType.INSTANCE)
                .addScalar("userEmail", StringType.INSTANCE)
                .addScalar("userName", StringType.INSTANCE)
                .addScalar("userPhone", StringType.INSTANCE)
                .addScalar("paymentMethod", StringType.INSTANCE)
                .addScalar("statusShip", LongType.INSTANCE)
                .addScalar("accountId", LongType.INSTANCE)
                .setResultTransformer(Transformers.aliasToBean(CartDto.class))
                .list();
        entityManager.close();
        return res;
    }
}
