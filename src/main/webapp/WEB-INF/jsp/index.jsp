<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="vi">
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
	<div class="slider-item active" style="background-image: url(images/bg_1.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

				<div class="col-md-8 col-sm-12 text-center ftco-animate">
					<span class="subheading">Welcome</span>
					<h1 class="mb-4">Trải nghiệm cà phê với hương vị tuyệt đỉnh</h1>
<%--					<p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>--%>
					<p><a href="/categories" class="btn btn-primary p-3 px-xl-4 py-xl-3">Đặt Ngay</a> <a href="/categories" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">Xem Menu</a></p>
				</div>

			</div>
		</div>
	</div>

	<div class="slider-item" style="background-image: url(images/bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

				<div class="col-md-8 col-sm-12 text-center ftco-animate">
					<span class="subheading">Welcome</span>
					<h1 class="mb-4">Hương vị tuyệt vời và Địa điểm tuyệt đẹp</h1>
<%--					<p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>--%>
					<p><a href="/categories" class="btn btn-primary p-3 px-xl-4 py-xl-3"> Đặt Ngay </a> <a href="/categories" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">Xem Menu</a></p>
				</div>

			</div>
		</div>
	</div>

	<div class="slider-item" style="background-image: url(images/bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

				<div class="col-md-8 col-sm-12 text-center ftco-animate">
					<span class="subheading">Welcome</span>
					<h1 class="mb-4">Chúng tôi sẵn sàng để phục vụ</h1>
<%--					<p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>--%>
					<p><a href="/categories" class="btn btn-primary p-3 px-xl-4 py-xl-3"> Đặt  Ngay </a> <a href="/categories" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">Xem Menu</a></p>
				</div>

			</div>
		</div>
	</div>
</section>

<section class="ftco-intro">
	<div class="container-wrap">
		<div class="wrap d-md-flex align-items-xl-end">
			<div class="info">
				<div class="row no-gutters">
					<div class="col-md-4 d-flex ftco-animate">
						<div class="icon"><span class="icon-phone"></span></div>
						<div class="text">
							<h3>+84 123 456 789</h3>
							<p>Sẵn sàng phục vụ các bạn</p>
						</div>
					</div>
					<div class="col-md-4 d-flex ftco-animate">
						<div class="icon"><span class="icon-my_location"></span></div>
						<div class="text">
							<h3>123 Lý Thường Kiệt</h3>
							<p>Trường Đại học Quảng Bình, Đồng Hới, Quảng Bình</p>
						</div>
					</div>
					<div class="col-md-4 d-flex ftco-animate">
						<div class="icon"><span class="icon-clock-o"></span></div>
						<div class="text">
							<h3>Mở cửa T2-T6</h3>
							<p>8:00 - 22:00</p>
						</div>
					</div>
				</div>
			</div>
			<div class="book p-4">
				<h3>Đặt bàn</h3>
				<form action="#" class="appointment-form">
					<div class="d-md-flex">
						<input type="text" class="form-control" placeholder="Họ và tên">
					</div>
					<div class="d-md-flex">
						<div class="form-group">
							<div class="input-wrap">
								<div class="icon"><span class="ion-md-calendar"></span></div>
								<input type="text" class="form-control appointment_date" placeholder="Ngày">
							</div>
						</div>
						<div class="form-group ml-md-4">
							<div class="input-wrap">
								<div class="icon"><span class="ion-ios-clock"></span></div>
								<input type="text" class="form-control appointment_time" placeholder="Giờ">
							</div>
						</div>
						<div class="form-group ml-md-4">
							<input type="text" class="form-control" placeholder="Điện thoại">
						</div>
					</div>
					<div class="d-md-flex">
						<div class="form-group">
							<textarea name="" cols="30" rows="2" class="form-control" placeholder="Ghi chú"></textarea>
						</div>
						<div class="form-group ml-md-4">
							<input type="submit" value="Đặt Bàn" class="btn btn-white py-3 px-4">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%--<section class="ftco-section">--%>
