package com.example.khoaluan.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long accountId;
    @Column(name = "user")
    private String user;
    @Column(name = "pass")
    private String pass;
    @Column(name = "role")
    private Long role;
//    @Column(name = "name")
//    private String name;
//    @Column(name = "address")
//    private String address;
//    @Column(name = "phone")
//    private String phone;
//    @Column(name = "email")
//    private String email;
}
