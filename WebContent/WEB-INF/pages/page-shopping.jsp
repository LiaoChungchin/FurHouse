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
<!-- User Define JS -->
<script src="assets/js/index.js"></script>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
<script src="assets/js/sweetalert.min.js"></script>

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
							let quantity = selectedProducts[i].quantity;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price, quantity);
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
							let quantity = selectedProducts[i].quantity;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price, quantity);
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
							let quantity = selectedProducts[i].quantity;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price, quantity);
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
							let quantity = selectedProducts[i].quantity;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price, quantity);
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
// 						console.log(JSON.parse(xhr.responseText));
						let selectedProducts = JSON.parse(xhr.responseText);
						
						for(let i = 0; i < selectedProducts.length; i ++){
							
							let id = selectedProducts[i].id;
							let quantity = selectedProducts[i].quantity;
							let productName = selectedProducts[i].productName;
							let price = selectedProducts[i].price;
							let cardContent = setCard(id, productName, price, quantity);
							$("div.card-deck").append(cardContent);
						}
					}
				}
			};
		});
		
		//通用card樣板
		function setCard(id, productName, price, quantity){
			
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
			card += "<small class='text-muted'>商品數量：";
			card += quantity;
			card += "</small>";
			card += "</p></div></div></div>";
			
			return card;
		};
	});
</script>

<style>
	/* 卡片組購物車標籤 */
	div#myShoppingBasket {
		bottom: 50%;
		right: 0;
	}
	
	form#form-myShoppingBasket {
		width: 500px;
		font-size: 0.75em;
