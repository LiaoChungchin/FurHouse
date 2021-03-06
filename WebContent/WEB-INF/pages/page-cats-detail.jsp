<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="cat" class="org.iiiEDU.model.Cat"
	scope="request" />
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
		.supportCatDetail {
			height: 868px;
			width: 100%;
		}
		
		.pcpLeading {
			min-height: 400px;
			overflow: hidden;
			background-repeat: no-repeat;
			background-position: 50% 23%;
			background-size: cover;
		}
		
		.supportCatDatailTitle {
			margin: 0px auto;
			text-align: center;
			background-color: rgb(220, 220, 220);
		}
		
		.supportCatDatailInfo {
			width: 1040px;
			margin: 30px auto;
			margin-bottom: 200px;
		}
		
		.supportCatDetailName {
			border-bottom: 1px solid goldenrod;
			margin-bottom: 10px;
		}
		
		.supportCatDatailInfo-img {
			width: 200px;
			height: 200px;
			border-radius: 30%;
			overflow: hidden;
			float: left;
		
		}
		
		.supportCatDatailInfo-img img{
			width: 280px;
			height: 200px;
			margin-left: -40px;
	        margin-top: 0px;
		}
		
		
		.supportCatDetailInfoCatData {
			margin-left: 30%;
		}
		
		.supportCatDetailStatus {
			line-height: 50px;
			font-size: 20px;
		}
		
		.supportCatDetailInfoLeft {
			float: left;
			width: 50%;
		}
		
		.supportCatDetailInfoRight {
			float: right;
			width: 50%;
		}
		
		.supportCatDetailInfoRight div:last-child {
			text-align: right;
		}
		
		.supportCatDatailInfoComment {
			width: 1040px;
			margin: 30px auto;
		}
		
		.supportCatDatailInfoComment1 {
			margin: 30px 50px 30px 50px;
			font-size: 1.75em;
			text-indent: -16px;
		}
		
		.supportCatDatailInfoComment2 {
			margin-bottom: 1em;
			max-width: 768px;
			margin: 0 auto;
			padding: 10px;
		}
		
		.littleWindow{
			position: fixed;
			right: 20px;
			top: 200px;
		}
		
 		.nav-pills a:hover{ 
	 	    color: #ff4e0d;
	 	    cursor:url("assets/img/mouse.png"),pointer; 
 		} 
	</style>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- User Define JS -->
	<script src="assets/js/index.js"></script>
	<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
	<script src="assets/js/bootstrap-datepicker.min.js"></script>
	<script src="assets/js/bootstrap-datepicker.zh-TW.min.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
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
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm"
		w3-include-html="<c:url value='/addFrame.controller/header'/>"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" id="menu-detail"
				w3-include-html="<c:url value='/addFrame.controller/aside'/>"></div>
			<div class="col-lg-10" id="div-v-pills">
				<!-- ###??????????????????### -->
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-10" id="div-v-pills">
							<main role="main">
								<!--main content start-->
								<section id="main-content">
									<section class="wrapper">
										<article class="supportCatDetail">
											<!-- ??????????????? -->
											<!-- Flexbox container for aligning the toasts -->
											<div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center littleWindow" style="min-height: 200px;" >			
											</div>
											
											<!-- ??????Dialog -->
											<div class="modal fade" id="adoptListDialog" tabindex="-1" aria-labelledby="adoptListModalLabel" aria-hidden="true">
											  	<div class="modal-dialog">
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
																<input type="hidden" name="catId" value="${cat.id}">
																<input type="hidden" name="memberId" id="memberId" value="${sessionScope.login_user.memberId}">
			 										      	</div>
													      	<div class="modal-footer">
														        <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
														        <button type="button" class="btn btn-info" id="adoptListSubmit">??????</button>
													      	</div>
														</form>
										    		</div>
											  	</div>
											</div>
											<!-- ??????Dialog End-->
										    <c:choose>
											    <c:when test="${cat.photo2!=null}">
												<div class="pcpLeading"
													style="background-image: url('catImageToByte?path=${cat.photo2}')"
													id="supportCatDetailShow"></div>
													</c:when>
													<c:when test="${cat.photo2==null || cat.photo2==''}">
													<div class="pcpLeading"
													style="background-image: url('catImageToByte?path=${cat.photo1}')"
													id="supportCatDetailShow"></div>
												</c:when>
		                                   	</c:choose>
											<div class="supportCatDatailTitle">
												<h2>????????????</h2>
											</div>
											<div class="supportCatDatailInfo">
												<div class="supportCatDatailInfo-img">
													<img src="catImageToByte?path=${cat.photo1}" alt="${cat.nickname}"
														width="300px" height="auto">
												</div>
												<div class="supportCatDetailInfoCatData">
													<h2 class="supportCatDetailName">${cat.nickname}</h2>
													<div class="supportCatDetailStatus">
														<div class="supportCatDetailInfoLeft">
															<div>?????????${cat.type}</div>
															<div>?????????${cat.gender}</div>
															<div>???????????????${cat.adoptStatus.description}</div>
														</div>
														<div class="supportCatDetailInfoRight">
															<div>?????????<c:choose><c:when test="${cat.ligation == true}">???</c:when><c:otherwise>???</c:otherwise></c:choose></div>
															<div>?????????<c:choose><c:when test="${cat.vaccination == true}">???</c:when><c:otherwise>???</c:otherwise></c:choose></div>
															<div>???????????????<span class="onlyDate">${cat.createDate}</span></div>
															<div>
																<button type="button" class="btn btn-info IWantIt" data-toggle="modal" data-target="#adoptListDialog">????????????</button>
																<a class="btn btn-info" href="supportCat">????????????</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="supportCatDatailInfoComment">
												<div class="supportCatDatailInfoComment1">
													${cat.comment1}</div>
												<div class="supportCatDatailInfoComment2">
													${cat.comment2}</div>
											</div>
										</article>
									</section>
								</section>
								<!--main content end-->
							</main>
						</div>
					</div>
				</div>
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
					swal("?????????????????????!", "?????????~~~", "warning");
				});
				if(localStorage.myProducts != null || localStorage.myProducts == ""){
					localStorage.removeItem('myProducts');
				}
			});
		</script>
	</c:if>
	
	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
		
<script>
	$('#adoptListCatName').text($('.supportCatDetailName').text());
	$(".onlyDate").text($(".onlyDate").text().substr(0,10));
	if(${cat.adoptStatus.id}==3 || ${cat.adoptStatus.id}==4){
		$('.IWantIt').attr("disabled",true);
	}
	
	$('.IWantIt').on("click",function(){
		$("#adoptListSelectDate").val("");
		$("#adoptListSelectTime").val("");
		$("#dateresult").val("");
		removedatearr.length=0;
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
		let catId = ${cat.id};
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
			$.ajax({	??
?????? ?? ?? ?? ?? 	type:"POST", ?? ?? ?? ?? ?? ?? ?? ?? ?? ??//??????http?????????????????????POST
				url: "insertAdoptList", ?? ?? ?? ??//???????????????url?????????url?????????GET???????????? www.xxxx.com?xx=yy&xxx=yyy
??				data: $("#adoptListForm").serializeArray(), //??????????????????data???id=formId???Form????????????(serialize)????????????????????????name?????????value
				//Ajax??????????????????function???response???????????????
				//??????????????????JSON Object???????????????????????????: {userName:XXX,uswerInterest:[y1,y2,y3,...]}
??				success : function(response){
					createtoast(response);
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