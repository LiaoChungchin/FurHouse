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
	<link href="assets/css/component-shopping.css" rel="stylesheet">
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- User Define JS -->
	<script src="assets/js/index.js"></script>
	<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
	
	<style>
body {
	padding: 0px;
}

.SupportCatItem {
	float: left;
	width: calc(95%/ 3);
 	height: 100%; 
	position: relative;
	margin: 5px 5px;
}

.SupportCatItem>a {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	width: 100%;
	background-image: linear-gradient(-180deg, rgba(0, 0, 0, 0.00) 50%,
		rgba(0, 0, 0, 0.85) 100%);
	border-radius: 10PX;
}

.SupportCatItem .info {
	position: absolute;
	bottom: 0;
	padding: 10px 5px;
	color: rgba(250, 250, 250, 0.8);
	width: 100%;
}

.SupportCatItem .name {
	color: #fff;
	font-weight: bold;
	font-size: 26px;
}

.SupportCatItem .description {
	width: 70%;
}

.SupportCatItem .link {
	position: absolute;
	bottom: 20px;
	right: 20px;
	float: right;
}

.SupportCatItem img {
	width: 100%;
	height: 100%;
	max-height: 350px;
	min-height: 350px;
	border-radius: 10PX;
}

.receive {
	position: absolute;
	/*  		width:calc(100%- 30px);  */
	top: 0px;
	left: 0px;
	width: 350px;
	height: 350px;
}

.SupportCatItem:hover {
	border-radius: 10PX;
/*  	border: 3px solid rgba(108, 137, 175, 100);  */
	box-shadow: 5px 5px rgba(52, 105, 157, 1);
}

.dead{
/* filter:sepia(1); */
 filter:grayscale(1); 
}

/*	.SupportCatItem:active { 
 		 	border: 2px solid red; 
 		border-radius: 5PX; 
  		border: 3px solid rgba(255, 170, 127,100);  
 		box-shadow: 0 10px 0px 0 rgba(255, 170, 127, 0.2), 0 10px 0px 0  
  			rgba(255, 255, 127, 0.2);  
  		
 	} */
 	
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
	
	
	<script>
		$(function() {
			$("div#menu-detail").show();
			$("div#menu-detail>div>a[class~='active']").removeClass("active");
			$("div#menu-detail>div>a>small:contains('領養浪貓')").parent().addClass("active");
			// 分隔線要顯示
			$("div#menu-detail>div>a:contains('認識浪貓')").next().show();
			// 所有子項目要顯示
			$("div#menu-detail>div>a>small:contains('領養浪貓')").parent().show();
			$("div#menu-detail>div>a>small:contains('助養浪貓')").parent().show();
		});
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
				<main role="main">
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h1 class="h2">我想了解牠~</h1>
					</div>
					<!--main content start-->
					<section id="main-content">
						<section class="wrapper">
							<article class="SupportCat">
								<c:forEach items="${cats}" var="cat" varStatus="s">
									<div class="SupportCatItem background">
										<a href="supportOneCat?supportCatId=${cat.id}"></a>
										<div class="SupportCat photo">
										<c:choose>
										<c:when test="${cat.adoptStatus.id<3}">
										<a href="supportOneCat?supportCatId=${cat.id}"><img
												src="catImageToByte?path=${cat.photo1}" alt="" /></a> 
										</c:when>
										
										<c:when test="${cat.adoptStatus.id==3}">
										<a href="supportOneCat?supportCatId=${cat.id}"><img
												src="catImageToByte?path=${cat.photo1}" alt="" /></a> 
										<a href="supportOneCat?supportCatId=${cat.id}"><img 
										src="assets/img/receive.png" class="receive" alt="..."></a>
										</c:when>
										<c:when test="${cat.adoptStatus.id==4}">
										<a href="supportOneCat?supportCatId=${cat.id}"><img
												src="catImageToByte?path=${cat.photo1}" alt="" class="dead" /></a>
												<a href="supportOneCat?supportCatId=${cat.id}"><img 
												src="assets/img/ribbon.png" class="receive" alt="..."></a>
										</c:when>
									
										</c:choose>
											
<%-- 												<a href="supportOneCat?supportCatId=${cat.id}"> <c:if --%>
<%-- 													test="${cat.adoptStatus.id==3}"> --%>
<!-- 													<img src="assets/img/receive.png" class="receive" alt="..."> -->
<%-- 												</c:if> <c:if test="${cat.adoptStatus.id==4}"> --%>
<!-- 													<img src="assets/img/dead.png" class="receive" alt="..."> -->
<%-- 												</c:if> --%>
<!-- 											</a> -->
										</div>
										<div class="SupportCat info">
											<h2 class="SupportCat name">${cat.nickname}</h2>

											<div class="SupportCat link">
												<a class=" btn btn-primary"
													href="supportOneCat?supportCatId=${cat.id}">我要認識</a>
											</div>
											<div class="SupportCat description">${cat.comment1}</div>
										</div>
									</div>
								</c:forEach>
							</article>
						</section>
					</section>
					<!--main content end-->
				</main>
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
				let memberBadge = `<a class="btn btn-warning" href="<c:url value='/member.myPage'/>" role="button">${sessionScope.login_user.account},您好</a>`;
				$("a#anchor-login-modal").before(memberBadge);
				$("a#myShoppingCart").attr("class","btn btn-outline-warning");
				$("a#myShoppingCart").attr("href","paymentS1");
				$("a#myShoppingCart>span").attr("class","badge btn-danger");
				if(localStorage.myProducts != null){
					var productsListJSON = JSON.parse(localStorage.myProducts);
					var productCount = productsListJSON.length;
					var totalPrice = 0;
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