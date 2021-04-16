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
					<div class="col-md-3">
						<div class="card mb-4 shadow-sm">
							<img src="assets/img/card-order.jpg" class="card-img-top"
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Orders</h5>
								<p class="card-text">訂單管理系統，目前版本可處理...</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<form method="get" action="order.mainPage">
											<button type="submit"
												class="btn btn-sm btn-outline-secondary">Enter</button>
										</form>
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card mb-4 shadow-sm">
							<img src="assets/img/card-product.jpg" class="card-img-top"
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Products</h5>
								<p class="card-text">商品上下架系統，目前版本可處理...</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">Enter</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card mb-4 shadow-sm">
							<img src="assets/img/card-member.jpg" class="card-img-top"
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Members</h5>
								<p class="card-text">會員管理系統，目前版本可處理...</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<form method="get" action="member.mainPage">
											<button type="submit"
												class="btn btn-sm btn-outline-secondary">Enter</button>
										</form>
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card mb-4 shadow-sm">
							<img src="assets/img/card-cat.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Cats</h5>
								<p class="card-text">浪貓照顧系統，目前版本可處理...</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<form method="get" action="selectAllCat.controller">
											<button type="submit"
												class="btn btn-sm btn-outline-secondary">Enter</button>
										</form>
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card mb-4 shadow-sm">
							<img src="assets/img/card-report.jpg" class="card-img-top"
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Reports</h5>
								<p class="card-text">報表顯示系統，目前版本可處理...</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">Enter</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">
											<i class="bi bi-person-check"></i>
										</button>
									</div>
									<small class="text-muted">Version Update : 2021/03/08</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card mb-4 shadow-sm">
							<img src="assets/img/card-map.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Reservations</h5>
								<p class="card-text">寵物預約系統，目前版本可處理...</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<form method="get" action="allAdoptList">
											<button type="submit"
												class="btn btn-sm btn-outline-secondary">Enter</button>
										</form>
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
</html>