package com.example.khoaluan.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name="tables")
public class Tables {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "table_number")
    private Long tableNumber;
    @Column(name = "product_id")
    private Long productId;
    @Column(name = "amount")
    private Long amount;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    @Column(name = "date")
    private Date date;
    @Column(name = "status")
    private Long status;
}
