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
<style>
body {
	background-image: url(assets/img/member_bg.jpg);
	background-size: 1440px 900px;
	background-position: right bottom;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

h1 {
	margin-top: 300px;
}
</style>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="assets/js/w3.js"></script>
<script src="assets/js/jQuery-3.6.0.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>

<!-- User Define JS -->
<script>
	$(function() {
		var myName = "${sessionScope.login_user.name}";
		var nickName = " " + myName.substr(0);
		$("h1").append(nickName);
	})
</script>
<script src="assets/js/index.js"></script>
<title>FurHouse</title>

</head>
<body>
	<div
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		<h2 class="my-0 mr-md-auto font-weight-normal">修改密碼</h2>
		<a class="btn btn-outline-warning" href="<c:url value='/index'/>">返回首頁</a>
	</div>
	<div class="text-center">
		<nav class="my-2 my-md-0 mr-md-3">
			<a
				class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded"
				href="<c:url value='/member.profile/${login_user.memberId}'/>"><i
				class="bi bi-file-earmark-person-fill"></i> 個人資料</a> <a
				class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded"
				href="javascript:;"><i class="bi bi-bag-check-fill"></i> 我的訂單</a> <a
				class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded"
				href="javascript:;"><i class="bi bi-calendar-week-fill"></i>
				預約紀錄</a> <a
				class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded"
				href="member.chat"><i class="bi bi-chat-left-dots-fill"></i>
				客服視窗</a>
		</nav>

	</div>

	<div class="form-group col-md-6">
		<div>
			<form method="post" id="profileupdateform1" enctype="multipart/form-data">
				<input type="hidden" id="updateNo" name="updateNo" value="${login_user.memberId}";>
					<br> 
					   <div>
						<input type="text" class="form-control"  id="updatePwd" name="updatePwd" value="${login_user.password}" disabled="disabled">
					    </div>
					    <br>
					  <div>
						<input type="text" class="form-control" id="updatePwd" name="updatePwd"
						 placeholder="新密碼"><div class=""></div>
				      </div>
				      
				     <br>
				     
					  <div>
						<input type="text" class="form-control" id="updatePwdCheck" name="updatePwdCheck"
						 placeholder="確認新密碼">
					  </div>
				 <br>
				 <div>
						<button type="button" class="btn btn-primary" id="sucess1" disabled>儲存</button >
						
				 </div>
			</form>
		</div>
	</div>

	<h1 class="text-center font-weight-bolder">Hello ~</h1>
		<h2 class="mt-1 text-center text-muted font-weight-bolder">I'm Here...</h2>


</body>
<script>

$(function(){
	$.ajax({
		type : "GET", //指定http參數傳輸格式為POST
		url : "member.profile/${login_user.memberId}", //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
		success : function(member) {
			$('#updatePwd').val(member.password);	
		},
		
		//Ajax失敗後要執行的function，此例為印出錯誤訊息
		error : function(xhr, ajaxOptions, thrownError) {
		}
	})});



	 
	 	//ajax for 修改後顯示
	 $('#sucess1').on("click",function(){
		 console.log($("#profileupdateform1").serializeArray());
		$.ajax({
			type : "POST", //指定http參數傳輸格式為POST
			url : "member.password.update", //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
			data : $("#profileupdateform1").serializeArray(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之內含有name的物件value
			success : function(memeber) {
				 console.log(memeber);
// 				$('#updateName').val(member.name);
// 				$('#updateMail').val(member.email);
// 				$('#updatePhone').val(member.phone);
// 				$('#updateAddress').val(member.address);
				alert("修改成功");
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(ajaxOptions+" "+thrownError);
			}
			
		});
		
		
// 		// for 密碼update
// 	    $("body").on("blur", "#updatePwd", function () {
// 	        let reg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_ `\-={}:";'<>?,.\/]).{4,}$/;
// 	        if (/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_ `\-={}:";'<>?,.\/]).{4,}$/.test($(this).val())) {
// 	            $(this).removeClass("is-invalid");
// 	            $(this).addClass("is-valid");
// 	            $(this).next().removeClass("invalid-feedback");
// 	            $(this).next().addClass("valid-feedback");
// 	            $(this).next().html("密碼格式正確");
// 	        } else {
// 	            $(this).removeClass("is-valid");
// 	            $(this).addClass("is-invalid");
// 	            $(this).next().removeClass("valid-feedback");
// 	            $(this).next().addClass("invalid-feedback");
// 	            $(this).next().html("密碼格式不符");
// 	        }
// 	    });
		
	})
</script>
</html>