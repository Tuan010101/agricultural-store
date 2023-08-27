<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

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

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">

    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">


    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
    <style>
        .my-button:hover {
            cursor: pointer;
            background-color: none;
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="basefragments/header.jsp"></jsp:include>
<!-- END nav -->

<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="navbar navbar-dark bg-primary justify-content-center">
                    <span class="navbar-brand mb-0 h1">Lịch sử đặt hàng</span>
                </div>
            </div>
            <%--			class: ftco-animate chặn--%>
            <div class="col-md-12" style="padding-top: 20px">
                <div>
                    <table class="table">
                        <div id="response"></div>
                        <thead class="thead-primary">
                        <tr class="text-center">
                            <th style="width: 20%">Địa chỉ</th>
                            <th style="width: 15%">Ngày</th>
                            <th>Sản phẩm</th>
                            <th style="width: 15%">Giá</th>
                            <th>Tổng cộng</th>
                            <th>Vận chuyển</th>
                            <th>&nbsp;</th>

                        </tr>
                        </thead>
                        <c:forEach items="${listsCarts}" var="cartDtos" varStatus="loopCounter">
                            <tr class="text-center">
                                <td>
                                        ${cartDtos[0].userName}, ${cartDtos[0].userPhone}, ${cartDtos[0].userAddress}
                                </td>
                                <td>
                                        ${cartDtos[0].date}
                                </td>
                                <td class="product-name" style="width: 25%">
                                    <c:forEach items="${cartDtos}" var="cartDto">
                                        <h3 style=" text-align: left">x${cartDto.amount} ${cartDto.name}</h3>
                                    </c:forEach>
                                </td>
                                <td class="price">
                                    <c:set var="totalPrice" value="0"/>
                                    <c:forEach items="${cartDtos}" var="cartDto">
                                        <li style="text-align: left; margin-bottom: 8px">${cartDto.price * cartDto.amount}
                                            Đ
                                        </li>
                                        <c:set var="totalPrice"
                                               value="${totalPrice + (cartDto.price * cartDto.amount)}"/>
                                    </c:forEach>
                                </td>
                                <td class="price">
                                    <li>${totalPrice + 15000} Đ</li>
                                    <li>Đã bao gồm phí vận chuyển</li>
                                    <li>${cartDtos[0].paymentMethod}</li>
                                </td>
                                <c:if test="${cartDtos[0].statusShip == 0}">
                                    <td>
                                        <span class="badge badge-secondary" style="margin: auto;">Chờ xác nhận</span>
                                    </td>
                                </c:if>
                                <c:if test="${cartDtos[0].statusShip == 1}">
                                    <td>
                                        <span class="badge badge-warning" style="margin: auto;">Chờ lấy hàng</span>
                                    </td>
                                </c:if>
                                <c:if test="${cartDtos[0].statusShip == 2}">
                                    <td>
                                        <span class="badge badge-primary" style="margin: auto;">Đang giao</span>
                                    </td>
                                </c:if>
                                <c:if test="${cartDtos[0].statusShip == 3}">
                                    <td>
                                        <span class="badge badge-success" style="margin: auto;">Hoàn thành</span>
                                    </td>
                                </c:if>
                                <c:if test="${sessionScope.account.role == 1}">
                                    <td>
                                        <a>
                                            <span type="button" class="icon-edit my-button" data-toggle="modal"
                                                  data-target="#deleteModal${loopCounter.count}" title="Delete"></span>
                                            <div id="deleteModal${loopCounter.count}" class="modal fade">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <form action="/user/history/update-status-ship/${listsCarts[loopCounter.count - 1][0].accountId}/${listsCarts[loopCounter.count - 1][0].date}" method="post">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title"
                                                                    style="color: #0b0b0b!important;">
                                                                    Cập nhật vận chuyển</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal"
                                                                        aria-hidden="true">&times;
                                                                </button>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="radio">
                                                                        <label><input type="radio" value="0" name="statusShip" class="mr-2" required> Chờ xác nhận</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="radio">
                                                                        <label><input type="radio" value="1" name="statusShip" class="mr-2" required> Chờ lấy hàng</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="radio">
                                                                        <label><input type="radio" value="2" name="statusShip" class="mr-2" required> Đang giao</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="radio">
                                                                        <label><input type="radio" value="3" name="statusShip" class="mr-2" required> Hoàn thành</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <input type="button" class="btn btn-default"
                                                                       data-dismiss="modal" value="Trở về">
                                                                <input type="submit" class="btn btn-success"
                                                                       value="Cập nhật">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </td>
                                </c:if>
                                <c:if test="${cartDtos[0].statusShip == 0}">
                                    <c:if test="${sessionScope.account.role != 1}">
                                        <td>
                                            <a>
                                            <span type="button" class="icon-close my-button" data-toggle="modal"
                                                  data-target="#deleteModal${loopCounter.count}" title="Delete"></span>
                                                <div id="deleteModal${loopCounter.count}" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <form action="/user/history/delete/${sessionScope.account.accountId}/${listsCarts[loopCounter.count - 1][0].date}" method="post">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title"
                                                                        style="color: #0b0b0b!important;">
                                                                        Hủy đơn hàng</h4>
                                                                    <button type="button" class="close"
                                                                            data-dismiss="modal"
                                                                            aria-hidden="true">&times;
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <p>Bạn có chắc muốn hủy đơn hàng không?</p>
<%--                                                                    <p>Bạn có chắc là xóa sản phẩm ngày ${listsCarts[loopCounter.count - 1][0].date}, id ${sessionScope.account.accountId} </p>--%>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <input type="button" class="btn btn-default"
                                                                           data-dismiss="modal" value="Trở về">
                                                                    <input type="submit" class="btn btn-danger"
                                                                           value="Xóa">
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </td>
                                    </c:if>
                                </c:if>
                            </tr>
                            <!-- END TR-->
                        </c:forEach>

                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="basefragments/footer.jsp"></jsp:include>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/aos.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>
<script src="../js/bootstrap-datepicker.js"></script>
<script src="../js/jquery.timepicker.min.js"></script>
<script src="../js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA55O-qurr3nquTITpUBp-63mWC38CLOO0&callback=initMap"></script>
<script src="../js/google-map.js"></script>
<script src="../js/main.js"></script>
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
        if (x === "cancel_success") {
            $("#response").html("<div class ='alert alert-success' role='alert' style='text-align: center; font-size: 20px;'><b> Hủy đơn thành công </b></div>").fadeIn(200).fadeOut(5000)
            return;
        } else if (x === "update_success") {
            $("#response").html("<div class ='alert alert-success' role='alert' style='text-align: center; font-size: 20px;'><b> Cập nhật quá trình vận chuyển </b></div>").fadeIn(200).fadeOut(5000)
            return;
        } else if (x === "fail_checkout") {
            $("#response").html("<div class ='alert alert-danger' role='alert' style='text-align: center; font-size: 20px;'><b> Bạn chưa có sản phẩm nào để thanh toán </b></div>").fadeIn(200).fadeOut(5000)
            return;
        }
    })
</script>
</body>
</html>