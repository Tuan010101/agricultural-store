<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Coffee</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"	 rel="stylesheet">
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

      <div class="slider-item" style="background-image: url(../images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Đặt Hàng</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="/index">Trang chủ</a></span> <span>Đặt Hàng</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>



    <section class="ftco-menu mb-5 pb-5" style="background-color: #4e3e3e">
    	<div class="container">
    		<div class="row d-md-flex">
	    		<div class="col-lg-12 ftco-animate p-md-5">
		    		<div class="row">

                        <div class="col-md-12" style="margin: 0 0 3rem 15px">
                            <form action="/categories" method="get" class="row input-group">
                                <input style="border: 1px solid !important;"  class="col-md-2 form-control rounded" placeholder=" Tên sản phẩm" name="name"/>
                                <button style="border: 1px solid; font-size: 1rem;" type="submit" class="rounded btn btn-secondary">search</button>
                            </form>
                        </div>

                      <div class="col-md-12 nav-link-wrap mb-5">
                        <div class="nav ftco-animate nav-pills justify-content-center">
                            <a class="nav-link ${activeCategory == 0 ? "active":""}" href="/categories" style="margin: 5px">Tất cả</a>
                            <c:forEach var="category" items="${categories}">
                                <a class="nav-link ${activeCategory == category.categoryId ? "active":""}" href="/categories/${category.categoryId}" style="margin: 5px">${category.nameOfCategory}</a>
                            </c:forEach>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="row">
                            <c:forEach items="${allProductList}" var="product">
                                <div class="col-md-3">
                                    <div class="menu-entry">
                                        <a href="/products/${product.productId}" class="img" style="background-image: url(${product.image});"></a>
                                        <div class="text text-center pt-4">
                                            <h3><a href="/products/${product.productId}">${product.name}</a></h3>
                                            <p>${product.description}</p>
                                            <p class="price"><span>${product.price} Đ</span></p>
                                            <p><a href="/products/${product.productId}" class="btn btn-primary btn-outline-primary">Thêm vào giỏ hàng</a></p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                      </div>
                    </div>
                </div>
		    </div>
    	</div>
    </section>

  <jsp:include page="basefragments/footer.jsp"></jsp:include>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  </script>
  </body>
</html>