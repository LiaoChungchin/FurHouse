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
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
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
				<main role="main">
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h1 class="h2">CatPage</h1>
					</div>
					<!--main content start-->
					<section id="main-content">
						<section class="wrapper">
							<article class="SupportCat">
								<c:forEach items="${cats}" var="cat" varStatus="s">
									<div class="SupportCatItem background">
										<a href="supportOneCat?supportCatId=${cat.id}"></a>
										<div class="SupportCat photo">
											<a href="supportOneCat?supportCatId=${cat.id}"><img
												src="${cat.photo1}" alt="" /></a>
										</div>
										<div class="SupportCat info">
											<h2 class="SupportCat name">${cat.nickname}</h2>

											<div class="SupportCat link">
												<a class=" btn btn-primary"
													href="supportOneCat?supportCatId=${cat.id}">我要助養</a>
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
				let memberBadge = `<a class="btn btn-primary" href="<c:url value='/member.myPage'/>" role="button"> Hi ~ ${sessionScope.login_user.account} <span class='badge badge-light'> 0 </span> </a>`;
				$("a#anchor-login-modal").before(memberBadge);
			});
		</script>
	</c:if>
	
	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
</body>
</html>