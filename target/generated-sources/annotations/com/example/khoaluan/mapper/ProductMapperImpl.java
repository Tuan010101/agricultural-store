package com.example.khoaluan.mapper;

import com.example.khoaluan.dto.ProductDto;
import javax.annotation.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-04-09T10:27:38+0700",
    comments = "version: 1.4.2.Final, compiler: javac, environment: Java 11.0.4 (JetBrains s.r.o)"
)
@Component
public class ProductMapperImpl extends ProductMapper {

    @Override
    public ProductDto maptoDto2(ProductDto productDto) {
        if ( productDto == null ) {
            return null;
        }

        ProductDto productDto1 = new ProductDto();

        productDto1.setProductId( productDto.getProductId() );
        productDto1.setName( productDto.getName() );
        productDto1.setImage( productDto.getImage() );
        productDto1.setPrice( productDto.getPrice() );
        productDto1.setDescription( productDto.getDescription() );
        productDto1.setNameOfCategory( productDto.getNameOfCategory() );

        return productDto1;
    }
}
