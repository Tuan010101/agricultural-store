<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<section class="ftco-section">
    <div id="response"></div>
    <div class="container" style="margin-top: 5rem">
        <div class="row">
            <form class="row" action="/cart/items" method="post">
                <div class="col-lg-6 mb-5 ftco-animate">
                    <a href="${product.image}" class="image-popup"><img src="${product.image}" class="img-fluid"
                                                                        alt="Colorlib Template"></a>
                </div>
                <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                    <h3>${product.name}</h3>
                    <p class="price"><span>${product.price} Đ</span></p>
                    <p>${product.description}</p>
                    <div class="row mt-4">
                        <div class="w-100"></div>
                        <div class="input-group col-md-6 d-flex mb-3">
								<span class="input-group-btn mr-2">
									<button type="button" class="quantity-left-minus btn">
										<i class="icon-minus"></i>
									</button>
								</span>
                            <input id="quantity" name="amount" class="form-control input-number" value="1">
                            <span class="input-group-btn ml-2">
									<button type="button" class="quantity-right-plus btn">
										<i class="icon-plus"></i>
									</button>
								</span>
                        </div>
                    </div>
                    <input type="hidden" name="productId" value="${id}">
                    <p><input type="submit" class="btn btn-primary py-3 px-5" value="Thêm vào giỏ hàng"></p>
                </div>
            </form>
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
    $(document).ready(function () {
        $('.quantity-right-plus').click(function (e) {
            // Stop acting like a button
            e.preventDefault();

            var quantity = parseInt($('#quantity').val());
            if (quantity < 10) {
                $('#quantity').val(quantity + 1).change();
                //console.log($('#quantity').val())
            }
        });

        $('.quantity-left-minus').click(function (e) {
            // Stop acting like a button
            e.preventDefault();

            // Get the field name
            var quantity = $('#quantity').val();
            if (quantity > 0) {
                $('#quantity').val(quantity - 1).change();
                //console.log($('#quantity').val())
            }
        });

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

        if (x === "insert_faild") {
            $("#response").html("<div class ='alert alert-danger' role='alert' style='text-align: center; font-size: 20px;'><b> Vui lòng đăng nhập trước khi mua hàng </b></div>").fadeIn(200).fadeOut(5000)
            return;
        } else if (x === "insert_success") {
            $("#response").html("<div class ='alert alert-success' role='alert' style='text-align: center; font-size: 20px;'><b> Thêm vào giỏ hàng thành công </b></div>").fadeIn(200).fadeOut(5000)
            return;
        }
    });


</script>


</body>
</html>