<%--</section>--%>
<section class="ftco-section">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-6 pr-md-5">
				<div class="heading-section text-md-right ftco-animate">
					<span class="subheading">Khám Phá</span>
					<h2 class="mb-4">Menu của chúng tôi</h2>
					<p class="mb-4">Đầy đủ sự lựa chọn cho bạn</p>
					<p><a href="/categories" class="btn btn-primary btn-outline-primary px-4 py-3">XEM MENU ĐẦY ĐỦ</a></p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-6">
						<div class="menu-entry">
							<a href="/categories" class="img" style="background-image: url(https://d1sag4ddilekf6.cloudfront.net/compressed_webp/items/VNITE20210621155723031857/detail/996a0989402d4515bef5b8f10bc51b3d_1645025410615836646.webp);"></a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="menu-entry mt-lg-4">
							<a href="/categories" class="img" style="background-image: url(https://d1sag4ddilekf6.cloudfront.net/compressed_webp/items/VNITE20210621155724059987/detail/54f942e6635c4e798cf6676f4f6d1894_1645025412192263825.webp);"></a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="menu-entry">
							<a href="/categories" class="img" style="background-image: url(https://d1sag4ddilekf6.cloudfront.net/compressed_webp/items/VNITE20210621155725050164/detail/db33c75c1f754f0fb89122509d794849_1645025413727095906.webp);"></a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="menu-entry mt-lg-4">
							<a href="/categories" class="img" style="background-image: url(https://d1sag4ddilekf6.cloudfront.net/compressed_webp/items/VNITE20210621155725037966/detail/bb9bbdb5bf6f486f996fc353d3d50ab4_1645025413011480276.webp);"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-services">
	<div class="container">
		<div class="row">
			<div class="col-md-4 ftco-animate">
				<div class="media d-block text-center block-6 services">
					<div class="icon d-flex justify-content-center align-items-center mb-5">
						<span class="flaticon-choices"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Dễ dàng đặt hàng</h3>
						<span style="color: #0b0b0b">Giao diện thân thiện với người dùng, dễ dàng đặt hàng sau khi đăng nhập</span>
					</div>
				</div>
			</div>
			<div class="col-md-4 ftco-animate">
				<div class="media d-block text-center block-6 services">
					<div class="icon d-flex justify-content-center align-items-center mb-5">
						<span class="flaticon-delivery-truck"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Giao hàng nhanh chóng</h3>
						<p>Giao hàng tận nơi, nhanh chóng, phục vụ mọi người mọi lúc mọi nơi</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 ftco-animate">
				<div class="media d-block text-center block-6 services">
					<div class="icon d-flex justify-content-center align-items-center mb-5">
						<span class="flaticon-coffee-bean"></span></div>
					<div class="media-body">
						<h3 class="heading">Cà phê chất lượng</h3>
						<p>Với sự chọn lọc kỹ lưỡng và hợp tác với nhà sản xuất uy tín chúng tôi tự tin đây là ưu điểm đáng tự hào</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon"><span class="flaticon-coffee-cup"></span></div>
								<strong class="number" data-number="100">0</strong>
								<span>Chi nhánh</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon"><span class="flaticon-coffee-cup"></span></div>
								<strong class="number" data-number="85">0</strong>
								<span>Giải thưởng</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon"><span class="flaticon-coffee-cup"></span></div>
								<strong class="number" data-number="1056701">0</strong>
								<span>Khách hàng đánh giá cao</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon"><span class="flaticon-coffee-cup"></span></div>
								<strong class="number" data-number="900">0</strong>
								<span>Nhân viên</span>
							</div>
						</div>
					</div>
				</div>
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

