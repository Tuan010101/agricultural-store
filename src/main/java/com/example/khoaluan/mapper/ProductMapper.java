package com.example.khoaluan.mapper;
import com.example.khoaluan.dto.ProductDto;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public abstract class ProductMapper {
    public abstract ProductDto maptoDto2(ProductDto productDto);
}
