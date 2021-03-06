<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="nowDay" />

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
	<link href="assets/css/bootstrap-datepicker3.min.css" rel="stylesheet">
	<!-- User Define CSS -->
	<link href="assets/css/index.css" rel="stylesheet">
	
	<style>
		.carousel {
			margin-bottom: 20px;
		}
		
		.carousel-item {
			height: 650px;
		}
		.carousel-item img{
			margin-top: -100px;		
		}
		.card {
			width: calc(100%/3);
			height: 100%;
			float: left;
		}
		.card-img-top{
			height: 300px;
		}
		.card-text {
			float: left;
		}
		.IWantIt {
			margin-top: 35px;
			float: right;
		}
		.littleWindow{
			position: fixed;
			right: 20px;
			top: 200px;
		}
		
		.nav-pills a:hover {
	    color: #ff4e0d;
	    cursor:url("assets/img/mouse.png"),pointer;
		}
		
		#menu-detail{
			box-shadow:10px 0px 12px -8px rgba(255,199,162,0.37),-6px 0px 8px -4px rgba(255,199,162,0.37);
		}
	</style>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	
	<!-- User Define JS -->
	<script src="assets/js/bootstrap-datepicker.min.js"></script>
	<script src="assets/js/bootstrap-datepicker.zh-TW.min.js"></script>
	<script src="assets/js/index.js"></script>
	<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
	<script src="assets/js/sweetalert.min.js"></script>
	<script>
		$(function() {
			$("div#menu-detail").show();
			$("div#menu-detail>div>a[class~='active']").removeClass("active");
			// ??????????????????
			$("div#menu-detail>div>a:contains('????????????')").next().show();
			// ????????????????????????
			$("div#menu-detail>div>a>small:contains('????????????')").parent().show();
			$("div#menu-detail>div>a>small:contains('????????????')").parent().show();
			$("div#menu-detail>div>a>small:contains('????????????')").parent().addClass("active");
		});
	</script>
	
	<title>FurHouse</title>
	
	<%-- EL??????session??????member bean?????????????????? --%>
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
				<div id="carouselReservation" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
				    	<li data-target="#carouselReservation" data-slide-to="0" class="active"></li>
				    	<li data-target="#carouselReservation" data-slide-to="1"></li>
				    	<li data-target="#carouselReservation" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
				    	<div class="carousel-item active">
				    	<c:forEach items="${randcats}" var="randcat" begin="0" end="0">
				    		<img src="catImageToByte?path=${randcat.photo1}" class="d-block w-100" alt="${randcat.id}">
				    		<div class="carousel-caption d-none d-md-block">
								<h5><b>${randcat.nickname}</b></h5>
								<p>${randcat.comment1}</p>
							</div>
						</c:forEach>
				    	</div>
				    	<c:forEach items="${randcats}" var="randcat" begin="1" end="2">
				    	<div class="carousel-item">
				    		<img src="catImageToByte?path=${randcat.photo1}" class="d-block w-100" alt="${randcat.id}">
				    		<div class="carousel-caption d-none d-md-block">
								<h5><b>${randcat.nickname}</b></h5>
								<p>${randcat.comment1}</p>
							</div>
				    	</div>
				    	</c:forEach>
					</div>
					<a class="carousel-control-prev" href="#carouselReservation" role="button" data-slide="prev">
				    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    	<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselReservation" role="button" data-slide="next">
				    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
				    	<span class="sr-only">Next</span>
					</a>
				</div>
			<!-- ###??????????????????### -->
				<article class="catReservation">
				<c:forEach items="${cats}" var="cat">
					<div class="card">
						<img class="card-img-top" src="catImageToByte?path=${cat.photo1}" alt="${cat.nickname}">
						<div class="card-body">
							<h5 class="card-title"><b>${cat.nickname}</b></h5>
							<div class="card-text">
								<input type="hidden" value="${cat.id}">
								<div>?????????${cat.type}</div>
								<div>?????????${cat.gender}</div>   
								<div id="rid${cat.id}">???????????????${cat.adoptList.size()}</div>   
							</div>
							<button type="button" class="btn btn-primary IWantIt" data-toggle="modal" data-target="#adoptListDialog">??????????????????</button>
						</div>
					</div>
				</c:forEach>
				</article>
				<!-- ??????????????? -->
				<!-- Flexbox container for aligning the toasts -->
				<div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center littleWindow" style="min-height: 200px;" >			
				</div>
				
				<!-- ??????Dialog -->
				<div class="modal fade" id="adoptListDialog" tabindex="-1" aria-labelledby="adoptListModalLabel" aria-hidden="true">
				  	<div class="modal-dialog modal-dialog-centered">
				    	<div class="modal-content">
					      	<div class="modal-header">
					        	<h5 class="modal-title" id="adoptListModalLabel">????????????</h5>
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					     	</div>
					     	<form action="/insertAdoptList" enctype="multipart/form-data" id="adoptListForm">
						      	<div class="modal-body">
							        <!-- ?????? -->
									<div class="form-group row">
										<label for="InsertCatInputName" class="col-sm-3">??????</label>
										<span class="col-sm-9" id="adoptListCatName"></span>
									</div>
									<!-- ???????????? -->
						        	<div class="form-group row">
										<label class="col-sm-3" for="adoptListSelectDate">????????????</label> 
										<input type="text" class="form-control datepicker col-sm-8" autocomplete="off"
											id="adoptListSelectDate"> 
										<small id="adoptListDateHelp" class="form-text text-muted"></small>
										<div class="col-sm-1"></div>
									</div>
									<!-- ?????? -->
									<div class="form-group row">
										<label for="adoptListSelectTime" class="col-sm-3">??????</label> 
										<select class="form-control col-sm-8" id="adoptListSelectTime"></select>
										<div class="col-sm-1"></div>
									</div>
									
									<!-- ???????????? -->
									<input type="hidden" id="dateresult" name="visitTime">
									<input type="hidden" name="catId" id="confirmCatId">
									<input type="hidden" name="memberId" id="memberId" value="${sessionScope.login_user.memberId}">
							      	</div>
						      	<div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
							        <button type="button" class="btn btn-primary" id="adoptListSubmit">??????</button>
						      	</div>
							</form>
			    		</div>
				  	</div>
				</div>
				<!-- ??????Dialog End-->
			</div>
		</div>
	</div>

	<!-- ????????????????????? Modal start -->
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
	<!-- ????????????????????? Modal end -->
	
	<!-- ????????????????????????????????????????????? -->
	<c:if test="${sessionScope.login_user != null}">
		<script>
			$(document).ready(function () {
				$("a#anchor-login-modal").text("??????");
				let memberBadge = `<a class="btn btn-warning" href="<c:url value='/member.myPage'/>" role="button">${sessionScope.login_user.name},??????</a>`;
				$("a#anchor-login-modal").before(memberBadge);
                $("a#myShoppingCart").attr("class",
                "btn btn-outline-warning");
	            $("a#myShoppingCart").attr("href", "paymentS1");
	            $("a#myShoppingCart>span").attr("class",
	                "badge btn-danger");
	            $("a#goBuyIt").removeClass("disabled");
				});
		</script>
	</c:if>
    <c:if test="${sessionScope.login_user == null}">
        <script>
            $(document).ready(function () {
                $("body").on("click", "a#myShoppingCart", function () {
                	swal("?????????????????????!", "?????????~~~", "warning");
                });
				if(localStorage.myProducts != null || localStorage.myProducts == ""){
					localStorage.removeItem('myProducts');
				}
				$("a#goBuyIt").addClass("disabled");
            });
        </script>
    </c:if>
	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
		
