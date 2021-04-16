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
				<div id="index-home-Carousel" class="carousel slide mb-lg-5"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#index-home-Carousel" data-slide-to="0"
							class="active"></li>
						<li data-target="#index-home-Carousel" data-slide-to="1"></li>
						<li data-target="#index-home-Carousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="assets/img/image1300x300.jpg">
							<div class="container">
								<div class="carousel-caption text-left">
									<h1>Example headline.</h1>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
										Donec id elit non mi porta gravida at eget metus. Nullam id dolor
										id nibh ultricies vehicula ut id elit.</p>
									<p>
										<a class="btn btn-lg btn-primary" href="#" role="button">Sign
											up today</a>
									</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="assets/img/image1300x300.jpg">
							<div class="container">
								<div class="carousel-caption">
									<h1>Another example headline.</h1>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
										Donec id elit non mi porta gravida at eget metus. Nullam id dolor
										id nibh ultricies vehicula ut id elit.</p>
									<p>
										<a class="btn btn-lg btn-primary" href="#" role="button">Learn
											more</a>
									</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="assets/img/image1300x300.jpg">
							<div class="container">
								<div class="carousel-caption text-right">
									<h1>One more for good measure.</h1>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
										Donec id elit non mi porta gravida at eget metus. Nullam id dolor
										id nibh ultricies vehicula ut id elit.</p>
									<p>
										<a class="btn btn-lg btn-primary" href="#" role="button">Browse
											gallery</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#index-home-Carousel"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#index-home-Carousel"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<div class="container marketing">
					<!-- Three columns of text below the carousel -->
					<div class="row">
						<div class="text-center col-lg-4">
							<img class="rounded rounded-circle mb-1"
								src="assets/img/image140x140.jpg">
							<h2 class="text-center">Heading</h2>
							<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis
								euismod. Nullam id dolor id nibh ultricies vehicula ut id elit.
								Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
								Praesent commodo cursus magna.</p>
							<p>
								<a class="btn btn-secondary" href="#" role="button">View details
									&raquo;</a>
							</p>
						</div>
						<!-- /.col-lg-4 -->
						<div class="text-center col-lg-4">
							<img class="rounded rounded-circle mb-1"
								src="assets/img/image140x140.jpg">
							<h2>Heading</h2>
							<p>Duis mollis, est non commodo luctus, nisi erat porttitor
								ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
								purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
								tortor mauris condimentum nibh.</p>
							<p>
								<a class="btn btn-secondary" href="#" role="button">View details
									&raquo;</a>
							</p>
						</div>
						<!-- /.col-lg-4 -->
						<div class="text-center col-lg-4">
							<img class="rounded rounded-circle mb-1"
								src="assets/img/image140x140.jpg">
							<h2>Heading</h2>
							<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
								egestas eget quam. Vestibulum id ligula porta felis euismod semper.
								Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
								nibh, ut fermentum massa justo sit amet risus.</p>
							<p>
								<a class="btn btn-secondary" href="#" role="button">View details
									&raquo;</a>
							</p>
						</div>
						<!-- /.col-lg-4 -->
					</div>
					<!-- /.row -->
					<!-- START THE FEATURETTES -->
					<hr class="">
					<div class="row">
						<div class="col-md-7">
							<h2 class="">
								First featurette heading. <span class="text-muted">It’ll blow
									your mind.</span>
							</h2>
							<p class="lead">Donec ullamcorper nulla non metus auctor
								fringilla. Vestibulum id ligula porta felis euismod semper. Praesent
								commodo cursus magna, vel scelerisque nisl consectetur. Fusce
								dapibus, tellus ac cursus commodo.</p>
						</div>
						<div class="col-md-5">
							<img class="img-thumbnail" src="assets/img/image500x500.jpg">
						</div>
					</div>
					<hr class="">
					<div class="row">
						<div class="col-md-7 order-md-2">
							<h2 class="">
								Oh yeah, it’s that good. <span class="text-muted">See for
									yourself.</span>
							</h2>
							<p class="lead">Donec ullamcorper nulla non metus auctor
								fringilla. Vestibulum id ligula porta felis euismod semper. Praesent
								commodo cursus magna, vel scelerisque nisl consectetur. Fusce
								dapibus, tellus ac cursus commodo.</p>
						</div>
						<div class="col-md-5 order-md-1">
							<img class="img-thumbnail" src="assets/img/image500x500.jpg">
						</div>
					</div>
					<hr class="">
					<div class="row">
						<div class="col-md-7">
							<h2 class="">
								And lastly, this one. <span class="text-muted">Checkmate.</span>
							</h2>
							<p class="lead">Donec ullamcorper nulla non metus auctor
								fringilla. Vestibulum id ligula porta felis euismod semper. Praesent
								commodo cursus magna, vel scelerisque nisl consectetur. Fusce
								dapibus, tellus ac cursus commodo.</p>
						</div>
						<div class="col-md-5">
							<img class="img-thumbnail" src="assets/img/image500x500.jpg">
						</div>
					</div>
					<hr class="">
					<!-- /END THE FEATURETTES -->
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
				let memberBadge = `<a class="btn btn-primary" href="<c:url value='/member.myPage'/>" role="button"> Hi ~ ${sessionScope.login_user.account} <span class='badge badge-light'> 0 </span> </a>`;
				$("a#anchor-login-modal").before(memberBadge);
			});
		</script>
	</c:if>
	
	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
</body>
</html>