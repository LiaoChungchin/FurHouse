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
<link rel="shortcut icon" href="assets/img/favicon.ico"
	type="image/x-icon">

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
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
<!-- User Define JS -->
<script src="assets/js/index.js"></script>

<script>
	$(document).ready(function () {
    	// 匯入include所有語句
   	 w3.includeHTML();
	});
	$(function() {
		$('#BackTop').click(function() {
			$('html,body').animate({
				scrollTop : 0
			}, 333);
		});
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('#BackTop').fadeIn(200);
			} else {
				$('#BackTop').stop().fadeOut(200);
			}
		}).scroll();
		

		$("div#menu-detail").show();
		$("div#menu-detail>div>a[class~='active']").removeClass("active");
		$("div#menu-detail>div>a>small:contains('所有商品')").parent().addClass("active");
		// 分隔線要顯示
		$("div#menu-detail>div>a:contains('購物商城')").next().show();
		// 所有子項目要顯示
		$("div#menu-detail>div>a>small:contains('所有商品')").parent().show();
		$("div#menu-detail>div>a>small:contains('飼糧')").parent().show();
		$("div#menu-detail>div>a>small:contains('罐頭餐')").parent().show();
		$("div#menu-detail>div>a>small:contains('清潔用品')").parent().show();
		$("div#menu-detail>div>a>small:contains('遊樂玩具')").parent().show();
		$("div#menu-detail>div>a>small:contains('生活用品')").parent().show();
		
		$("body").on("click", "a#v-pills-shopping-diet-tab", function(){
			
			$("div#menu-detail>div>a[class~='active']").removeClass("active");
			$("div#menu-detail>div>a>small:contains('飼糧')").parent().addClass("active");
			
			$("div#div-v-pills").html("<div class='container-fluid'><div class='v-pills-shopping-title' id='diet'><h3>&nbsp;&nbsp;&nbsp;飼糧</h3></div><div class='card-deck'></div></div></div></div>");
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", ("<c:url value='/product.selectByType'/>" + "/" + "飼糧"), true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						
						let selectedProducts = JSON.parse(xhr.responseText);
// 						console.log(JSON.parse(xhr.responseText));
						
						for(let i = 0; i < selectedProducts.length; i ++){
							
							let id = selectedProducts[i].id;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price);
							$("div.card-deck").append(cardContent);
						}
					}
				}
			};
		});
		$("body").on("click", "a#v-pills-shopping-can-tab", function(){
			
			$("div#menu-detail>div>a[class~='active']").removeClass("active");
			$("div#menu-detail>div>a>small:contains('罐頭餐')").parent().addClass("active");
			$("div#div-v-pills").html("<div class='container-fluid'><div class='v-pills-shopping-title' id='can'><h3>&nbsp;&nbsp;&nbsp;罐頭餐</h3></div><div class='card-deck'></div></div></div></div>");
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", ("<c:url value='/product.selectByType'/>" + "/" + "罐頭餐"), true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						
						let selectedProducts = JSON.parse(xhr.responseText);
						
						for(let i = 0; i < selectedProducts.length; i ++){
							
							let id = selectedProducts[i].id;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price);
							$("div.card-deck").append(cardContent);
						}
					}
				}
			};
		});
		$("body").on("click", "a#v-pills-shopping-clean-tab", function(){
			
			$("div#menu-detail>div>a[class~='active']").removeClass("active");
			$("div#menu-detail>div>a>small:contains('清潔用品')").parent().addClass("active");
			$("div#div-v-pills").html("<div class='container-fluid'><div class='v-pills-shopping-title' id='clean'><h3>&nbsp;&nbsp;&nbsp;清潔用品</h3></div><div class='card-deck'></div></div></div></div>");
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", ("<c:url value='/product.selectByType'/>" + "/" + "清潔用品"), true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						
						let selectedProducts = JSON.parse(xhr.responseText);
						
						for(let i = 0; i < selectedProducts.length; i ++){
							
							let id = selectedProducts[i].id;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price);
							$("div.card-deck").append(cardContent);
						}
					}
				}
			};
		});
		$("body").on("click", "a#v-pills-shopping-fun-tab", function(){
			
			$("div#menu-detail>div>a[class~='active']").removeClass("active");
			$("div#menu-detail>div>a>small:contains('遊樂玩具')").parent().addClass("active");
			$("div#div-v-pills").html("<div class='container-fluid'><div class='v-pills-shopping-title' id='fun'><h3>&nbsp;&nbsp;&nbsp;遊樂玩具</h3></div><div class='card-deck'></div></div></div></div>");
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", ("<c:url value='/product.selectByType'/>" + "/" + "遊樂玩具"), true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						
						let selectedProducts = JSON.parse(xhr.responseText);
						
						for(let i = 0; i < selectedProducts.length; i ++){
							
							let id = selectedProducts[i].id;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price);
							$("div.card-deck").append(cardContent);
						}
					}
				}
			};
		});
		$("body").on("click", "a#v-pills-shopping-dailyuse-tab", function(){
			
			$("div#menu-detail>div>a[class~='active']").removeClass("active");
			$("div#menu-detail>div>a>small:contains('生活用品')").parent().addClass("active");
			$("div#div-v-pills").html("<div class='container-fluid'><div class='v-pills-shopping-title' id='dailyuse'><h3>&nbsp;&nbsp;&nbsp;生活用品</h3></div><div class='card-deck'></div></div></div></div>");
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", ("<c:url value='/product.selectByType'/>" + "/" + "生活用品"), true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						console.log(JSON.parse(xhr.responseText));
						let selectedProducts = JSON.parse(xhr.responseText);
						
						for(let i = 0; i < selectedProducts.length; i ++){
							
							let id = selectedProducts[i].id;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price);
							$("div.card-deck").append(cardContent);
						}
					}
				}
			};
		});
		
		//通用card樣板
		function setCard(id, productName, price){
			
			var card = "";
			
			card += "<div class='col-md-3' style='margin-bottom: 30px;'>";
			card += "<div class='card SelectProductByClass' id='prod";
			card += id;
			card += "'>";
			card += "<img src='/FurHouse/product.getPhoto/";
			card += id;
			card += "/photo1'";
			card += "class='card-img-top' alt='...' id='";
			card += id
			card += "' draggable='true' ondragstart='drag(event)'>";
			card += "<div class='card-body'>";
			card += "<h5 class='card-title'>";
			card += productName;
			card += "</h5>";
			card += "<p class='card-text text-danger font-weight-bold'>$NT";
			card += price;
			card += "</p>";
			card += "<p class='card-text'>";
			card += "<small class='text-muted'>商品編號：";
			card += id;
			card += "</small>";
			card += "</p></div></div></div>";
			
			return card;
		};
	});
