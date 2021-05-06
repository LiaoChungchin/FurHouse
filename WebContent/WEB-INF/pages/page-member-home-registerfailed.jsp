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
	<style>
		.parallax {
			/* width: 100vw; */
			height:100vh;
			font-weight:bold;
			font-size:1.25rem;
			display:flex;
			justify-content:center;
			align-items:center;
		}
		.bg1 {
			background:url("assets/img/background/bg5.jpg") no-repeat;
			background-size:cover;
			background-attachment:fixed;
			text-shadow:white 0.1em 0.1em 0.2em;
		}
		.bg2 {
			background:url("assets/img/background/bg1.jpg") no-repeat;
			background-size:cover;
			background-attachment:fixed;
			text-shadow:white 0.1em 0.1em 0.2em;
		}
		.bg3 {
			background:url("assets/img/background/bg3.jpg") no-repeat;
			background-size:cover;
			background-attachment:fixed;
		}
		.bg4 {
			background:url("assets/img/background/bg4.jpg") no-repeat;
			background-size:cover;
			background-attachment:fixed;
		}
		.parallax .container-anime {
			padding-left:0%;
			padding-right:0%;
			margin-left:0%;
			margin-right:0%;
			padding-top:15%;
			width:900px;
			height:600px;
		}
		.parallax .container {
			padding-left:0%;
			padding-right:0%;
			margin-left:0%;
			margin-right:0%;
		}
		.parallax .badge {
			font-size:1.25rem;
			text-shadow:white 0em 0em 0em;
		}
		.ml9 {
			position:relative;
			font-weight:700;
			font-size:2em;
			margin-left:20%;
			display:inline-block;
		}
		.ml9 .text-wrapper {
			position:relative;
			display:inline-block;
			padding-right:0.05em;
			padding-top:1.2em;
			padding-bottom:1.1em;
			overflow:hidden;
			display:inline-block;
			margin-bottom:6px;
		}
 		.ml9 .letter {
			transform-origin:50% 100%;
			display:inline-block;
			line-height:1em;
 		}
 		.ml9 .keyLetter {
			transform-origin:50% 100%;
			display:inline-block;
			line-height:1em;
 		}
 		.ml9 .cross {
			transform: scale(0);
			display:inline-block;
			line-height:1em;
			color:#000000;
 		}
 		.line-drawing {
			line-height:1em;
 		}
 		.line-drawing .lines path{
 			transform:scale(0.7);
 		}
 		.myCatbow .logoFrame{
 			height:160px;
 			width:160px;
   			overflow:hidden;
 		}
 		.myCatbow .logoFrame img{
 			transform:translateY(160px);
 		}
 		.devide {
  			transform-origin:0% 50%;
 		}
 		.devide .lineUp{
 			height:2px;
 			width:210px;
 			background-color:black;
 		}
 		.devide .lineDown{
 			height:2px;
 			width:210px;
 			background-color:black;
 		}
 		span .letters{
 			display:inline-block;
 		}
	</style>
	
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
		$(".navbar-toggler").attr("style","display:none;");
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
	<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm" 
		 w3-include-html="<c:url value='/addFrame.controller/header'/>"></div>
		 
		 		<div>
					<div>
						<h1 class="ml9">
						  <span>
						    <h1 style="margin-left:355px;">註冊失敗...</h1>
						    <br>
						    <input type ="button" class="btn btn-primary" onclick="window.location ='index';" value="回首頁" style="margin-left:400px;"/>
						  </span>
						</h1>
				    </div>
				</div>

<!-- 					
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
	
	
	
	
	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
</body>
</html>