package com.example.khoaluan.repository.tablesRepository;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.dto.TableDto;
import lombok.RequiredArgsConstructor;
import org.hibernate.transform.Transformers;
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
public class TablesRepositoryCustomImpl implements TablesRepositoryCustom  {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<TableDto> getListTableDto() {
        List<TableDto> res = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT t.id as id, t.table_number as tableNumber, t.amount as amount, p.name as name, p.price as price ");
        sql.append(" FROM coffee.tables as t ");
        sql.append(" left join coffee.product as p ");
        sql.append(" on t.product_id = p.id ");
        sql.append(" where t.status = 0 ");
        sql.append(" order by t.table_number asc");

        res = entityManager.unwrap(org.hibernate.Session.class).createNativeQuery(sql.toString())
                .addScalar("id", LongType.INSTANCE)
                .addScalar("tableNumber", LongType.INSTANCE)
                .addScalar("amount", LongType.INSTANCE)
                .addScalar("name", StringType.INSTANCE)
                .addScalar("price", DoubleType.INSTANCE)
                .setResultTransformer(Transformers.aliasToBean(TableDto.class))
                .list();
        entityManager.close();
        return res;
    }
}