</script>

<style>
	/* 卡片組購物車標籤 */
	div#myShoppingBasket {
		bottom: 75%;
		right: 0;
	}
	
	form#form-myShoppingBasket {
		width: 500px;
		font-size: 0.75em;
		border:2px ridge #DEDEDE;
		border-radius:5px;
	}
	
	.v-pills-shopping-title {
		/* 	padding: 10px; */
		width: 400px;
		margin: 10px;
		padding: 15px 0 10px 10px;
		color: #af3f3f;
		line-height: 22px;
		border-bottom: 3px solid #ecc2b1;
	}
	
	
	/* 商品卡片選中效果 */
	.card:hover {
		border-radius: 10PX;
		border: 2px solid rgba(108, 137, 175, 0.5);
		box-shadow: 0 15px 10px 0 rgba(52, 105, 157, 0.2), 0 15px 10px 0
			rgba(52, 105, 157, 0.2);
	}
	
	.card:active {
		/* 	border: 2px solid red; */
		border-radius: 5PX;
		border: 3px solid rgba(255, 170, 127, 0.5);
		box-shadow: 0 15px 10px 0 rgba(255, 170, 127, 0.2), 0 15px 10px 0
			rgba(255, 255, 127, 0.2);
	}
	
	/* 40px */
	/* 按鈕大小：.toTop-arrow 中的 width 及 height
				按鈕顏色：.toTop-arrow 中的 background 搭配 opacity 設定透明度
				按鈕外型：.toTop-arrow 中的 border-radius，50% 變成圓形按鈕，0% 則是正方形
				浮動位置：.toTop-arrow 中的 right 及 bottom
				箭頭顏色：.toTop-arrow::before, .toTop-arrow::after 中的 background
				箭頭粗細：.toTop-arrow::before, .toTop-arrow::after 中的 height: 7px; 及 width: 31px;
				箭頭位置：.toTop-arrow::before 的 left 及 .toTop-arrow::after 的 right，及兩者的 translate(0, -50%) */
	.toTop-arrow {
		width: 2.5rem;
		height: 2.5rem;
		padding: 0;
		margin: 0;
		border: 0;
		border-radius: 33%;
		opacity: 0.6;
		background: #c78a82;
		cursor: pointer;
		position: fixed;
		right: 1rem;
		bottom: 1rem;
		display: none;
	}
	
	.toTop-arrow::before, .toTop-arrow::after {
		width: 18px;
		height: 5px;
		border-radius: 3px;
		background: #ffd3cf;
		position: absolute;
		content: "";
	}
	
	.toTop-arrow::before {
		transform: rotate(-45deg) translate(0, -50%);
		left: 0.5rem;
	}
	
	.toTop-arrow::after {
		transform: rotate(45deg) translate(0, -50%);
		right: 0.5rem;
	}
	
	.toTop-arrow:focus {
		outline: none;
	}
	
	.nav-pills .nav-link.active, .nav-pills .show > .nav-link{
  			 color: #fff;
  			 /*background-color: rgba(255,127,80,1);*/
  			 background-color: rgba(255,134,51,0.9);
	}
	.nav-pills a:hover {
	    color: #ff4e0d;
	    cursor:url("assets/img/mouse.png"),pointer;
	}
	.nav-link {
		display: block;
   		padding: 0.8rem 1rem;
	}
	a {
	    color: #404040;
	    text-decoration: none;
	    background-color: transparent;
	}
	small, .small {
	    font-size: 90%;
	    font-weight: 400;
	}
