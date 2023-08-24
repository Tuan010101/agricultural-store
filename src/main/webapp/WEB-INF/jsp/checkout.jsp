<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<body>
<jsp:include page="basefragments/header.jsp"></jsp:include>
<!-- END nav -->

<section class="home-slider owl-carousel">

    <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row slider-text justify-content-center align-items-center">

                <div class="col-md-7 col-sm-12 text-center ftco-animate">
                    <h1 class="mb-3 mt-5 bread">Checkout</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="/index">Trang chủ</a></span> <span>Checout</span>
                    </p>
                </div>

            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-xl-8 ftco-animate">
                <form action="/user/history" method="post" class="billing-form ftco-bg-dark p-3 p-md-5">
                    <h3 style="font-size: 2rem" class="mb-4 billing-heading">Chi tiết thanh toán</h3>
                    <h3 style="font-size: 1.5rem" class="mb-4 billing-heading">Địa chỉ</h3>
                    <div class="row align-items-end">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="name">Họ Và Tên</label>
                                <input id="name" name="name" type="text" class="form-control" placeholder="VD: Nguyễn Ngọc Tuấn" required>
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="streetaddress">Địa chỉ</label>
                                <input id="streetaddress" name="address" type="text" class="form-control" placeholder="VD: 75 Trường Chinh, Bắc Lý, Đồng Hới, Quảng Bình" required>
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="w-100"></div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="phone">Số điện thoại</label>
                                <input id="phone" name="phone" type="number" class="form-control" placeholder="VD: 0123456789" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="emailaddress">Email</label>
                                <input id="emailaddress" name="email" type="email" class="form-control" placeholder="VD: TCoffee@gmail.com">
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div style="padding: 0 !important; margin-top: 25px" class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
                                <h3 style="font-size: 1.5rem" class="billing-heading mb-4">Chi tiết hóa đơn</h3>
                                <p class="d-flex">
                                    <span>Tên sản phẩm</span>
                                    <span>Số lượng</span>
                                    <span>Giá</span>
                                </p>
                                <c:forEach items="${cartDtos}" var="cartDto" varStatus="loopCounter">
                                    <p class="d-flex">
                                        <span>${cartDto.name}</span>
                                        <span>${cartDto.amount}</span>
                                        <span>${cartDto.price} Đ</span>
                                    </p>
                                </c:forEach>
                                <hr>
                                <p class="d-flex total-price">
                                    <span>Tổng giá đơn hàng</span>
                                    <span></span>
                                    <span>${sum} Đ</span>
                                </p>
                                <p class="d-flex total-price">
                                    <span>Phí vận chyển</span>
                                    <span></span>
                                    <span>15000 Đ</span>
                                </p>
                                <p class="d-flex total-price">
                                    <span>Số tiền cần thanh toán</span>
                                    <span></span>
                                    <span>${sum + 15000} Đ</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div style="padding: 0 !important; margin-top: 25px" class="cart-detail ftco-bg-dark p-3 p-md-4">
                                <h3 style="font-size: 1.5rem" class="billing-heading mb-4">Phương thức thanh toán</h3>
<%--                                <div class="form-group">--%>
<%--                                    <div class="col-md-12">--%>
<%--                                        <div class="radio">--%>
<%--                                            <label><input type="radio" name="paymentMethod" class="mr-2" required> ATM (Chưa hỗ trợ)</label>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="form-group radio">
                                    <label style="margin-left: 6%">ATM (Chưa hỗ trợ)</label>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <label><input type="radio" name="paymentMethod" class="mr-2" required> Thanh toán khi nhận hàng</label>
                                        </div>
                                    </div>
                                </div>
                                <p><input type="submit" class="btn btn-primary py-3 px-4" value="Đặt hàng">
<%--                                    <input href="#" type="submit" class="btn btn-primary py-3 px-4">Đặt hàng--%>
                                </p>
                            </div>
                        </div>
                    </div>
                </form><!-- END -->
            </div> <!-- .col-md-8 -->


            <div class="col-xl-4 sidebar ftco-animate">
                <div class="sidebar-box">
                    <form action="#" class="search-form">
                        <div class="form-group">
                            <div class="icon">
                                <span class="icon-search"></span>
                            </div>
                            <input type="text" class="form-control" placeholder="Search...">
                        </div>
                    </form>
                </div>
                <div class="sidebar-box ftco-animate">
                    <div class="categories">
                        <h3>Loại đồ uống</h3>
                        <c:forEach items="${categories}" var="category">
                            <li><a href="/categories/${category.categoryId}" title="...">${category.nameOfCategory} <span>(5)</span></a></li>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </div>
</section> <!-- .section -->

<jsp:include page="basefragments/footer.jsp"></jsp:include>


<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>


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

<script>
    $(document).ready(function () {

        var quantitiy = 0;
        $('.quantity-right-plus').click(function (e) {

            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            var quantity = parseInt($('#quantity').val());

            // If is not undefined

            $('#quantity').val(quantity + 1);


            // Increment

        });

        $('.quantity-left-minus').click(function (e) {
            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            var quantity = parseInt($('#quantity').val());

            // If is not undefined

            // Increment
            if (quantity > 0) {
                $('#quantity').val(quantity - 1);
            }
        });

    });
</script>


</body>
</html>