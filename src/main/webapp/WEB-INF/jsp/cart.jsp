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
                    <h1 class="mb-3 mt-5 bread">Giỏ Hàng</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="/index">Trang chủ</a></span>
                        <span>Giỏ Hàng</span></p>
                </div>
            </div>
        </div>
    </div>
</section>

<div id="response"></div>

<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <%--			class: ftco-animate chặn--%>
            <div class="col-md-12">
                <div>
                    <table class="table">
                        <thead class="thead-primary">
                        <tr class="text-center">
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng cộng</th>
                        </tr>
                        </thead>

                        <c:forEach items="${cartDtos}" var="cartDto" varStatus="loopCounter">
                            <tr class="text-center">
                                <td class="product-remove">
                                    <a>
                                            <%--									<span class="icon-close"></span>--%>
                                        <span type="button" class="icon-close" data-toggle="modal"
                                              data-target="#deleteModal${loopCounter.count}" title="Delete"></span>
                                        <div id="deleteModal${loopCounter.count}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="/cart/delete/${cartDto.cartId}" method="post">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title" style="color: #0b0b0b!important;">
                                                                Xóa sản phẩm</h4>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-hidden="true">&times;
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Bạn có chắc là xóa sản phẩm có tên</p>
                                                            <h4 style="color: red">${cartDto.name}</h4>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-default"
                                                                   data-dismiss="modal" value="Trở về">
                                                            <input type="submit" class="btn btn-danger" value="Xóa">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </td>
                                <td class="image-prod">
                                    <div class="img" style="background-image:url(${cartDto.image});"></div>
                                </td>
                                <td class="product-name">
                                    <h3>${cartDto.name}</h3>
                                    <p>${cartDto.description}</p>
                                </td>

                                <td class="price">${cartDto.price} Đ</td>

                                <td>
									<div class="input-group d-flex" style="margin-top: 1rem">
										<form action="/cart/${cartDto.cartId}/decrease" method="post" class="input-group-btn mr-2">
											<input type="hidden" name="cartId" value="${cartDto.cartId}">
											<button type="submit" class="quantity-left-minus btn">
												<i class="icon-minus"></i>
											</button>
										</form>
										<div class="form-control">
											<p style="padding-top: 12px" type="text">${cartDto.amount}</p>
										</div>
										<form action="/cart/${cartDto.cartId}/increase" method="post" class="input-group-btn ml-2">
											<input type="hidden" name="cartId" value="${cartDto.cartId}">
											<button type="submit" class="quantity-right-plus btn">
												<i class="icon-plus"></i>
											</button>
										</form>
									</div>
                                </td>

                                <td class="total">${cartDto.amount * cartDto.price} Đ</td>
                            </tr>
                            <!-- END TR-->
                        </c:forEach>

                    </table>
                </div>
            </div>
        </div>

        <div class="row justify-content-end">
            <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
                <div class="cart-total mb-3">
                    <h3>Đơn hàng</h3>
                    <p class="d-flex">
                        <span>Tổng giá đơn hàng</span>
                        <span>${sum} Đ</span>
                    </p>
                    <c:if test="${sessionScope.account == null or empty cartDtos}">
                        <p class="d-flex">
                            <span>Phí vận chuyển</span>
                            <span>0 Đ</span>
                        </p>
                    </c:if>
                    <c:if test="${sessionScope.account != null and !empty cartDtos}">
                        <p class="d-flex">
                            <span>Phí vận chuyển</span>
                            <span>15000 Đ</span>
                        </p>
                    </c:if>
                    <p class="d-flex">
                        <span>Giảm giá</span>
                        <span>0 Đ</span>
                    </p>
                    <hr>
                    <c:if test="${sessionScope.account == null or empty cartDtos}">
                        <p class="d-flex total-price">
                            <span>Số tiền cần thanh toán</span>
                            <span>0 Đ</span>
                        </p>
                    </c:if>
                    <c:if test="${sessionScope.account != null and !empty cartDtos}">
                        <p class="d-flex total-price">
                            <span>Số tiền cần thanh toán</span>
                            <span>${sum + 15000} Đ</span>
                        </p>
                    </c:if>
                </div>
                <p class="text-center"><a href="/checkout" class="btn btn-primary py-3 px-4">Mua hàng</a></p>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section ftco-animate text-center">
                <span class="subheading">Khám phá</span>
                <h2 class="mb-4">Sản phẩm mới nhất</h2>
                <p>Đây là những sản phẩm mới nhất với đầy đủ tâm huyết của chúng tôi. Chúng tôi luôn cố gắng để đạt được những sản phẩm mới đi đôi với chất lượng.</p>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${fourLatestProducts}" var="cartDto" varStatus="loopCounter">
                <div class="col-md-3">
                    <div class="menu-entry">
                        <a href="/products/${cartDto.productId}" class="img" style="background-image: url(${cartDto.image});"></a>
                        <div class="text text-center pt-4">
                            <h3><a href="#">${cartDto.name}</a></h3>
                            <p>${cartDto.description}</p>
                            <p class="price"><span>${cartDto.price}</span></p>
                            <p><a href="/products/${cartDto.productId}" class="btn btn-primary btn-outline-primary">Thêm vào giỏ hàng</a></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
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

	// Lưu trữ vị trí cuối cùng của trang khi dừng lại
	window.onbeforeunload = function() {
		localStorage.setItem('scrollPosition', window.pageYOffset);
	};
	window.onload = function() {
		var scrollPosition = localStorage.getItem('scrollPosition');
		if (scrollPosition !== null) {
			window.scrollTo(0, parseInt(scrollPosition));
		}
		localStorage.removeItem('scrollPosition');
	};

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
        } else if (x === "fail_checkout") {
            $("#response").html("<div class ='alert alert-danger' role='alert' style='text-align: center; font-size: 20px;'><b> Bạn chưa có sản phẩm nào để thanh toán </b></div>").fadeIn(200).fadeOut(5000)
            return;
        }
    })
</script>
</body>
</html>