<script>
	$('.IWantIt').on("click",function(){
		$("#confirmCatId").val($(this).parent().children().eq(1).children().eq(0).val());
		$("#adoptListCatName").html($(this).parent().children().eq(0).text());
		$("#adoptListSelectDate").val("");
		$("#adoptListSelectTime").val("");
	});
	
	$(".datepicker").datepicker({
		format : "yyyy-mm-dd", //???????????????2019-04-01
		autoclose : true,//?????????????????????????????????
		startDate : "+1d",//?????????????????????
		todayHighlight : true,//????????????????????????
		language : 'zh-TW'//?????????
	});
	
	$("#adoptListSelectDate").on("change",function(){
		$("#adoptListSelectTime").val("");
		let searchDate = $("#adoptListSelectDate").val();
		let catId = $("#confirmCatId").val();
		$.ajax({	??
?????? ?? ?? ?? ?? type:"GET",
			url: "searchAllAdoptListVisitTimeForCatId/" + searchDate+"/"+catId,
			dataType: "json",
??			success : function(response){
				removedatearr.length = 0;
				for(let i = 0 ; i < response.length ; i++){
					removedatearr.push(response[i].visitTime);
				}
				
				if(removedatearr.length==13){
					$("#adoptListSelectTime").html("<option selected='selected'>????????????</option>");
				}
??			},
??				//Ajax?????????????????????function??????????????????????????????
??			error:function(xhr, ajaxOptions, thrownError){
??					alert(xhr.status+"\n"+thrownError);
			}
		});
	})
	
	var removedatearr = new Array();

	
	$("#adoptListSelectTime").on("focus",function(){
		
		let removedates = new Array(); 
		for(let i = 0 ; i < removedatearr.length ; i++){
			removedates.push(removedatearr[i].substr(11,5));
		}
		
		let datearr = ["09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"]
		let dateflag = false;
		let tempstr = "";
		for(let i = 0 ; i < datearr.length ; i++){
			for(let j = 0 ; j < removedates.length;j++){
				if(removedates[j]==datearr[i]){
					dateflag = true;
				}
			}
			if(dateflag){
				dateflag = false;
				continue;
			}
			tempstr += "<option>"+datearr[i]+"</option>";
		}
		$("#adoptListSelectTime").html(tempstr);
		
		if(tempstr == ""){
			$("#adoptListSelectTime").html("<option>????????????</option>>");
		}
		
		
		$("#dateresult").val($("#adoptListSelectDate").val()+" "+$("#adoptListSelectTime").val()+":00");
	})

	
	
	$("#adoptListSelectTime").on("change",function(){
			$("#dateresult").val($("#adoptListSelectDate").val()+" "+$("#adoptListSelectTime").val()+":00");
	})
	
	
	/*--------------------------------------------------------------------------------------------------------------------------*/
	$("#adoptListSubmit").on("click",function(){
		if($("#memberId").val().length == 0){
			createtoast("????????????");
		}else if($("#adoptListSelectDate").val().length!=0&&$("#adoptListSelectTime").val()!=null){
			let rid = "#rid"+$("#confirmCatId").val();
			
			$.ajax({	??
?????? ?? ?? ?? ?? 	type:"POST", ?? ?? ?? ?? ?? ?? ?? ?? ?? ??//??????http?????????????????????POST
				url: "insertAdoptListForReservation", ?? ?? ?? ??//???????????????url?????????url?????????GET???????????? www.xxxx.com?xx=yy&xxx=yyy
??				data: $("#adoptListForm").serializeArray(), //??????????????????data???id=formId???Form????????????(serialize)????????????????????????name?????????value
				//Ajax??????????????????function???response???????????????
				//??????????????????JSON Object???????????????????????????: {userName:XXX,uswerInterest:[y1,y2,y3,...]}
??				success : function(response){
					$(rid).text("???????????????"+response.catAdoptListSize);
					createtoast(response.result);
??				},
??				//Ajax?????????????????????function??????????????????????????????
??				error:function(xhr, ajaxOptions, thrownError){	
					createtoast("????????????!!!");
				}
			});
		}else{
			createtoast("???????????????");
		}
	})
		
		
	function createtoast(toaststr){
		let str = "";
		str+='<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="5000">'+
		     '	<div class="toast-header">'+
			 '		<strong class="mr-auto">?????????</strong>'+
			 '			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">'+
			 '			<span aria-hidden="true">&times;</span>'+
			 '		</button>'+
		     '	</div>'+
			 '	<div class="toast-body">'+
			 		toaststr+
			 '	</div>'+
			 '</div>';
		$('.littleWindow').html(str);
??		$('.toast').toast('show');
		$('#adoptListDialog').modal('hide');
	}
</script>
</body>
</html>