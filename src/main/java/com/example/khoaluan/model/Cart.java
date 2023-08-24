package com.example.khoaluan.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name="cart")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long cartId;
    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;
    @Column(name = "product_id")
    private Long productId;
    @Column(name = "amount")
    private Long amount;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    @Column(name = "date")
    private Date date;
    @Column(name = "status_ship")
    private Long statusShip;
    @Column(name = "status")
    private Long status;
    @Column(name = "user_name")
    private String name;
    @Column(name = "user_address")
    private String address;
    @Column(name = "user_phone")
    private String phone;
    @Column(name = "user_email")
    private String email;
    @Column(name = "payment_method")
    private String paymentMethod;
}
