package com.example.khoaluan.repository.tablesRepository;

import com.example.khoaluan.model.Tables;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TablesRepository extends JpaRepository<Tables, Long> {

    boolean existsByTableNumberAndStatus(Long tableNumber, Long status);

    boolean existsByProductIdAndTableNumberAndStatus(Long productId, Long tableNumber, Long status);

    List<Tables> findByTableNumberAndStatus(Long tableNumber, Long status);

    Tables findByTableNumberAndProductIdAndStatus(Long tableNumber, Long productId, Long status);
}
