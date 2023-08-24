package com.example.khoaluan.repository.tablesRepository;

import com.example.khoaluan.dto.CartDto;
import com.example.khoaluan.dto.TableDto;

import java.util.List;

public interface TablesRepositoryCustom {
    List<TableDto> getListTableDto();
}
