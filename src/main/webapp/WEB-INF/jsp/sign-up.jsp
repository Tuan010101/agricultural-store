<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!doctype html>
<!DOCTYPE html>
<html>
<head>
    <title>Login 10</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <style>
        .height-100 {
            height: 500px
        }

        .sidebar {
            position: relative;
            overflow: hidden
        }

        .chart-design {
            list-style: none
        }

        .chart-design li:nth-child(1) {
            position: absolute;
            top: 10px;
            height: 100px;
            width: 100px;
            background-color: #b7c2d4;
            border-radius: 100% 0% 0% 100% / 0% 56% 44% 100%;
            opacity: 0.4
        }

        .chart-design li:nth-child(2) {
            position: absolute;
            top: 30px;
            right: 20px;
            transform: rotate(-10deg);
            height: 70px;
            width: 70px;
            background-color: #000;
            border-radius: 100% 0% 0% 100% / 0% 56% 44% 100%;
            opacity: 0.4
        }

        .chart-design li:nth-child(3) {
            position: absolute;
            bottom: 0px;
            left: 200px;
            transform: rotate(-10deg);
            height: 150px;
            width: 150px;
            background-color: #000;
            border-radius: 100% 0% 0% 100% / 0% 56% 44% 100%;
            opacity: 0.4
        }

        .chart-design li:nth-child(4) {
            position: absolute;
            bottom: 0px;
            left: 10px;
            transform: rotate(-10deg);
            height: 150px;
            width: 150px;
            background-color: #000;
            border-radius: 50%;
            opacity: 0.4
        }

        .chart-design li:nth-child(5) {
            position: absolute;
            bottom: 0px;
            right: 10px;
            transform: rotate(-10deg);
            height: 70px;
            width: 70px;
            background-color: #000;
            border-radius: 50%;
            opacity: 0.7
        }

        .chart-design li:nth-child(6) {
            position: absolute;
            top: 120px;
            left: 40%;
            transform: rotate(-10deg);
            height: 200px;
            width: 200px;
            background-color: #000;
            border-radius: 50%;
            opacity: 0.2
        }

        .form-data {
            width: 100%;
            margin-bottom: 10px
        }

        .main-heading {
            font-size: 30px
        }

        .form-data label {
            font-size: 13px;
            margin-left: 2px
        }

        .form-data input {
            height: 50px;
            border: 2px solid #eee;
            transition: all 1s;
            border-radius: 5px
        }

        .form-data input:focus {
            outline: none;
            border: 2px solid #000;
            box-shadow: none
        }

        .social-list {
            list-style: none;
            display: flex
        }

        .social-list li {
            margin: 5px;
            background-color: #b7c2d4;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 5px;
            transition: all 0.5s;
            cursor: pointer;
            color: #fff
        }

        .forgot-text {
            color: red
        }

        .social-list li:nth-child(1) {
            background-color: #1828fe
        }

        .social-list li:nth-child(2) {
            background-color: red
        }

        .social-list li:nth-child(3) {
            background-color: #1828fe
        }

        .signin-btn .btn {
            width: 100%;
            height: 46px;
            margin-top: 10px
        }
    </style>

</head>

<body style="background-image: url(images/about.jpg); padding-top: 80px">
<div class="container">
    <div class="row g-0 mt-5 mb-5 ${p == 1 or p == 2 or p == 3 ? "height-120" : "height-100" }">
        <%--    <div class="col-md-6">--%>
        <img style="opacity: 80% !important;" src="images/bg_2.jpg" class="col-md-6" alt="Error" >
        <%--      <div class="bg-dark p-4 h-100 sidebar">--%>
        <%--      </div>--%>
        <%--    </div>--%>
        <div class="col-md-6">
            <div class="bg-white p-4 h-100">
                <div class=" d-flex justify-content-center flex-column align-items-center"> <a href="/index" style="color: #000000; text-decoration: none" class="main-heading">T COFFEE</a>
                    <div class="form-data navbar-brand" style="text-align: center; margin: 5px 0 0 0;">Đăng Ký Tài Khoản</div>
                    <form class="p-3 d-flex justify-content-center flex-column align-items-center" style="width: 100%" action="/sign-up" method="post">
                        <c:if test="${p == 1}">
                            <div class="form-data alert alert-danger" role="alert" style="text-align: center">Mật khẩu không trùng khớp. Vui lòng nhập lại!</div>
                        </c:if>
                        <c:if test="${p == 3}">
                            <div class="form-data alert alert-danger" role="alert" style="text-align: center">Tên tài khoản đã tồn tại. Vui lòng nhập lại!</div>
                        </c:if>
                        <c:if test="${p == 2}">
                            <div class="form-data alert alert-success" role="alert" style="text-align: center">Đăng ký thành công!</div>
                        </c:if>
                        <div class="form-data"> <label>Tài khoản</label>
                            <input name="user" type="text" class="form-control w-100" required>
                        </div>
                        <div class="form-data"> <label>Mật khẩu</label>
                            <input name="pass" type="password" class="form-control w-100" required>
                        </div>
                        <div class="form-data"> <label>Nhập Lại Mật khẩu</label>
                            <input name="rePass" type="password" class="form-control w-100" required>
                        </div>
                        <div class="d-flex justify-content-between w-100 align-items-center">
                            <label class="form-check-label">Đã có tài khoản ?</label>
                            <a class="text-decoration-none forgot-text" href="/sign-in">Đăng nhập</a>
                        </div>
                        <div class="signin-btn w-100 mt-2">
                            <input type="submit" class="btn btn-danger btn-block" value="Đăng ký">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>