package com.example.khoaluan.service.tables;

import com.example.khoaluan.model.Tables;

import java.util.List;
import java.util.Optional;

public interface TablesService {

    void save(Tables tables);

    void saveAll(List<Tables> tables);

    boolean existsByTableNumberAndStatus(Long tableNumber, Long status);

    List<Tables> findByTableNumberAndStatus(Long tableNumber, Long status);

    boolean existsByProductIdAndTableNumberAndStatus(Long productId, Long tableNumber, Long status);

    Tables findByTableNumberAndProductIdAndStatus(Long tableNumber, Long productId, Long status);

    Optional<Tables> findById(Long id);

}
