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
		.wrapper{
			margin: 30px auto;
			width: 70%;
			display:none;
			background-color: white; 
		}
		
		.confirmAdoptListBtn{
			margin-left: 5px;
		}
		
		.littleWindow{
			position: fixed;
			right: 20px;
			top: 200px;
		}
		
		.pageGroup{
			position: fixed;
			bottom:50px;
			left:15%;
		}
		
		.pageGroup button{
			width: 45px;
			margin: 0px 2px;
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
		<nav class="my-2 my-md-0 mr-md-3 connectOtherFeatures">
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-file-earmark-person-fill"></i> 個人資料</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-bag-check-fill"></i> 我的訂單</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-calendar-week-fill"></i> 預約紀錄</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="member.chat"><i class="bi bi-chat-left-dots-fill"></i> 客服視窗</a>
		</nav>
		
	</div>
	<div class="text-content">
		<h1 class="text-center font-weight-bolder">Hello ~</h1>
		<h2 class="mt-1 text-center text-muted font-weight-bolder">I'm Here...</h2>
	</div>
	
	<!-- 小視窗提示 -->
	<div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center littleWindow" style="min-height: 200px;" >
	</div>
	<!-- 領養單更新modal -->
	<div class="modal fade" id="updateAdoptListModalCenter" tabindex="-1" role="dialog" aria-labelledby="updateAdoptListModalCenter" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="updateAdoptListModalCenterTitle">確認取消預約</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/updateAdoptList" enctype="multipart/form-data" id="adoptListUpdateForm">
						<div class="form-group row">
							<label for="adoptListId" class="col-sm-3 col-form-label">編號</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext" id="adoptListId" name="adoptListId">
							</div>
						</div>
						<div class="form-group row">
							<label for="adoptListId" class="col-sm-3 col-form-label">探望日期</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext" id="adoptListVisitTime" name="visitTime">
							</div>
						</div>
						<div class="form-group row">
							<label for="adoptListId" class="col-sm-3 col-form-label">貓編號</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext" id="adoptListCatId" name="catId">
							</div>
						</div>
						<div class="form-group row">
							<label for="adoptListId" class="col-sm-3 col-form-label">貓名</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext" id="adoptListCatNickname">
							</div>
						</div>
						<input type="hidden" id="adoptListMemberId" name="memberId" value="${sessionScope.login_user.memberId}">
						<input type="hidden" id="adoptListStatudId" name="adoptListStatusId" value="0">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="updateAdoptListSubmit">確認</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 領養單確認領養modal -->
	<div class="modal fade" id="confirmAdoptListModalCenter" tabindex="-1" role="dialog" aria-labelledby="confirmAdoptListModalCenter" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmAdoptListModalCenterTitle">確認領養</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group row">
					
							<label for="confirmAdoptListId" class="col-sm-3 col-form-label">編號</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext" id="confirmAdoptListId">
							</div>
						</div>
						<div class="form-group row">
							<label for="confirmAdoptListVisitTime" class="col-sm-3 col-form-label">探望日期</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext" id="confirmAdoptListVisitTime">
							</div>
						</div>
						<div class="form-group row">
							<label for="confirmAdoptListCatId" class="col-sm-3 col-form-label">貓編號</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext" id="confirmAdoptListCatId" >
							</div>
						</div>
						<div class="form-group row">
							<label for="confirmAdoptListCatNickname" class="col-sm-3 col-form-label">貓名</label>
							<div class="col-sm-9">
								<input type="text" readonly class="form-control-plaintext" id="confirmAdoptListCatNickname">
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="confirmAdoptListSubmit">確認</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(".connectOtherFeatures a").on("click", function() {
		console.log($(this).index());
		switch ($(this).index()) {
		case 0:

			break;
		case 1:

			break;
		case 2:
			$('.text-content').html('<div class="wrapper"></div><div class="pageGroup"></div>');
			$('.wrapper').attr("style", "display:block;");
			currentPage = 1;
			selectAllAdoptListMemberId();
			break;
		case 3:
			console.log("客服視窗")
			break;
		default:
			alert("無法辨識");
		}

	})
	
	/*-------------------領養單-----------------------------------------------------------------*/
	var pageLimit = 10;
	var currentPage = 1; 
	
	/*顯示個人領養單*/
	function selectAllAdoptListMemberId() {
		$.ajax({
			type : "GET",
			url : "searchAllAdoptListMemberId/${sessionScope.login_user.memberId}",
			dataType : "json",
			beforeSend:function(XMLHttpRequest){
	            console.log("gif"); 
	        },
			success : function(adoptLists) {
				writeHtml(adoptLists);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(xhr.status + "\n" + thrownError);
			}
		});
	}

	/*寫入表單內容*/
	function writeHtml(adoptLists) {
		let tempstr = '<table class="table table-hover table-striped">'
				+ '	<thead class="thead-light">' + '		<tr>'
				+ '			<th scope="col">編號</th>' 
				+ '			<th scope="col">探望時間</th>'
				+ '			<th scope="col">貓編號</th>' 
				+ '			<th scope="col">貓名</th>'
				+ '			<th scope="col">狀態</th>' 
				+ '			<th scope="col">功能</th>'
				+ '		</tr>' 
				+ '	</thead>' 
				+ '	<tbody>';
		for (let i = 0; i < adoptLists.length; i++) {
			let adoptList = adoptLists[i];
			if (adoptList.adoptListStatus.id > 0) { //須加寫DAO
				tempstr += '<tr>'
						+ '		<td scope="row">'+ adoptList.id+ '</td>'
						+ '		<td>'+ adoptList.visitTime+ '</td>'
						+ '		<td>'+ adoptList.cat.id+ '</td>'
						+ '		<td>'+ adoptList.cat.nickname + '</td>'
						+ '		<td>'+ adoptList.adoptListStatus.description +'</td>'
						+ '		<td><button type="button" class="btn btn-secondary updateAdoptListBtn" data-toggle="modal" data-target="#updateAdoptListModalCenter">取消</button>';
						if(adoptList.adoptListStatus.id == 2){
							tempstr	+= '<button type="button" class="btn btn-success confirmAdoptListBtn" data-toggle="modal" data-target="#confirmAdoptListModalCenter">確認領養</button>'
									+'  <img src="<c:url value="/assets/img/AdoptListLoading.gif" />" width="30px" id="loadingGIF" style="display:none">';
						}else{
							tempstr	+= '	<button type="button" style="visibility: hidden;" class="btn btn-success">確認領養</button>';
						}					
				tempstr += '</td></tr>';			
			}
		}
		tempstr += '</tbody></table>';
		$('.wrapper').html(tempstr);
	}
	
	/*取得表格內容*/
	$('body').on("click",".updateAdoptListBtn",function(){
		let tempstr = new Array();
	    for (let i = 0; i < $(this).parent().parent().children().length; i++) {
	        tempstr.push($(this).parent().parent().children()[i].innerText)        
	    }
	    $('#adoptListId').val(tempstr[0]);
	    $('#adoptListVisitTime').val(tempstr[1]);
	    $('#adoptListCatId').val(tempstr[2]);
	    $('#adoptListCatNickname').val(tempstr[3]);
	})
	
	/*更新領養狀態*/
	$('#updateAdoptListSubmit').on("click",function(){
		$.ajax({
			type : "POST", //指定http參數傳輸格式為POST
			url : "updateAdoptList", //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
			data : $("#adoptListUpdateForm").serializeArray(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之內含有name的物件value
			success : function(response) {
				createtoast(response);
				selectAllAdoptListMemberId();
			},
			//Ajax失敗後要執行的function，此例為印出錯誤訊息
			error : function(xhr, ajaxOptions, thrownError) {
				createtoast("新增失敗!!!");
			}
		});
		$('#updateAdoptListModalCenter').modal("hide");	
	})
	
	/*取得確認表格內容*/
	$('body').on("click",".confirmAdoptListBtn",function(){
		let tempstr = new Array();
	    for (let i = 0; i < $(this).parent().parent().children().length; i++) {
	        tempstr.push($(this).parent().parent().children()[i].innerText)        
	    }
	    $('#confirmAdoptListId').val(tempstr[0]);
	    $('#confirmAdoptListVisitTime').val(tempstr[1]);
	    $('#confirmAdoptListCatId').val(tempstr[2]);
	    $('#confirmAdoptListCatNickname').val(tempstr[3]);
	})
	
	/*確認領養按鈕*/
	$('#confirmAdoptListSubmit').on("click",function(){
		$.ajax({
			type : "GET", //指定http參數傳輸格式為POST
			url : "sendEmail/${sessionScope.login_user.name}/${sessionScope.login_user.email}", //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
			beforeSend : function(xhr){
				$('#loadingGIF').attr("style"," ");
				$('.confirmAdoptListBtn').attr("style","display:none");
			},
			success : function(response) {
				$('#loadingGIF').attr("style","display:none");
				$('.confirmAdoptListBtn').attr("style","");
				createtoast(response);
			},
			//Ajax失敗後要執行的function，此例為印出錯誤訊息
			error : function(xhr, ajaxOptions, thrownError) {
				createtoast("發生錯誤!!!");
			}
		});
		$('#confirmAdoptListModalCenter').modal("hide");	
	})
	
	
	/*小提示*/
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
</html>