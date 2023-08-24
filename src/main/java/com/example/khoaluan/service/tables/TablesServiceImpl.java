package com.example.khoaluan.service.tables;

import com.example.khoaluan.model.Tables;
import com.example.khoaluan.repository.tablesRepository.TablesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TablesServiceImpl implements TablesService {

    @Autowired
    TablesRepository tablesRepository;

    @Override
    public void save(Tables tables) {
        tablesRepository.save(tables);
    }

    @Override
    public void saveAll(List<Tables> tables) {
        tablesRepository.saveAll(tables);
    }

    @Override
    public boolean existsByTableNumberAndStatus(Long tableNumber, Long status) {
        return tablesRepository.existsByTableNumberAndStatus(tableNumber, 0L);
    }

    @Override
    public List<Tables> findByTableNumberAndStatus(Long tableNumber, Long status) {
        return tablesRepository.findByTableNumberAndStatus(tableNumber, status);
    }

    @Override
    public boolean existsByProductIdAndTableNumberAndStatus(Long productId, Long tableNumber, Long status) {
        return tablesRepository.existsByProductIdAndTableNumberAndStatus(productId, tableNumber, status);
    }

    @Override
    public Tables findByTableNumberAndProductIdAndStatus(Long tableNumber, Long productId, Long status) {
        return tablesRepository.findByTableNumberAndProductIdAndStatus(tableNumber, productId, status);
    }

    @Override
    public Optional<Tables> findById(Long id) {
        return tablesRepository.findById(id);
    }
}
