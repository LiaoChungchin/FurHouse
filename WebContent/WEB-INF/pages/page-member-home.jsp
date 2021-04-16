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
	<style>
		body {
			background-image : url(assets/img/member_bg.jpg);
			background-size : 1440px 900px;
			background-position : right bottom;
			background-repeat : no-repeat;
			background-attachment : fixed;
		}
		h1 {
			margin-top : 300px;
		}
	</style>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!-- User Define JS -->
	<script>
		$(function(){
			var myName = "${sessionScope.login_user.name}";
			var nickName = " " + myName.substr(1) + ",";
			$("h1").append(nickName);
		})
	</script>
	<title>FurHouse</title>
	
</head>
<body>
	<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		<h2 class="my-0 mr-md-auto font-weight-normal">會員專區</h2>
		<a class="btn btn-outline-warning" href="<c:url value='/index'/>">返回首頁</a>
	</div>
	<div class="text-center">
		<nav class="my-2 my-md-0 mr-md-3">
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-file-earmark-person-fill"></i> 個人資料</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-bag-check-fill"></i> 我的訂單</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-calendar-week-fill"></i> 預約紀錄</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="member.chat"><i class="bi bi-chat-left-dots-fill"></i> 客服視窗</a>
		</nav>
		
	</div>
	<h1 class="text-center font-weight-bolder">Hello ~</h1>
	<h2 class="mt-1 text-center text-muted font-weight-bolder">I'm Here...</h2>
</body>
</html>