<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon"> 
	
	<!-- Bootstrap CSS -->
	<link href="assets/css/bootstrap.css" rel="stylesheet">
	<link href="assets/css/bootstrap-icons.css" rel="stylesheet">
	<!-- User Define CSS -->
	<link href="assets/css/index.css" rel="stylesheet">
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/anime.min.js"></script>
	
	<!-- User Define JS -->
	<script src="assets/js/index.js"></script>
	<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
	
	<script>
		$(function(){
			$("div#menu-detail").hide();
			$("a#v-pills-home-tab").removeClass("active");
			$("div#div-v-pills").addClass("offset-lg-1");
		})
	</script>
	
	<title>FurHouse</title>
	
	<%-- EL接收session中的member bean有沒有認證過 --%>
	<c:if test="${loginErrorMsg != null}">
		<script>
			window.alert("${loginErrorMsg}");
		</script>
	</c:if>
</head>
<body>
	<div
		class="d-flex flex-column flex-md-row align-items-center p-2 px-md-4 mb-3 bg-white border-bottom shadow-sm"
		w3-include-html="<c:url value='/addFrame.controller/header'/>"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" id="menu-detail"
				w3-include-html="<c:url value='/addFrame.controller/aside'/>"></div>
			<div class="col-lg-10" id="div-v-pills">
			
				<div class="col-lg-8 offset-lg-2 bg-light p-5 rounded">
					<h1 class="text-center mt-3">參考資料(Reference)</h1><br>
					<img class="mb-2" src="assets/img/Catbow-nobg.png" alt="" width="128px" height="128px" 
							style="display:block; margin-left:auto; margin-right:auto;">
					<p class="text-center font-weight-bold">CatBow 貓飽×貓寶</p>
					<hr>
					<div class="row">
					<div class="col-6 text-right">
						<p>寵物好事多</p> 
						<p>Pchome購物</p> 
						<p>動物星球</p>
						<p>貓咪幼幼班-北部貓咪認養專區</p> 
						<p>桌面壁紙</p> 
						<p>GoogleMap</p>  
					</div>
					<div class="col-6">
						<p>http://happypet.com.tw</p>
						 <p>https://shopping.pchome.com.tw</p>
						 <p>https://www.animal.com.tw/</p>
						 <p>https://www.facebook.com/groups/408954489141421</p>
						 <p>https://desk.zol.com.cn/dongwu/mengmao/</p>
						 <p>https://www.google.com.tw/maps</p>
					</div>
					</div>

			</div>
		</div>
	</div>

	<!-- 插入會員登入的 Modal start -->
	<c:if test="${sessionScope.login_user == null}">
		<div class="modal fade" id="component-login" tabindex="-1"
			role="dialog" aria-labelledby="LoginTitle" aria-hidden="true"
			w3-include-html="<c:url value='/component.login'/>"></div>
	</c:if>
	<c:if test="${sessionScope.login_user != null}">
		<div class="modal fade" id="component-login" tabindex="-1"
			role="dialog" aria-labelledby="LoginTitle" aria-hidden="true"
			w3-include-html="<c:url value='/component.relogin'/>"></div>
	</c:if>
	<!-- 插入會員登入的 Modal end -->
	
	<!-- 登入會員後會出現的會員專區連結 -->
	<c:if test="${sessionScope.login_user != null}">
		<script>
			$(document).ready(function () {
				$("a#anchor-login-modal").text("登出");
				let memberBadge = `<a class="btn btn-warning" href="<c:url value='/member.myPage'/>" role="button">${sessionScope.login_user.name},您好</a>`;
				$("a#anchor-login-modal").before(memberBadge);
				$("a#myShoppingCart").attr("class","btn btn-outline-warning");
				$("a#myShoppingCart").attr("href","paymentS1");
				$("a#myShoppingCart>span").attr("class","badge btn-danger");
				if(localStorage.myProducts != null){
					var productsListJSON = JSON.parse(localStorage.myProducts);
					//購物籃商品總數
					var productCount = productsListJSON.length;
					//商品清單總價
					var totalPrice = 0;
					//新增圖標判斷
					$("span#cart-total").text(productsListJSON.length);
				}
			});
		</script>
	</c:if>
	<c:if test="${sessionScope.login_user == null}">
		<script>
			$(document).ready(function (){
				$("body").on("click","a#myShoppingCart",function() {
					alert("請先登入會員喔~~~");
				});
				if(localStorage.myProducts != null || localStorage.myProducts == ""){
					localStorage.removeItem('myProducts');
				}
			});

		</script>
	</c:if>

	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
</body>
</html>