</style>

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
			
				<!-- ###置入本頁資訊### -->
				<div class="container-fluid">
				
					<!-- ###輪播圖廣告區### -->
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
						  	<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						  	<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
					  	<div class="carousel-inner">
					   		<div class="carousel-item active">
					    		<img src="assets/img/ad1.jpg" class="d-block w-100" alt="...">
					   		</div>
					   		<div class="carousel-item">
					    		<img src="assets/img/ad2.jpg" class="d-block w-100" alt="...">
					    	</div>
					    	<div class="carousel-item">
					    		<img src="assets/img/ad3.jpg" class="d-block w-100" alt="...">
					    	</div>
					  	</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    	<span class="sr-only">Previous</span>
						</a>
					  	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
					    	<span class="sr-only">Next</span>
						</a>
					</div>
					<!-- ###輪播圖結尾### -->
					
					<div class="v-pills-shopping-title" id="diet">
						<h3>&nbsp;&nbsp;&nbsp;飼糧</h3>
					</div>

					<div class="card-deck">
						<c:forEach items="${Products}" var="product">
							<c:set var="flag" value="false" />
							<c:choose>
								<c:when test="${product.type =='飼糧'}">
									<!-- 調整卡片分佈 -->
									<div class="col-md-3" style="margin-bottom: 30px;">
										<div class="card SelectProductByClass" id="prod${product.id}">
											<img src="<c:url value='/product.getPhoto/${product.id}/photo1' />"
												class="card-img-top" alt="..." id="${product.id}"
												draggable="true" ondragstart="drag(event)">
											<div class="card-body">
												<h5 class="card-title">${product.productName}</h5>
												<p class="card-text text-danger font-weight-bold">$NT${product.price}</p>
												<p class="card-text">
													<small class="text-muted">產品數量：${product.quantity}</small>
												</p>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>

					<!--  我是第二個類別分隔線 -->
					<div class="v-pills-shopping-title" id="can">
						<h3>&nbsp;&nbsp;&nbsp;罐頭餐</h3>
					</div>
					<div class="card-deck">
						<c:forEach items="${Products}" var="product">
							<c:set var="flag" value="false" />
							<c:choose>
								<c:when test="${product.type =='罐頭餐'}">
							<!-- 調整卡片分佈 -->
									<div class="col-md-3" style="margin-bottom: 30px;">
										<div class="card SelectProductByClass" id="prod${product.id}">
											<img src="<c:url value='product.getPhoto/${product.id}/photo1' />"
												class="card-img-top" alt="..." id="${product.id}"
												draggable="true" ondragstart="drag(event)">
											<div class="card-body">
												<h5 class="card-title">${product.productName}</h5>
												<p class="card-text text-danger font-weight-bold">$NT${product.price}</p>
												<p class="card-text">
													<small class="text-muted">產品數量：${product.quantity}</small>
												</p>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>

					<!-- 我是第三個類別分隔線 -->
					<div class="v-pills-shopping-title" id="clean">
						<h3>&nbsp;&nbsp;&nbsp;清潔用品</h3>
					</div>
					<div class="card-deck">
						<c:forEach items="${Products}" var="product">
							<c:set var="flag" value="false" />
							<c:choose>
								<c:when test="${product.type =='清潔用品'}">
									<!-- 調整卡片分佈 -->
									<div class="col-md-3" style="margin-bottom: 30px;">
										<div class="card SelectProductByClass" id="prod${product.id}">
											<img src="<c:url value='product.getPhoto/${product.id}/photo1' />"
												class="card-img-top" alt="..." id="${product.id}"
												draggable="true" ondragstart="drag(event)">
											<div class="card-body">
												<h5 class="card-title">${product.productName}</h5>
												<p class="card-text text-danger font-weight-bold">$NT${product.price}</p>
												<p class="card-text">
													<small class="text-muted">產品數量：${product.quantity}</small>
												</p>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>

					<!-- 我是第四個類別分隔線 -->
					<div class="v-pills-shopping-title" id="fun">
						<h3>&nbsp;&nbsp;&nbsp;遊樂玩具</h3>
					</div>
					<div class="card-deck">
						<c:forEach items="${Products}" var="product">
							<c:set var="flag" value="false" />
							<c:choose>
								<c:when test="${product.type =='遊樂玩具'}">
									<!-- 調整卡片分佈 -->
									<div class="col-md-3" style="margin-bottom: 30px;">
										<div class="card SelectProductByClass" id="prod${product.id}">
											<img src="<c:url value='product.getPhoto/${product.id}/photo1' />"
												class="card-img-top" alt="..." id="${product.id}"
												draggable="true" ondragstart="drag(event)">
											<div class="card-body">
												<h5 class="card-title">${product.productName}</h5>
												<p class="card-text text-danger font-weight-bold">$NT${product.price}</p>
												<p class="card-text">
													<small class="text-muted">產品數量：${product.quantity}</small>
												</p>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>

					<!--  我是第五個類別分隔線 -->
					<div class="v-pills-shopping-title" id="dailyuse">
						<h3>&nbsp;&nbsp;&nbsp;生活用品</h3>
					</div>
					<div class="card-deck">
						<c:forEach items="${Products}" var="product">
							<c:set var="flag" value="false" />
							<c:choose>
								<c:when test="${product.type =='生活用品'}">
									<!-- 調整卡片分佈 -->
									<div class="col-md-3" style="margin-bottom: 30px;">
										<div class="card SelectProductByClass" id="prod${product.id}">
											<img src="<c:url value='product.getPhoto/${product.id}/photo1' />"
												class="card-img-top" alt="..." id="${product.id}"
												draggable="true" ondragstart="drag(event)">
											<div class="card-body">
												<h5 class="card-title">${product.productName}</h5>
												<p class="card-text text-danger font-weight-bold">$NT${product.price}</p>
												<p class="card-text">
													<small class="text-muted">產品數量：${product.quantity}</small>
												</p>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="myShoppingBasket" class="position-fixed btn-group ">
				<button type="button"
					class="btn btn-info dropdown-toggle bi bi-basket"
					id="button-basket" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" data-display="static">購物籃</button>
				<div
					class="dropdown-menu dropdown-menu-lg-right border border-light">
					<form class="px-1 py-1" id="form-myShoppingBasket"
						ondrop="drop(event)" ondragover="allowDrop(event)" method="post"
						action="#">
						<div class="form-group" id="noItems">沒有購物商品</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<button type="button" id="BackTop" class="toTop-arrow"></button>


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
				let memberBadge = `<a class="btn btn-warning" href="<c:url value='/member.myPage'/>" role="button"> Hi ~ ${sessionScope.login_user.account} <span class='badge badge-light'> 0 </span> </a>`;
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
				if(localStorage.myProducts != null){
					var productsListJSON = JSON.parse(localStorage.myProducts);
					var productCount = productsListJSON.length;
					var totalPrice = 0;
					$("span#cart-total").text(productsListJSON.length);
				}
			});
		</script>
	</c:if>
	
	
	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>

</body>
</html>