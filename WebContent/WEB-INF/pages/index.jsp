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
	<style>
		.parallax {
/*  		  width: 100vw; */
 		  height: 100vh;
 		  font-weight: bold;
 		  font-size: 1.25rem;
 		  display: flex;
 		  justify-content: center;
 		  align-items: center;
		}
		.bg1 {
			background: url("assets/img/background/bg5.jpg") no-repeat;
			background-size: cover;
			background-attachment: fixed;
			text-shadow: white 0.1em 0.1em 0.2em;
		}
		.bg2 {
			background: url("assets/img/background/bg1.jpg") no-repeat;
			background-size: cover;
			background-attachment: fixed;
			text-shadow: white 0.1em 0.1em 0.2em;
		}
		.bg3 {
			background: url("assets/img/background/bg3.jpg") no-repeat;
			background-size: cover;
			background-attachment: fixed;
		}
		.bg4 {
			background: url("assets/img/background/bg4.jpg") no-repeat;
			background-size: cover;
			background-attachment: fixed;
		}
		.parallax .container {
			padding-left: 0%;
			padding-right: 0%;
			margin-left: 0%;
			margin-right: 0%;
		}
		.parallax .badge {
			font-size: 1.25rem;
			text-shadow: white 0em 0em 0em;
		}
		.ml9 {
		  position: relative;
		  font-weight: 700;
		  font-size: 2em;
		  width: 700px;
		  margin-left: 40%;
		}
		.ml9 .text-wrapper {
		  position: relative;
		  display: inline-block;
		  padding-top: 0.2em;
		  padding-right: 0.05em;
		  padding-bottom: 0.1em;
		  overflow: hidden;
		}
		.ml9 .letter {
		  transform-origin: 50% 100%;
		  display: inline-block;
		  line-height: 1em;
		}
		
	</style>
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/anime.min.js"></script>
	<!-- User Define JS -->
	<script src="assets/js/index.js"></script>
	
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
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm"
		w3-include-html="<c:url value='/addFrame.controller/header'/>"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" id="menu-detail"
				w3-include-html="<c:url value='/addFrame.controller/aside'/>"></div>
			<div class="col-lg-10" id="div-v-pills">
			
				<div class="parallax bg1">
					<div class="container">
						<h1 class="ml9">
						  <span class="text-wrapper">
						    <span class="letters">盼天下無浪貓，浪貓有家圖溫飽：貓飽
						    					      離不開的寶貝，你我是牠眼中寶：貓寶</span>
						  </span>
						</h1>
					</div>
				</div>
				<div class="parallax bg2">
						<div class="container marketing">
							<div class="text-center my-lg-3">
								<h1>我們團隊</h1>
							</div>
							<div class="row">		
								<div class="text-center col-lg-3 offset-lg-2">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0919.jpeg" width="160" height="160">
									<h2 class="text-center">
										<span class="badge badge-pill badge-secondary">組長</span>
										廖崇欽
									</h2>
									<p class="text-justify text-center">學歷：<br>成功大學 機械工程學系 碩士</p><br>
									<p class="text-justify text-center">項目：<br>整合專案與專案版本控制，客服系統開發與維護</p>
								</div>
								<div class="text-center col-lg-3 offset-lg-2">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0797.jpeg" width="160" height="160">
									<h2 class="text-center">
										<span class="badge badge-pill badge-secondary">副組長</span>
										鄭弘翔
									</h2>
									<p class="text-justify text-center">學歷：<br>南臺科技大學 多媒體與電腦娛樂科學系 學士</p>
									<p class="text-justify text-center">項目：<br>資料庫系統建置，流浪貓預約看貓系統的開發與維護</p>
								</div>
							</div>
							<div class="row">		
								<div class="text-center col-lg-3">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0918.jpeg" width="160" height="160">
									<h2 class="text-center">林純歆</h2>
									<p class="text-justify text-center">學歷：<br>中國文化大學 機械工程學系 學士</p>
									<p class="text-justify text-center">項目：<br>前端網頁建構，商品訂單系統的開發與維護</p>
								</div>
								<div class="text-center col-lg-3">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0799.jpeg" width="160" height="160">
									<h2 class="text-center">羅振旂</h2>
									<p class="text-justify text-center">學歷：<br>真理大學 法律系 學士</p><br>
									<p class="text-justify text-center">項目：<br>後台框架設置，流浪貓名冊管理系統的開發與維護</p>
								</div>
								<div class="text-center col-lg-3">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0800.jpeg" width="160" height="160">
									<h2 class="text-center">陳皓</h2>
									<p class="text-justify text-center">學歷：<br>真理大學 法律系 學士</p><br>
									<p class="text-justify text-center">項目：<br>後台框架設置，會員管理系統的開發與維護</p>
								</div>
								<div class="text-center col-lg-3">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/image140x140.jpg">
									<h2 class="text-center">李政瑩</h2>
									<p class="text-justify text-center">學歷：<br>淡江大學 化學系 學士</p><br>
									<p class="text-justify text-center">項目：<br>前端網頁建構，商品管理系統的開發與維護</p>
								</div>
							</div>
						</div>
				</div>
				<div class="parallax bg3">學習藍圖</div>
				<div class="parallax bg4">使用技術</div>
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
				let memberBadge = `<a class="btn btn-primary" href="<c:url value='/member.myPage'/>" role="button"> Hi ~ ${sessionScope.login_user.account} <span class='badge badge-light'> 0 </span> </a>`;
				$("a#anchor-login-modal").before(memberBadge);
				$("a#myShoppingCart").attr("class","btn btn-outline-primary");
				$("a#myShoppingCart").attr("href","paymentS1");
				$("a#myShoppingCart>span").attr("class","badge btn-danger");
			});
		</script>
	</c:if>
	
	<c:if test="${sessionScope.login_user == null}">
		<script>
			$(document).ready(function (){
				$("body").on("click","a#myShoppingCart",function() {
					alert("請先登入會員喔~~~");
				});
			});
		</script>
	</c:if>
	
	<script>
	// Wrap every letter in a span
		var textWrapper = document.querySelector('.ml9 .letters');
		textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
	
// 		anime.timeline({loop: true})
// 		  .add({
// 		    targets: '.ml9 .letter',
// 		    scale: [0, 1],
// 		    duration: 1500,
// 		    elasticity: 600,
// 		    delay: (el, i) => 45 * (i+1)
// 		  }).add({
// 		    targets: '.ml9',
// 		    opacity: 0,
// 		    duration: 1000,
// 		    easing: "easeOutExpo",
// 		    delay: 1000
// 		  });
		
		anime.timeline({loop: false})
		  .add({
		    targets: '.ml9 .letter',
		    scale: [0, 1],
		    duration: 1500,
		    elasticity: 600,
		    delay: (el, i) => 100 * (i+1)
		  });
	</script>
	
	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
</body>
</html>