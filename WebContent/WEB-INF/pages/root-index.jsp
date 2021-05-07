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
/* 		.card-img-left{ */
/* 			width: 150px; */
/* 			height: 150px; */
/* 			border-top-left-radius: calc(0.25rem - 1px); */
/*     		border-bottom-left-radius: calc(0.25rem - 1px); */
/* 		} */
/* 		.card:hover{ */
/* 			box-shadow:inset -3px -3px 3px rgba(20%,20%,40%,0.5) !important; */
/* 		} */
/* 		.card:active{ */
/* 			box-shadow:inset -3px 3px 3px rgba(20%,20%,40%,0.5) !important; */
/* 		} */
		
		/*anime.js path-slider*/
		 html, body {
            height: 100%;
        }
        
		.container {
			max-width: 100%;
            text-align: center;
            height: 560px;
            background-color: #E0E0E0;
        }

        .path-slider {
            display: inline-block;
            position: relative;
            top: 47%;
            transform: translateY(-40%);
        }

        path {
            stroke-width: 1px;
            stroke: none;
            fill: none;
        }

        .icon__path {
            fill: #FFFFFF;
        }

        .path-slider__path {
            stroke: rgba(255, 255, 255, 0.5);
        }

        .path-slider__item {
            position: absolute;
            left: -37px;
            top: -37px;
            color: #000000;
            cursor: pointer;
            transform-origin: 50% 50%;
            text-decoration: none;
            outline: none;
        }
        
        .path-slider__item:hover .item__circle, 
        .path-slider__item:focus .item__circle {
            background-color: #8E8E8E;
        }

        .item__circle {
            display: inline-block;
            width: 74px;
            height: 74px;
            background-color: #ffffff;
            box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.5);
            border-radius: 100%;
            text-align: center;
            transition: 0.5s;
        }
        
        .item__circle img{
        	width: 50px;
            height: 50px;
            margin-top: 10px;
        }

        .item__title {
            position: absolute;
            bottom: 100%;
            left: 50%;
            transform: translateX(-50%);
            font-variant: small-caps;
            white-space: nowrap;
            opacity: 0.8;
            transition: 0.5s;
        }

        .item__icon {
            width: 45px;
            height: 45px;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        .path-slider__current-item .item__circle{
            background-color: #FCFCFC;
            transform: scale(1.5);
        }
        .path-slider__current-item .item__title {
            font-size: 25px;
            opacity: 1;
            transform: translate(-50%, -20px);
        }
        
        .confirmPage{
        	position: absolute;
        	top: 37%;
    		left: 31%;
        }
        
        .listTitle{
        	display: inline-block;
            position: relative;
            line-height: 1em;	
        }
        
	</style>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/anime.min.js"></script>
	<!-- User Define JS -->
	<script src="assets/js/path-slider.js"></script>
	
	<title>*ROOT*</title>
	
	<script>
		$(document).ready(function() {
			// 匯入include所有語句
			w3.includeHTML();
			
			$('.nav-item').children().attr("class","nav-link");
			$('.nav-item').eq(1).children().attr("class","nav-link active");
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
				<div class="container">
			        <!-- Path Slider Container -->
			        <div class="path-slider">
			            <!-- SVG path to slide the items -->
			            <svg width="460px" height="310px" viewBox="0 0 460 310">
			                <path d="M 230 5 c -300 0 -300 300 0 300 c 300 0 300 -300 0 -300 Z" class="path-slider__path"></path>
			            </svg>
			            <!-- Slider items -->
			            <div id="orders" class="path-slider__item">
			                <div class="item__circle"><img src="<c:url value='assets/img/card-order.png' />"></div>
			                <div class="item__title"><h2>Orders</h2></div>
			            </div>
			            <div id="products" class="path-slider__item">
			                <div class="item__circle"><img src="<c:url value='assets/img/card-product.png' />"></div>
			                <div class="item__title"><h2>Products</h2></div>
			            </div>
			            <div id="members" class="path-slider__item">
			                <div class="item__circle"><img src="<c:url value='assets/img/card-member.png' />"></div>
			                <div class="item__title"><h2>Members</h2></div>
			            </div>
			            <div id="cats" class="path-slider__item">
			                <div class="item__circle"><img src="<c:url value='assets/img/card-cat.png' />"></div>
			                <div class="item__title"><h2>Cats</h2></div>
			            </div>
			            <div id="reservations" class="path-slider__item">
			                <div class="item__circle"><img src="<c:url value='assets/img/card-reservation.png' />"></div>
			                <div class="item__title"><h2>Reservations</h2></div>
			            </div>
			            <div id="chats" class="path-slider__item">
			                <div class="item__circle"><img src="<c:url value='assets/img/card-chat.png' />"></div>
			                <div class="item__title"><h2>Chats</h2></div>
			            </div>
			            <div class="confirmPage">
			            	 <p><b style="font-size: 30px" id="listTitle">訂單管理系統</b></p>
			            	<button class="btn btn-dark confirm">進入</button>
			            </div>
			        </div>
			    </div>
				
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="card mb-4 shadow-sm flex-row"> -->
<%-- 							<img alt="Orders" src="<c:url value='assets/img/card-order.png' />" class="card-img-left"> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title">Orders</h5> -->
<!-- 								<p class="card-text">訂單管理系統</p> -->
<!-- 								<div class="d-flex justify-content-between align-items-center"> -->
<!-- 									<div class="btn-group"> -->
<!-- 										<button type="button" class="btn btn-sm btn-outline-secondary"> -->
<!-- 											<i class="bi bi-person-check"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 									<small class="text-muted">Version Update : 2021/03/08</small> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="card mb-4 shadow-sm flex-row"> -->
<%-- 							<img alt="Products" src="<c:url value='assets/img/card-product.png' />" class="card-img-left"> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title">Products</h5> -->
<!-- 								<p class="card-text">商品管理系統</p> -->
<!-- 								<div class="d-flex justify-content-between align-items-center"> -->
<!-- 									<div class="btn-group"> -->
<!-- 										<button type="button" class="btn btn-sm btn-outline-secondary"> -->
<!-- 											<i class="bi bi-person-check"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 									<small class="text-muted">Version Update : 2021/03/08</small> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="card mb-4 shadow-sm flex-row"> -->
<%-- 							<img alt="Members" src="<c:url value='assets/img/card-member.png' />" class="card-img-left"> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title">Members</h5> -->
<!-- 								<p class="card-text">會員管理系統</p> -->
<!-- 								<div class="d-flex justify-content-between align-items-center"> -->
<!-- 									<div class="btn-group"> -->
<!-- 										<button type="button" class="btn btn-sm btn-outline-secondary"> -->
<!-- 											<i class="bi bi-person-check"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 									<small class="text-muted">Version Update : 2021/03/08</small> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="card mb-4 shadow-sm flex-row"> -->
<%-- 							<img alt="Cats" src="<c:url value='assets/img/card-cat.png' />" class="card-img-left"> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title">Cats</h5> -->
<!-- 								<p class="card-text">浪貓照顧系統</p> -->
<!-- 								<div class="d-flex justify-content-between align-items-center"> -->
<!-- 									<div class="btn-group"> -->
<!-- 										<button type="button" class="btn btn-sm btn-outline-secondary"> -->
<!-- 											<i class="bi bi-person-check"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 									<small class="text-muted">Version Update : 2021/03/08</small> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="card mb-4 shadow-sm flex-row"> -->
<%-- 							<img alt="Reservations" src="<c:url value='assets/img/card-reservation.png' />" class="card-img-left"> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title">Reservations</h5> -->
<!-- 								<p class="card-text">寵物預約系統</p> -->
<!-- 								<div class="d-flex justify-content-between align-items-center"> -->
<!-- 									<div class="btn-group"> -->
<!-- 										<button type="button" class="btn btn-sm btn-outline-secondary"> -->
<!-- 											<i class="bi bi-person-check"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 									<small class="text-muted">Version Update : 2021/03/08</small> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="card mb-4 shadow-sm flex-row"> -->
<%-- 							<img alt="Chats" src="<c:url value='assets/img/card-chat.png' />" class="card-img-left"> --%>
<!-- 							<div class="card-body"> -->
<!-- 								<h5 class="card-title">Chats</h5> -->
<!-- 								<p class="card-text">線上客服系統</p> -->
<!-- 								<div class="d-flex justify-content-between align-items-center"> -->
<!-- 									<div class="btn-group"> -->
<!-- 										<button type="button" class="btn btn-sm btn-outline-secondary"> -->
<!-- 											<i class="bi bi-person-check"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 									<small class="text-muted">Version Update : 2021/03/08</small> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</main>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
		
</body>
<script>
	var locationhref = "order.mainPage";
	var nowindex = 1;
	$('.path-slider__item').on("click",function(){
		if(nowindex != $(this).index()){
			switch($(this).index()){
			case 0:
// 				console.log(this.id);
				break;
			case 1:
				fadeInAndOut("訂單管理系統" , $(this).index());
				locationhref = "order.mainPage";
				break;
			case 2:
				fadeInAndOut("商品管理系統" , $(this).index());
				locationhref = "SelectAllProduct_Root";
				break;
			case 3:
				fadeInAndOut("會員管理系統" , $(this).index());
				locationhref = "member.mainPage";
				break;
			case 4:
				fadeInAndOut("浪貓照顧系統" , $(this).index());
				locationhref = "selectAllCat.controller";
				break;
			case 5:
				fadeInAndOut("寵物預約系統" , $(this).index());
				locationhref = "allAdoptList";
				break;
			case 6:
				fadeInAndOut("線上客服系統" , $(this).index());
				locationhref = "contact.mainPage";
				break;
			default:
				alert("404");
			}
		}
	})

	$('.confirm').click(function(){
		window.location.href=locationhref;
	});
	
	function fadeInAndOut(titleText,cNowIndex){
		$('#listTitle').text(titleText);
		
		$('#listTitle').html($('#listTitle').text().replace(/\S/g, "<span class='listTitle'>$&</span>"));
		
		anime.timeline({ loop: false })
        .add({
            targets: '.confirmPage .listTitle',
            translateY: ["2.2em", 0],
            opacity: [0, 1],
            easing: "easeOutCirc",
            duration: 500,
            delay: (el, i) => 100 * i,
            update: function(){
            	nowindex = cNowIndex;
            }
        });
	}
	
	$(document).ready(function(){
         // Setting up the options
         var options = {
            startLength: 0, // start positioning the slider items at the beginning of the SVG path
            duration: 3000, // animation duration (used by anime.js)
            stagger: 15, // incrementally delays among items, producing an staggering effect
            easing: 'easeOutElastic', // easing function (used by anime.js)
            elasticity: 600, // elasticity factor (used by anime.js)
            rotate: true // This indicates that items should be rotated properly to match the SVG path curve
        };

        // Initialize the slider using our SVG path, items, and options
        new PathSlider('.path-slider__path', '.path-slider__item', options);
    })	
</script>
</html>