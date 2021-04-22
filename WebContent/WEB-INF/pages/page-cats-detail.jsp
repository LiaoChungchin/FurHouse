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
	</style>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!-- User Define JS -->
	<script src="assets/js/index.js"></script>
	<script src="assets/js/bootstrap-datepicker.min.js"></script>
	<script src="assets/js/bootstrap-datepicker.zh-TW.min.js"></script>

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
				<!-- ###置入本頁資訊### -->
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-10" id="div-v-pills">
							<main role="main">
								<!--main content start-->
								<section id="main-content">
									<section class="wrapper">
										<article class="supportCatDetail">
											<!-- 小視窗提示 -->
											<!-- Flexbox container for aligning the toasts -->
											<div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center littleWindow" style="min-height: 200px;" >			
											</div>
											
											<!-- 領養Dialog -->
											<div class="modal fade" id="adoptListDialog" tabindex="-1" aria-labelledby="adoptListModalLabel" aria-hidden="true">
											  	<div class="modal-dialog">
											    	<div class="modal-content">
												      	<div class="modal-header">
												        	<h5 class="modal-title" id="adoptListModalLabel">我要認養</h5>
												        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												     	</div>
												     	<form action="/insertAdoptList" enctype="multipart/form-data" id="adoptListForm">
													      	<div class="modal-body">
														        <!-- 名字 -->
																<div class="form-group row">
																	<label for="InsertCatInputName" class="col-sm-3">貓名</label>
																	<span class="col-sm-9" id="adoptListCatName"></span>
																</div>
																<!-- 探望日期 -->
													        	<div class="form-group row">
																	<label class="col-sm-3" for="adoptListSelectDate">探望日期</label> 
																	<input type="text" class="form-control datepicker col-sm-8" autocomplete="off"
																		id="adoptListSelectDate"> 
																	<small id="adoptListDateHelp" class="form-text text-muted"></small>
																	<div class="col-sm-1"></div>
																</div>
																<!-- 時段 -->
																<div class="form-group row">
																	<label for="adoptListSelectTime" class="col-sm-3">時段</label> 
																	<select class="form-control col-sm-8" id="adoptListSelectTime"></select>
																	<div class="col-sm-1"></div>
																</div>
																
																<!-- 隱藏欄位 -->
																<input type="hidden" id="dateresult" name="visitTime">
																<input type="hidden" name="catId" value="${cat.id}">
																<input type="hidden" name="memberId" id="memberId" value="${sessionScope.login_user.memberId}">
			 										      	</div>
													      	<div class="modal-footer">
														        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
														        <button type="button" class="btn btn-primary" id="adoptListSubmit">確認</button>
													      	</div>
														</form>
										    		</div>
											  	</div>
											</div>
											<!-- 領養Dialog End-->
										
											<div class="pcpLeading"
												style="background-image: url('catImageToByte?path=${cat.photo2}')"
												id="supportCatDetailShow"></div>
			
											<div class="supportCatDatailTitle">
												<h2>貓貓資訊</h2>
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
															<div>樣式：${cat.type}</div>
															<div>性別：${cat.gender}</div>
															<div>領養狀態：${cat.adoptStatus.description}</div>
														</div>
														<div class="supportCatDetailInfoRight">
															<div>結紮：<c:choose><c:when test="${cat.ligation == true}">是</c:when><c:otherwise>否</c:otherwise></c:choose></div>
															<div>接種：<c:choose><c:when test="${cat.vaccination == true}">是</c:when><c:otherwise>否</c:otherwise></c:choose></div>
															<div>報到時間：<span class="onlyDate">${cat.createDate}</span></div>
															<div>
																<button type="button" class="btn btn-primary IWantIt" data-toggle="modal" data-target="#adoptListDialog">我要認養</button>
																<a class="btn btn-primary" href="supportCat">回上一頁</a>
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
		
<script>
	$('#adoptListCatName').text($('.supportCatDetailName').text());
	$(".onlyDate").text($(".onlyDate").text().substr(0,10));
	if(${cat.adoptStatus.id}==3 || ${cat.adoptStatus.id}==4){
		$('.IWantIt').attr("disabled",true);
	}
	
	$('.IWantIt').on("click",function(){
		$("#adoptListSelectDate").val("");
		$("#adoptListSelectTime").val("");
	});
	
	$(".datepicker").datepicker({
		format : "yyyy-mm-dd", //設定格式為2019-04-01
		autoclose : true,//選擇日期後就會自動關閉
		startDate : "today",//起始日期為今天
		todayHighlight : true,//今天會有一個底色
		language : 'zh-TW'//中文化
	});
	
	$("#adoptListSelectDate").on("change",function(){
		let searchDate = $("#adoptListSelectDate").val();
		$.ajax({	 
            type:"GET",
			url: "searchAllAdoptListVisitTime/" + searchDate,
			dataType: "json",
 			success : function(response){
				removedatearr.length = 0;
				for(let i = 0 ; i < response.length ; i++){
					removedatearr.push(response[i].visitTime);
				}
				
				if(removedatearr.length==13){
					$("#adoptListSelectTime").html("<option selected='selected'>預約額滿</option>");
				}
 			},
 				//Ajax失敗後要執行的function，此例為印出錯誤訊息
 			error:function(xhr, ajaxOptions, thrownError){
 					alert(xhr.status+"\n"+thrownError);
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
			$("#adoptListSelectTime").html("<option>預約額滿</option>>");
		}
		
		
		$("#dateresult").val($("#adoptListSelectDate").val()+" "+$("#adoptListSelectTime").val()+":00");
	})

	
	
	$("#adoptListSelectTime").on("change",function(){
			$("#dateresult").val($("#adoptListSelectDate").val()+" "+$("#adoptListSelectTime").val()+":00");
	})
	
	
	/*--------------------------------------------------------------------------------------------------------------------------*/
	$("#adoptListSubmit").on("click",function(){
		if($("#memberId").val().length == 0){
			createtoast("尚未登入");
		}else{
			$.ajax({	 
            	type:"POST",                    //指定http參數傳輸格式為POST
				url: "insertAdoptList",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
 				data: $("#adoptListForm").serializeArray(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之內含有name的物件value
				//Ajax成功後執行的function，response為回傳的值
				//此範列回傳的JSON Object的內容格式如右所示: {userName:XXX,uswerInterest:[y1,y2,y3,...]}
 				success : function(response){
					createtoast(response);
 				},
 				//Ajax失敗後要執行的function，此例為印出錯誤訊息
 				error:function(xhr, ajaxOptions, thrownError){	
					createtoast("新增失敗!!!");
				}
			});
		}
	})
		
		
	function createtoast(toaststr){
		let str = "";
		str+='<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="5000">'+
		     '	<div class="toast-header">'+
			 '		<strong class="mr-auto">小提示</strong>'+
			 '			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">'+
			 '			<span aria-hidden="true">&times;</span>'+
			 '		</button>'+
		     '	</div>'+
			 '	<div class="toast-body">'+
			 		toaststr+
			 '	</div>'+
			 '</div>';
		$('.littleWindow').html(str);
 		$('.toast').toast('show');
		$('#adoptListDialog').modal('hide');
	}
</script>

</body>
</html>