/* 		border:2px ridge #DEDEDE; */
/* 		border-radius:5px; */
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
  			 background-color: rgba(255,127,80,1);
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
	
	.dropdown-divider:hover,.dropdown-divider:focus {
		 color: #ff4e0d;
		 cursor:url("assets/img/mouse.png"),pointer;
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
		<div id="myShoppingBasket" class="position-fixed btn-group" style="z-index:2;">
			<button type="button"
				class="btn btn-primary dropdown-toggle bi bi-basket"
				id="button-basket" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false" data-display="static">購物籃</button>
			<div class="dropdown-menu dropdown-menu-lg-right border" style="max-height: 350px; overflow-y: auto; overflow-x:hidden;">
				<form class="px-1 py-1" id="form-myShoppingBasket"
					ondrop="drop(event)" ondragover="allowDrop(event)" method="post"
					action="#">
					<div class="form-group" id="noItems">沒有購物商品</div>
				</form>
			</div>
		</div>
	</div>
	
	<button type="button" id="BackTop" class="toTop-arrow"></button>
	
	
	<!-- 購物籃JS -->
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script>
		// 購物籃商品總數
		var productCount = 0;
		// 購物籃商品編號List數組
		var productNoList = new Array(5);
		// 購物籃中的商品集JSON格式
		var productsListJSON = [];
		// 購物籃啟動
	    $("body").on("click", "button#button-basket", function () {
	        $("button#button-basket").dropdown('show');
	    });
	    // 購物藍清單刪除觸發
	    $("body").on("mouseenter", "#form-myShoppingBasket i", function () {
	        this.style.color = "red";
	    })
	    $("body").on("mouseleave", "#form-myShoppingBasket i", function () {
	        this.style.color = "black";
	    })
	    $("body").on("click", "#form-myShoppingBasket i", function () {
	        let divTop = $(this).parent().parent().parent().parent();
	        $(this).parent().parent().remove();
	        productCount--;
	
	        if (productCount === 0) {
	            $("div#form-tittle").remove();
	            $("button:contains('加入結帳清單')").remove();
	            $("div#noItems").show();
	        }
	
	        let productNoListTemp = new Array(5);
	        let removeSN = $(this).parent().parent().find("input").eq(0).attr("id").substr(9);
	        let increment = 0;
	        for (let productNo of productNoList) {
	            if (productNo !== removeSN) {
	                productNoListTemp[increment] = productNo;
	                increment++;
	            }
	        }
	        productNoList = productNoListTemp;
	    })
	    // 購物籃清空並轉到結帳清單中
	    $("body").on("click", "button:contains('加入結帳清單')", function () {
	        // 儲存JSON
	        $("div#form-tittle").nextAll().each(function () {
	            // $(this).find("div").eq(1).find("img").eq(0).attr("src");
	            let impPath = $(this).find("div").eq(1).find("img").eq(0).attr("src");
	            let productPrice = $(this).find("div").eq(4).find("p").eq(0).text();
	            let productName = $(this).find("div").eq(2).find("p").eq(0).text();
	            let productId = $(this).find("div").eq(3).find("input").eq(0).attr("id");
	            productId = productId.substr(9);
	            let productQua = $(this).find("div").eq(3).find("input").eq(0).val();
	            // 創建物件
	            let productObj = new Object();
	            productObj.name = productName;
	            productObj.id = productId;
	            productObj.quantity = productQua;
	            productObj.price = productPrice;
	            productObj.imgSrc = impPath;
	            // 插入JSON數組
	            productsListJSON.push(productObj);
	        })
	        $(this).prev().children("div.row").remove();
	        let aDiv = document.createElement("div");
	        aDiv.setAttribute("class", "form-group");
	        aDiv.setAttribute("id", "shipping-Done");
	        aDiv.innerHTML = "已加入結帳清單!";
	        $('form#form-myShoppingBasket').append(aDiv);
	        $("button:contains('加入結帳清單')").remove();
	        // 記錄清空
	        productCount = 0;
	        productNoList = new Array(5);
	        // JSON數組清空
	        // productsListJSON = [];
	        // JSON轉型字串
// 	        console.log("購物籃給購物車的JSON : " + JSON.stringify(productsListJSON));
	        localStorage.myProducts = JSON.stringify(productsListJSON);
	        // 在購物車上顯示商品件數
	        if (productsListJSON.length !== 0) {
	            $("span#cart-total").text(productsListJSON.length);
	        }
	    })
	    
	    // 購物籃 drag & drop function
		function allowDrop(ev) {
		    ev.preventDefault();
		}
		
		function drag(ev) {
		    ev.dataTransfer.setData("text", ev.target.id);
		    ev.dataTransfer.effectAllowed = "copy";
		}
		
		function drop(ev) {
		    ev.preventDefault();
		    if (productCount === 0) {
		        // 給定字段名稱
		        $("div#noItems").hide();
		        let aDivTop = document.createElement("div");
		        aDivTop.setAttribute("class", "row form-group");
		        aDivTop.setAttribute("id", "form-tittle");
		        let b0DivTop = document.createElement("div");
		        b0DivTop.setAttribute("class", "col-lg-1");
		        let b1DivTop = document.createElement("div");
		        b1DivTop.setAttribute("class", "col-lg-2");
		        let b2DivTop = document.createElement("div");
		        b2DivTop.setAttribute("class", "col-lg-5");
		        b2DivTop.innerText = "商品名稱";
		        let b3DivTop = document.createElement("div");
		        b3DivTop.setAttribute("class", "col-lg-2");
		        b3DivTop.innerText = "數量";
		        let b4DivTop = document.createElement("div");
		        b3DivTop.setAttribute("class", "col-lg-2");
		        b4DivTop.innerText = "價格";
		        aDivTop.appendChild(b0DivTop);
		        aDivTop.appendChild(b1DivTop);
		        aDivTop.appendChild(b2DivTop);
		        aDivTop.appendChild(b3DivTop);
		        aDivTop.appendChild(b4DivTop);
		        $("form#form-myShoppingBasket").append(aDivTop);
		    }
		    // 商品總數大於5件，購物籃會裝不下
		    if (productCount >= 5) {
		        return;
		    }
		    // 不予許重複拉商品進購物籃
		    for (let productNo of productNoList) {
		        if (ev.dataTransfer.getData("text") === productNo) {
		            return;
		        }
		    }
		    // 登記商品總個術與商品編號清單
		    productNoList[productCount] = ev.dataTransfer.getData("text");
		    productCount++;
		    // 每個商品的格式
		    let data = ev.dataTransfer.getData("text");
		    let original = document.getElementById(data);
		    // <div> root tag
		    let aDiv = document.createElement("div");
		    aDiv.setAttribute("class", "row form-group");
		    // <div>-<div> has col-1
		    let b0Div = document.createElement("div");
		    b0Div.setAttribute("class", "col-lg-1");
		    b0Div.innerHTML = "<i class=\"bi bi-x-circle-fill\"></i>";
		    // <div>-<div> has col-2
		    let b1Div = document.createElement("div");
		    b1Div.setAttribute("class", "col-lg-2");
		    // <div>-<div> has col-5
		    let b2Div = document.createElement("div");
		    b2Div.setAttribute("class", "col-lg-5");
		    // <div>-<div> has col-2
		    let b3Div = document.createElement("div");
		    b3Div.setAttribute("class", "col-lg-2");
		    // <div>-<div> has col-2
		    let b4Div = document.createElement("div");
		    b4Div.setAttribute("class", "col-lg-2");
		    // <div> - <div1> - <img>
		    let copyimg = document.createElement("img");
		    copyimg.setAttribute("width", "60px");
		    copyimg.setAttribute("height", "60x");
		    copyimg.setAttribute("src", original.getAttribute("src"));
		    // <div> - <div2> - <p1>
		    let aP = document.createElement("p");
		    let data2 = "#" + data;
		    let productName = $(data2).parent().find("h5").eq(0).text();
		    let aPtext = document.createTextNode(productName);
		    aP.appendChild(aPtext);
		    // <div> - <div3> - <input>
		    let aInput = document.createElement("input");
		    aInput.setAttribute("class", "form-control form-control-sm");
		    aInput.setAttribute("type", "text");
		    let productSN = "productSN" + ev.dataTransfer.getData("text");
		    aInput.setAttribute("id", productSN);
		    aInput.setAttribute("value", "1");
		    // <div> - <div4> - <p2>
		    let aP2 = document.createElement("p");
		    let productPrice = ($(data2).parent().find("p").eq(0).text()).substr(3);
		    let aPtext2 = document.createTextNode(productPrice);
		    aP2.appendChild(aPtext2);
		    // 加入form表中
		    b1Div.appendChild(copyimg);
		    b2Div.appendChild(aP);
		    b3Div.appendChild(aInput);
		    b4Div.appendChild(aP2);
		    aDiv.appendChild(b0Div);
		    aDiv.appendChild(b1Div);
		    aDiv.appendChild(b2Div);
		    aDiv.appendChild(b3Div);
		    aDiv.appendChild(b4Div);
		    $("form#form-myShoppingBasket").append(aDiv);
		    // 建立加入結帳清單的按鈕
		    if (productCount === 1) {		
		        // 只建立一個對應JS的按鈕，不送出表單
		        $("div#shipping-Done").remove();
		        let butt = document.createElement("button");
		        butt.setAttribute("type", "button");
		        butt.setAttribute("class", "btn btn-secondary btn-sm btn-block");
		        <c:if test="${sessionScope.login_user == null}">
		        	butt.innerHTML = "請先登入會員";
	        	</c:if>
	        	<c:if test="${sessionScope.login_user != null}">
		        	butt.innerHTML = "加入結帳清單";
	        	</c:if>
		        $("form#form-myShoppingBasket").parent().append(butt);
		        <c:if test="${sessionScope.login_user == null}">
		        	$("button:contains('請先登入會員')").prop('disabled', true);
		        </c:if>
		        <c:if test="${sessionScope.login_user == null}">
		        	$("button:contains('加入結帳清單')").prop('disabled', true);
		        </c:if>
		    }
		}
	</script>

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
// 					alert("請先登入會員喔~~~");
					swal("請先登入會員喔!", "謝謝您~~~", "warning");
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