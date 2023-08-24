<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/index">Coffee<small>T</small></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item ${active == "index" ? "active":"" }"><a href="/index" class="nav-link">Trang chủ</a></li>
                <c:if test="${sessionScope.account.role == 1}">
<%--                    <li class="nav-item ${active == "manager" ? "active":"" }"><a href="/products" class="nav-link">Quản lý</a></li>--%>
                    <li class="nav-item dropdown ${active == "manager" ? "active":"" }">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown06" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quản lý</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown06">
                            <a class="dropdown-item" href="/products">Sản phẩm</a>
                            <a class="dropdown-item" href="/manager/order">Bàn uống</a>
                        </div>
                    </li>
                </c:if>
                <li class="nav-item ${active == "about" ? "active":"" }"><a href="/about" class="nav-link">Giới Thiệu</a></li>
                <li class="nav-item dropdown ${active == "shop" ? "active":"" }">
                    <a class="nav-link dropdown-toggle" href="/categories" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Mua hàng</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/categories">Đặt mua</a>
                        <a class="dropdown-item" href="/cart">Giỏ hàng</a>
                    </div>
                </li>
                <li class="nav-item ${active == "contact" ? "active":"" }"><a href="/contact" class="nav-link">Liên hệ</a></li>

                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item cart"><a href="/cart" class="nav-link"><span class="icon icon-shopping_cart"></span><span class="bag d-flex justify-content-center align-items-center"><small>0</small></span></a></li>
                    <li class="nav-item" ><a href="/sign-in" class="nav-link" style="font-size: 10px;padding: 27px 5px 27px 20px;">Đăng nhập</a></li>
                    <li class="nav-item" ><p class="nav-link" style="font-size: 10px;padding: 27px 0; margin: 0">|</p></li>
                    <li class="nav-item" ><a href="/sign-up" class="nav-link" style="font-size: 10px;padding: 27px 20px 27px 5px;">Đăng ký</a></li>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <li class="nav-item cart"><a href="/cart" class="nav-link"><span class="icon icon-shopping_cart"></span><span class="bag d-flex justify-content-center align-items-center"><small>${sessionScope.quantity}</small></span></a></li>
                    <li class="nav-item dropdown ${active == "shop" ? "active":"" }">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 10px;padding: 27px 5px 27px 20px;">${sessionScope.account.user}</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown05">
                            <a class="dropdown-item" href="/user/history">Lịch sử mua hàng</a>
                        </div>
                    </li>
                    <li class="nav-item" ><p class="nav-link" style="font-size: 10px;padding: 27px 0; margin: 0">|</p></li>
                    <li class="nav-item" ><a href="/logout" class="nav-link" style="font-size: 10px;padding: 27px 20px 27px 5px;">Đăng xuất</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
