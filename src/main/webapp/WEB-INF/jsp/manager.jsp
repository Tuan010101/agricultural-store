<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Coffee</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            min-width: 1000px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            min-width: 100%;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn-group {
            float: right;
        }

        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }

        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }

        .custom-checkbox label:before {
            width: 18px;
            height: 18px;
        }

        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }

        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }

        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }

        /* Modal styles */
        .modal .modal-dialog {
            max-width: 400px;
        }

        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }

        .modal .modal-content {
            border-radius: 3px;
            font-size: 14px;
        }

        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }

        .modal .modal-title {
            display: inline-block;
        }

        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }

        .modal textarea.form-control {
            resize: vertical;
        }

        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }
    </style>
    <script>
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>
</head>
<body style="background-image: url(../images/bg_1.jpg);">

<%--Header--%>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/index">Coffee<small>T</small></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item ${active == "index" ? "active":"" }"><a href="/index" class="nav-link">Trang chủ</a>
                </li>
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
                <li class="nav-item ${active == "about" ? "active":"" }"><a href="/about" class="nav-link">Giới
                    Thiệu</a></li>
                <li class="nav-item dropdown ${active == "shop" ? "active":"" }">
                    <a class="nav-link dropdown-toggle" href="/categories" id="dropdown04" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">Mua hàng</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/categories">Đặt mua</a>
                        <a class="dropdown-item" href="/cart">Giỏ hàng</a>
                    </div>
                </li>
                <li class="nav-item ${active == "contact" ? "active":"" }"><a href="/contact" class="nav-link">Liên
                    hệ</a></li>
                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item cart"><a href="/cart" class="nav-link"><span class="icon icon-shopping_cart"></span><span class="bag d-flex justify-content-center align-items-center"><small>0</small></span></a></li>
                    <li class="nav-item"><a href="/sign-in" class="nav-link"
                                            style="font-size: 10px;padding: 27px 5px 27px 20px;">Đăng nhập</a></li>
                    <li class="nav-item"><p class="nav-link" style="font-size: 10px;padding: 27px 0; margin: 0">|</p>
                    </li>
                    <li class="nav-item"><a href="/sign-up" class="nav-link"
                                            style="font-size: 10px;padding: 27px 20px 27px 5px;">Đăng ký</a></li>
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
<%--End Header--%>
<div id="response"></div>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title" style="background-color: #333333!important; opacity: 0.95;">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Quản Lý Sản Phẩm</h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i> <span style="color: #fff!important;">Thêm Sản Phẩm Mới</span></a>
                        <%--                        <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span style="color: #fff!important;">Delete</span></a>--%>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px">
                    <form action="/products" method="get" class="row input-group">
                        <input style="border: 1px solid !important; margin-left: 30px"
                               class="col-2 form-control rounded" placeholder="Tên sản phẩm" name="name"/>
                        <select style="font-size: 1rem; margin-left: 10px" class="col-2 rounded" name="cateId">
                            <option value="" selected>Loại sản phẩm</option>
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.categoryId}">${category.nameOfCategory}</option>
                            </c:forEach>
                        </select>
                        <button style="border: 1px solid; font-size: 1rem" type="submit"
                                class="rounded btn btn-outline-success">search
                        </button>
                    </form>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Loại</th>
                    <th>Tên sản phẩm</th>
                    <th>Hình ảnh</th>
                    <th>Giá</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${products}" var="product" varStatus="loopCounter">
                    <tr>
                        <td>${product.productId}</td>
                        <td>${product.nameOfCategory}</td>
                        <td>${product.name}</td>
                        <td>
                            <img src="${product.image}" alt="Error" width="200px">
                        </td>
                        <td>${product.price}</td>
                            <%--            Begin update            --%>
                        <td>
                            <a>
                                <i type="button" class="material-icons" data-toggle="modal"
                                   data-target="#editModal${loopCounter.count}" title="Edit">&#xE254;</i>
                                <div id="editModal${loopCounter.count}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="/products/update/${product.productId}" method="post">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" style="color: #0b0b0b!important;">Cập nhật
                                                        sản phẩm</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">&times;
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                        <%--                                                    <input name="productId" value="${product.productId}" type="hidden" class="form-control" disabled>--%>
                                                    <div class="form-group">
                                                        <label>Tên sản phẩm</label>
                                                        <input style="color: #0b0b0b!important; border: 1px solid #0b0b0b !important;"
                                                               name="name" value="${product.name}" type="text"
                                                               class="form-control" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Hình ảnh</label>
                                                        <input style="color: #0b0b0b!important; border: 1px solid #0b0b0b !important;"
                                                               name="image" value="${product.image}"
                                                               class="form-control" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Thông tin sản phẩm</label>
                                                        <textarea
                                                                style="color: #0b0b0b!important; border: 1px solid #0b0b0b !important;"
                                                                name="description" class="form-control"
                                                                required>${product.description}</textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Giá</label>
                                                        <input style="color: #0b0b0b!important; border: 1px solid #0b0b0b !important;"
                                                               name="price" value="${product.price}"
                                                               class="form-control" required>
                                                    </div>
                                                    <select style="width: 100%;height: 58px;margin: 20px 0px;"
                                                            name="nameOfCategory" required>
                                                        <option value="${product.nameOfCategory}"
                                                                selected>${product.nameOfCategory}</option>
                                                        <c:forEach items="${categories}" var="category">
                                                            <option value="${category.nameOfCategory}">${category.nameOfCategory}</option>
                                                        </c:forEach>
                                                    </select>
                                                        <%--                    <input name="sell_id" type="hidden" class="form-control" disabled>--%>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal"
                                                           value="Trở về">
                                                    <input type="submit" class="btn btn-success" value="Cập nhật">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </a>
                                <%--              End Update                --%>
                                <%--              Begin Delete              --%>
                            <a>
                                <i type="button" class="material-icons" data-toggle="modal"
                                   data-target="#deleteModal${loopCounter.count}" title="Delete">&#xE872;</i>
                                <div id="deleteModal${loopCounter.count}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="/products/delete/${product.productId}" method="post">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" style="color: #0b0b0b!important;">Xóa sản
                                                        phẩm</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">&times;
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Bạn có chắc là xóa sản phẩm có tên ${product.name} và id
                                                        là ${product.productId} ?</p>
                                                    <p class="text-danger"><small>Sản phẩm này sẽ không thể phục hồi
                                                        lại</small></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal"
                                                           value="Trở về">
                                                    <input type="submit" class="btn btn-danger" value="Xóa">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </a>
                                <%--             End Delete               --%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- add Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/products" method="post">
                <div class="modal-header">
                    <h4 class="modal-title" style="color: #0b0b0b!important;">Thêm sản phẩm</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <input name="productId" type="hidden" class="form-control" disabled>
                    <div class="form-group">
                        <label>Tên sản phẩm</label>
                        <input style="color: #0b0b0b!important; border: 1px solid #0b0b0b !important;" name="name"
                               type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Hình ảnh</label>
                        <input style="color: #0b0b0b!important; border: 1px solid #0b0b0b !important;" name="image"
                               class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Thông tin sản phẩm</label>
                        <textarea style="color: #0b0b0b!important; border: 1px solid #0b0b0b !important;"
                                  name="description" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Giá</label>
                        <input style="color: #0b0b0b!important; border: 1px solid #0b0b0b !important;" name="price"
                               class="form-control" required>
                    </div>
                    <select style="width: 100%;height: 58px;margin: 20px 0px;" name="category" required>
                        <option value="" selected disabled>Chọn loại cà phê</option>
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.categoryId}">${category.nameOfCategory}</option>
                        </c:forEach>
                    </select>
                    <%--                    <input name="sell_id" type="hidden" class="form-control" disabled>--%>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Trở về">
                    <input type="submit" class="btn btn-success" value="Thêm">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        var x;
        var sPageURL = window.location.search.substring(1);
        var sURLVariables = sPageURL.split('?');
        for (var i = 0; i < sURLVariables.length; i++) {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] === "status") {
                x = sParameterName[1];
                console.log(x)
                break;
            }
        }
        if (x === "delete_success") {
            $("#response").html("<div class ='alert alert-success' role='alert' style='text-align: center; font-size: 20px;'><b> Xóa thành công </b></div>").fadeIn(200).fadeOut(5000)
            return;
        } else if (x === "delete_failed") {
            $("#response").html("<div class ='alert alert-danger' role='alert' style='text-align: center; font-size: 20px;'><b> Xóa thất bại </b></div>").fadeIn(200).fadeOut(5000)
            return;
        } else if (x === "update_success") {
            $("#response").html("<div class ='alert alert-success' role='alert' style='text-align: center; font-size: 20px;'><b> Cập nhật thành công </b></div>").fadeIn(200).fadeOut(5000)
            return;
        } else if (x === "update_failed") {
            $("#response").html("<div class ='alert alert-danger' role='alert' style='text-align: center; font-size: 20px;'><b> Cập nhật thất bại </b></div>").fadeIn(200).fadeOut(5000)
            return;
        } else if (x === "insert_success") {
            $("#response").html("<div class ='alert alert-success' role='alert' style='text-align: center; font-size: 20px;'><b> Thêm thành công </b></div>").fadeIn(200).fadeOut(5000)
            return;
        }
    })
</script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA55O-qurr3nquTITpUBp-63mWC38CLOO0&callback=initMap"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>


</body>
</html>