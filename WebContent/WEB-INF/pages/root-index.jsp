<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon"> 
	
	<!-- Bootstrap CSS -->
	<link href="assets/css/bootstrap.css" rel="stylesheet">
	<link href="assets/css/bootstrap-icons.css" rel="stylesheet">
	<!-- User Define CSS -->
	<link href="assets/css/index-root.css" rel="stylesheet">
	
	<style>
		.card-img-left{
			width: 150px;
			height: 150px;
			border-top-left-radius: calc(0.25rem - 1px);
    		border-bottom-left-radius: calc(0.25rem - 1px);
		}
		.card:hover{
			box-shadow:inset -3px -3px 3px rgba(20%,20%,40%,0.5) !important;
		}
		.card:active{
			box-shadow:inset -3px 3px 3px rgba(20%,20%,40%,0.5) !important;
		}
	</style>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!-- User Define JS -->
	
	<title>*ROOT*</title>
	
	<script>
		$(document).ready(function() {
			// 匯入include所有語句
			w3.includeHTML();
		});
	</script>
	
</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow" w3-include-html="<c:url value='/addFrame.controller/rootheader' />"></nav>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" w3-include-html="<c:url value='/addFrame.controller/rootaside' />"></nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">HomePage</h1>
					<%-- EL接收session中的member姓名 --%>
					<c:if test="${sessionScope.login_user != null}">
						<a class="mx-2 text-dark">登入身分 : ${sessionScope.login_user.name}</a>
					</c:if>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group mr-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">Enter</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							This week</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm flex-row">
							<span class="card-img-left" style="background-color: #FF5151;">
								<i class="bi bi-card-list" style="padding-left:25px; font-size: 100px;"></i>
							</span>
							<div class="card-body">
								<h5 class="card-title">Orders</h5>
								<p class="card-text">訂單管理系統</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm flex-row">
							<span class="card-img-left" style="background-color: #FFA042;">
								<i class="bi bi-bag-fill" style="padding-left:25px; font-size: 100px;"></i>
							</span>
							<div class="card-body">
								<h5 class="card-title">Products</h5>
								<p class="card-text">商品管理系統</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm flex-row">
							<span class="card-img-left" style="background-color: #00EC00;">
								<i class="bi bi-person-lines-fill" style="padding-left:25px; font-size: 100px;"></i>
							</span>
							<div class="card-body">
								<h5 class="card-title">Members</h5>
								<p class="card-text">會員管理系統</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm flex-row">
							<span class="card-img-left" style="background-color: #4A4AFF;">
								<i class="bi bi-shop-window" style="padding-left:25px; font-size: 100px;"></i>
							</span>
							<div class="card-body">
								<h5 class="card-title">Cats</h5>
								<p class="card-text">浪貓照顧系統</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm flex-row">
							<span class="card-img-left" style="background-color: #B766AD;">
								<i class="bi bi-file-ruled" style="padding-left:25px; font-size: 100px;"></i>
							</span>
							<div class="card-body">
								<h5 class="card-title">Reservations</h5>
								<p class="card-text">寵物預約系統</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm flex-row">
							<span class="card-img-left" style="background-color: #E0E0E0;">
								<i class="bi bi-chat-dots" style="padding-left:25px; font-size: 100px;"></i>
							</span>
							<div class="card-body">
								<h5 class="card-title">Chats</h5>
								<p class="card-text">線上客服系統</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
		
</body>
<script>
	$('.col-md-4').on("click",function(){
		switch($(this).index()){
		case 0:
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:
			window.location.href="selectAllCat.controller";
			break;
		case 4:
			window.location.href="allAdoptList";
			break;
		case 5:
			break;
		default:
			alert("404");
		}
	})

</script>
</html>