<section class="ftco-section img" id="ftco-testimony" style="background-image: url(images/bg_1.jpg);"  data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center mb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">Feedback</span>
				<h2 class="mb-4">Nhận xét của chuyên gia</h2>
				<p>CHÚNG TÔI SẼ CẨN TRỌNG VỚI NHỮNG LỜI NHẬN XÉT VÀ DẦN HOÀN THIỆN HƠN.</p>
			</div>
		</div>
	</div>
	<div class="container-wrap">
		<div class="row d-flex no-gutters">
			<div class="col-lg align-self-sm-end ftco-animate">
				<div class="testimony">
					<blockquote>
						<p>&ldquo;Vị ngọt của cà phê được cảm nhận cảm nhận ở đầu lưỡi, vị ngọt nhẹ của cà phê rất quan trọng vì nó làm quân bình vị đắng và chua của cà phê. Cà phê ngon sẽ có vị ngọt tự nhiên làm hài hòa thể chất của cà phê.&rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="images/person_3.jpg" alt="">
						</div>
						<div class="name align-self-center">Nguyễn Ngọc Tuấn <span class="position">Illustrator Designer</span></div>
					</div>
				</div>
			</div>
			<div class="col-lg align-self-sm-end">
				<div class="testimony overlay">
					<blockquote>
						<p>&ldquo;Là cảm nhận chung về cà phê trong miệng. Vị chua, vị ngọt, hương thơm và thể chất là các thành tố cấu tạo nên hương vị cà phê. Do việc cảm thụ các mùi vị này hòa quyện hài hòa và đồng nhất bởi các giác quan mà tạo ra một sự cảm nhận tổng thể về hương vị của một loại cà phê.&rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="images/person_3.jpg" alt="">
						</div>
						<div class="name align-self-center">Nguyễn Ngọc Tuấn <span class="position">Illustrator Designer</span></div>
					</div>
				</div>
			</div>
			<div class="col-lg align-self-sm-end ftco-animate">
				<div class="testimony">
					<blockquote>
						<p>&ldquo;Vị chua là đặc điểm chính của dòng cà phê Arabica. Vị chua trong cà phê không đóng vai trò giống như vai trò của nó liên quan đến vị chua của rượu vang.&rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="images/person_3.jpg" alt="">
						</div>
						<div class="name align-self-center">Nguyễn Ngọc Tuấn <span class="position">Illustrator Designer</span></div>
					</div>
				</div>
			</div>
			<div class="col-lg align-self-sm-end">
				<div class="testimony overlay">
					<blockquote>
						<p>&ldquo;Vị đắng là cảm nhận về cà phê từ kết quả tương tác của hợp chất Trigonelline trong cà phê với các gai vị giác nằm trên mặt sau của lưỡi.&rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="images/person_3.jpg" alt="">
						</div>
						<div class="name align-self-center">Nguyễn Ngọc Tuấn <span class="position">Illustrator Designer</span></div>
					</div>
				</div>
			</div>
			<div class="col-lg align-self-sm-end ftco-animate">
				<div class="testimony">
					<blockquote>
						<p>&ldquo;Mùi hương thơm của cà phê là cảm nhận đầu tiên mà bạn có được khi pha cà phê, đó là mùi của cà phê bốc lên khi bột cà phê gặp nước sôi. Hương thơm là một cảm nhận về mùi rất khó phân biệt với hương vị.&rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="images/person_3.jpg" alt="">
						</div>
						<div class="name align-self-center">Nguyễn Ngọc Tuấn <span class="position">Illustrator Designer</span></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
</section>

<section class="ftco-appointment">
	<div class="overlay"></div>
	<div class="container-wrap">
		<div class="row no-gutters d-md-flex align-items-center">
			<div class="col-md-6 d-flex align-self-stretch">
				<div id="map"></div>
			</div>
			<div class="col-md-6 appointment ftco-animate">
				<h3 class="mb-3">ĐẶT BÀN</h3>
				<form action="#" class="appointment-form">
					<div class="d-md-flex">
						<input type="text" class="form-control" placeholder="Họ và tên">
					</div>
					<div class="d-md-flex">
						<div class="form-group">
							<div class="input-wrap">
								<div class="icon"><span class="ion-md-calendar"></span></div>
								<input type="text" class="form-control appointment_date" placeholder="Ngày">
							</div>
						</div>
						<div class="form-group ml-md-4">
							<div class="input-wrap">
								<div class="icon"><span class="ion-ios-clock"></span></div>
								<input type="text" class="form-control appointment_time" placeholder="Giờ">
							</div>
						</div>
						<div class="form-group ml-md-4">
							<input type="text" class="form-control" placeholder="Điện thoại">
						</div>
					</div>
					<div class="d-md-flex">
						<div class="form-group">
							<textarea name="" id="" cols="30" rows="2" class="form-control" placeholder="Ghi chú"></textarea>
						</div>
						<div class="form-group ml-md-4">
							<input type="submit" value="Đặt Bàn" class="btn btn-primary py-3 px-4">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="basefragments/footer.jsp"></jsp:include>



<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<script>
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map'), {
			center: {lat: 17.481559, lng: 106.605873},
			zoom: 8
		});
	}
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA55O-qurr3nquTITpUBp-63mWC38CLOO0&libraries=places&callback=initialize"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>

</body>
</html>
