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
	<link href="assets/css/talk-for-user.css" rel="stylesheet">
	<link href="assets/css/index.css" rel="stylesheet">
	<style>
		body {
			background-image :linear-gradient(rgba(252,252,252,0.8), rgba(252,252,252,0.8)), url(assets/img/member_bg.jpg); 
			background-size : 1440px 900px;
			background-position : right bottom;
			background-repeat : no-repeat;
			background-attachment : fixed;
		}
		h1 {
			margin-top : 300px;
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
			margin:30px 0 50px 10px;
			text-align:center;
		}
		.pageGroup button{
			width: 45px;
			margin: 0px 2px;
		}
		/*會員資料*/
		#MemberDivPadding{
			padding-left:50px;
		}
		/*----------------------表單樣式----------------------*/
 		/*訂單抬頭*/
		.table thead{
			background-color: rgba(243, 155, 39, 0.9);
			color:#FAFAFA !important;
		}
		/*訂單表格*/
		.contentBox{
			margin: 30px auto;
			width: 80%;
			display:none;
			background-color: rgba(255,255,242,0.65)
		}
		/*貓預約抬頭*/
		.table thead#tablethead2{
			background-color: rgba(106, 195, 46, 0.7);
			color:#FAFAFA !important;
		}
		/*貓預約表格*/
		.wrapper{
			margin: 30px auto;
			width: 70%;
			display:none;
			background-color: rgba(234,249,232,0.7);
		}
 		/* 	更改 Bootstrap 懸停顏色 */
		.table-hover tbody tr:hover, .table-hover tbody tr:hover td,
		.table-hover tbody tr:hover th {
			background: rgba(246, 219, 51, 0.3) !important;
			/* 	 color:#fff !important;  */
		}
		/*----------------------modal 樣式 ----------------------------------*/
		/*modal標題顏色 */
		.modaltitle{
			color:#BD0000;
		}
		/*modal 水平分隔線漸進色 */		
		.modal-hr{
		width: 80%;
		margin: 20px auto;
		border: 0;
 		height: 1px; 
		background: #ff9f99;
 		background-image: linear-gradient(to right, #ccc, #ff9f99, #ccc);
		}
		#form-title{
			margin-top:10px;
			background:#009494;
			color:#FAFAFA;
			font-size:18px;
			border-radius:5px;
		}
		.formtitle{
			padding:10px;
			margin:10px 5px 10px 2px;
		}
		/*貓預約取消內容樣式*/
		#catType{
			margin-left:10px;
			background-color:rgba(212,212,212,0.5);
		}
		.orderType{
			margin:10px 10px 0 15px;
			padding-right:22px;
			border-radius:5px;
			background-color:rgba(153,183,183,0.5);
		}
		/*訂單modal標題距離*/
		.plaintext{
			margin-top:10px;
		}
		/*訂單modal內備註距離*/
		#comment{
			padding:20px;
		}
		/*訂單取消內容樣式*/
		#modalConditionContent{
			margin:5px;
			text-align:center;
			font-size:18px;
		}		
 		#totalPrice{ 
 			text-align:right; 
 			padding-right:80px;
 		}
 		/*按鈕顏色*/
		.bg-warning {
		    background-color: rgba(193,66,66,0.6) !important;
		}
        
		a.bg-warning:hover, a.bg-warning:focus,
		button.bg-warning:hover,
		button.bg-warning:focus {
		  background-color: #ECB2B3 !important;
		}
 		
	</style>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- User Define JS -->
	<script>
		$(function(){
			var myName = "${sessionScope.login_user.name}";
			var nickName = " " + myName.substr(1) + ",";
			$("h1").append(nickName);
		})
		
// ----------------------------------客服對話框----------------------------------
		var websocket = null;
		$(function(){
			var myName = "${sessionScope.login_user.name}";
			var nickName = myName.substr(1);
			
			$("div.received_withd_msg>p").eq(0).prepend("您好！" + nickName + "，");
			
			if ("WebSocket" in window) {
		        var sendUser = document.getElementById("sendUser").value;
		        websocket = new WebSocket("ws://localhost:8080/FurHouse/chatToServer/${sessionScope.login_user.memberId}");
		    } else {
		        alert("Not support Websocket")
		    }
		
		    websocket.onerror = function () {
		    	
		    };
		
		    websocket.onopen = function (event) {
		    	
		    }
		
		    websocket.onmessage = function (event) {
		        var msg = event.data;
		        if (event.data.indexOf("count") > -1) {
		            
		        } else {
		        	msg = JSON.parse(msg);
// 		        	console.log("接收後台getBasicRemote().sendText(message) : " + JSON.stringify(msg));
					// setMessageInnerHTML(event.data);
					if(msg.sendUser == sendUser){
						setMessageDiv("client", msg);
					} else {
						setMessageDiv("server", msg);
					}
		        }
		    }
		
		    websocket.onclose = function () {
		        
		    }
		
		    window.onbeforeunload = function () {
		        websocket.close();
		    }
		    
			//最小化客服對話框
		    $("body").on("click", "i.bi-arrow-down-right-square", function(){
		    	
		    	$("div#talkToMe").hide();
		    	$("div#catbowTalk").show();
		    });
			//彈出客服對話框
			$("body").on("click", "div#catbowTalk", function(){
		    	
		    	$("div#catbowTalk").hide();
		    	$("div#talkToMe").show();
		    });
		});
				
		function setMessageDiv(type, msg) {
		    if(type === "client"){
		    	// clinet 的 msg 給的是 String
		    	function fillzeros(value){
		    		if(value < 9){
		    			return "0" + value;
		    		}
		    		return value;
		    	};
		    	
		    	let timeAtNow = new Date();
		    	timeAtNow = (timeAtNow.getFullYear()) 
		    				+ "-" 
		    				+ fillzeros((timeAtNow.getMonth() + 1))
		    				+ "-" 
		    				+ fillzeros(timeAtNow.getDate())
		    				+ " " 
		    				+ fillzeros(timeAtNow.getHours()) 
		    				+ ":" 
		    				+ fillzeros(timeAtNow.getMinutes())
		    				+ ":" 
		    				+ fillzeros(timeAtNow.getSeconds());
		    	
		    	// 由於若是資料庫來的資料會是物件所以增加此判斷
		    	if(typeof msg == "object") {
		    		
		    		timeAtNow = msg.talkTime;
		    		msg = msg.message;
		    	}
		    				
		    	let fillinMsg = "<div class='outgoing_msg'><div class='sent_msg'><p>"
		    					+ msg
		    					+ "</p><span class='time_date'>"
		    					+ timeAtNow
		    					+ "</span></div></div>";
		    	$("div#showMsg").append(fillinMsg);
		    	
		    	// scrollbar保持在最底部
			    let thisScrollMainWindow = $("#showMsg").get(0);
			    thisScrollMainWindow.scrollTop = thisScrollMainWindow.scrollHeight;
		    };
		    if(type === "server"){
		    	// server 的 msg 給的是 JSON
		    	let fillinMsg = "<div class='incoming_msg'>"
		    					+ "<div class='incoming_msg_img'>"
		    					+ "<img src='assets/img/service-profile.png' alt=''>"
		    					+ "</div>"
		    					+ "<div class='received_msg'>"
		    					+ "<div class='received_withd_msg'>"
		    					+ "<p>"
		    					+ msg.message
		    					+ "</p>"
		    					+ "<span class='time_date'>"
		    					+ msg.talkTime
		    					+ "</span></div></div></div>"
		    	$("div#showMsg").append(fillinMsg);
		    					
		    	// scrollbar保持在最底部
			    let thisScrollMainWindow = $("#showMsg").get(0);
			    thisScrollMainWindow.scrollTop = thisScrollMainWindow.scrollHeight;
		    };
		};
		
		function closeWebSocket(){
			websocket.close();
		};
		
		function send() {
			
			if(document.getElementById("write_msg").value != ""){
				
			    var sendUser = parseInt(document.getElementById("sendUser").value);
			    var toUser = 0; // 在用戶端固定將信息回覆給管理員
			    var message = document.getElementById("write_msg").value;
			
			    var jsonMsg = {"sendUser": sendUser, "toUser": toUser, "message": message}
			    websocket.send(JSON.stringify(jsonMsg));
			    
// 		    	console.log("送出的JSON字串 : " + JSON.stringify(jsonMsg));
				
				setMessageDiv("client", message);
			    document.getElementById("write_msg").value = "";
			    
			    // scrollbar保持在最底部
			    let thisScrollMainWindow = $("#showMsg").get(0);
			    thisScrollMainWindow.scrollTop = thisScrollMainWindow.scrollHeight;
			};
		};
	</script>
	<title>FurHouse</title>
</head>
<body>
	<div
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		<h2 class="my-0 mr-md-auto font-weight-normal">會員專區</h2>
		<a class="btn btn-outline-warning" href="<c:url value='/index'/>">返回首頁</a>
	</div>
	<div class="text-center">
		<nav class="my-2 my-md-0 mr-md-3 connectOtherFeatures">
			<a class="mx-2 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;">
				<i class="bi bi-file-earmark-person-fill"></i> 個人資料
			</a>
			<a class="mx-2 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;">
				<i class="bi bi-bag-check-fill"></i> 我的訂單
			</a>
			<a class="mx-2 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;">
				<i class="bi bi-calendar-week-fill"></i> 預約紀錄
			</a>
		</nav>
	</div>
	<div class="text-content">
		<h1 class="text-center font-weight-bolder">Hello ~</h1>
		<h2 class="mt-1 text-center text-muted font-weight-bolder">I'm
			Here...</h2>
	</div>

	<!-- 會員資料 -->
	<div class="form-group col-md-6 mt-md-3 memberprofile" style="display: none;" id="MemberDivPadding">
		<h3>編輯會員資料</h3>
		<div id="MemberDivPadding">
			<form method="post" id="profileupdateform"
				enctype="multipart/form-data">
				<input type="hidden" id="updateNo" name="updateNo"
					value="${login_user.memberId}"> <label for="updateName">姓名</label>
				<div>
					<input type="text" class="form-control" id="updateName"
						name="updateName" value="${login_user.name}" style="width:300px;">
				</div>
				<br>
				<div>
					<!-- 					<label for="updatePwd" >會員密碼</label> -->
					<div>
						<%-- 						<input type="text" class="form-control"  id="updatePwd" name="updatePwd" value="${login_user.password}" disabled="disabled"> --%>
						<a href="<c:url value='/member.resetpwd'/>" class="btn btn-primary">設定新的密碼</a>
					</div>
				</div>
				<br>
				<div>
					<label for="updateMail">電子信箱</label>
					<div>
						<input type="text" class="form-control" id="updateMail"
							name="updateMail" value="${login_user.email}" style="width:300px;">
					</div>
				</div>
				<br>
				<div>
					<label for="updatePhone">手機號碼</label>
					<div>
						<input type="text" class="form-control" id="updatePhone"
							name="updatePhone" value="${login_user.phone}" style="width:300px;">
					</div>
				</div>
				<br>
				<div>
					<label for="updateAddress">地址</label>
					<div>
						<input type="text" class="form-control" id="updateAddress"
							name="updateAddress" value="${login_user.address}" style="width:300px;">
					</div>
				</div>

				<br><div>
					<input type="file" name="photo" id="changephoto"/>
   							 <ul class="picture_list"></ul>
   							 <img src="" id="photo" alt="" style="width:256px; height:256px;"/>
 
					<img src="" id="photo" alt="" />
				</div>
				<div>
					<button type="button" class="btn btn-primary" id="sucess" style="margin-left:550px;">儲存</button>
				</div>

			</form>
		</div>
	</div>

	<!-- 小視窗提示 -->
	<div aria-live="polite" aria-atomic="true"
		class="d-flex justify-content-center align-items-center littleWindow"
		style="min-height: 200px;"></div>
	<!-- 領養單更新modal -->
	<div class="modal fade" id="updateAdoptListModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="updateAdoptListModalCenter"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title modaltitle" id="updateAdoptListModalCenterTitle">確認取消預約</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div class="modal-body">
					<form action="/updateAdoptList" enctype="multipart/form-data"
						id="adoptListUpdateForm">
						<div class="form-group row">
							<label for="adoptListId" class="col-sm-3 col-form-label" id="catType" >編號</label>
							<div class="col-sm-8">
								<input type="text" readonly class="form-control-plaintext" id="adoptListId" name="adoptListId">
							</div>
						</div>
						<div class="form-group row">
							<label for="adoptListId" class="col-sm-3 col-form-label" id="catType">探望日期</label>
							<div class="col-sm-8">
								<input type="text" readonly class="form-control-plaintext" id="adoptListVisitTime" name="visitTime">
							</div>
						</div>
						<div class="form-group row">
							<label for="adoptListId" class="col-sm-3 col-form-label" id="catType">貓編號</label>
							<div class="col-sm-8">
								<input type="text" readonly class="form-control-plaintext" id="adoptListCatId" name="catId">
							</div>
						</div>
						<div class="form-group row">
							<label for="adoptListId" class="col-sm-3 col-form-label" id="catType">貓名</label>
							<div class="col-sm-8">
								<input type="text" readonly class="form-control-plaintext" id="adoptListCatNickname">
							</div>
						</div>
						<input type="hidden" id="adoptListMemberId" name="memberId"
							value="${sessionScope.login_user.memberId}"> <input
							type="hidden" id="adoptListStatudId" name="adoptListStatusId"
							value="0">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						id="updateAdoptListSubmit">確認</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 領養單確認領養modal -->
	<div class="modal fade" id="confirmAdoptListModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="confirmAdoptListModalCenter"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title modaltitle" id="confirmAdoptListModalCenterTitle">確認領養</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group row">

						<label for="confirmAdoptListId" class="col-sm-3 col-form-label">編號</label>
						<div class="col-sm-9">
							<input type="text" readonly class="form-control-plaintext"
								id="confirmAdoptListId">
						</div>
					</div>
					<div class="form-group row">
						<label for="confirmAdoptListVisitTime"
							class="col-sm-3 col-form-label">探望日期</label>
						<div class="col-sm-9">
							<input type="text" readonly class="form-control-plaintext"
								id="confirmAdoptListVisitTime">
						</div>
					</div>
					<div class="form-group row">
						<label for="confirmAdoptListCatId" class="col-sm-3 col-form-label">貓編號</label>
						<div class="col-sm-9">
							<input type="text" readonly class="form-control-plaintext"
								id="confirmAdoptListCatId">
						</div>
					</div>
					<div class="form-group row">
						<label for="confirmAdoptListCatNickname"
							class="col-sm-3 col-form-label">貓名</label>
						<div class="col-sm-9">
							<input type="text" readonly class="form-control-plaintext"
								id="confirmAdoptListCatNickname">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						id="confirmAdoptListSubmit">確認</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--訂單詳細資訊 modal-->
	<div class="modal fade" id="orderListDetails" tabindex="-1"
		role="dialog" aria-labelledby="orderListDetailsLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title modaltitle" id="orderListDetailsLabel">&nbsp;&nbsp;訂單詳細資訊</h4>
					<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="orderListForm">
					<br>
				<fieldset>
					<c:forEach var="i" begin="1" end="5">
					<div id="MyProduct<c:out value="${i}"/>">
					<div class="form-group row">
						<div class="col-sm-2">
							<img class="img-fluid" id="img<c:out value="${i}"/>">
						</div>
						<label for="productName<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品名稱</label>
						<div class="col-sm-6">
							<input type="text" readonly class="form-control-plaintext" id="productName<c:out value="${i}"/>" value="...">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-2"></div>
						<label for="productPrice<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品金額<br>(TWD)</label>
						<div class="col-sm-3">
							<input type="text" readonly class="form-control-plaintext" id="productPrice<c:out value="${i}"/>" value="...">
						</div>
		                <label for="productQuota<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品數量</label>
		                <div class="col-sm-2">
		                	<input type="text" readonly class="form-control-plaintext" id="productQuota<c:out value="${i}"/>" value="...">
		                </div>
					</div>
					<hr class="modal-hr">
					</div>
					</c:forEach>
				</fieldset>
				<fieldset>
						<div class="form-group row justify-content-end">
								<label for="productDiscount" class="col-sm-2 col-form-label">折扣&nbsp;&nbsp;(TWD)</label>
								<div class="col-sm-3">
									<input type="text" readonly class="form-control-plaintext"
										id="productDiscount" value="..." style="color:#008F00;font-size:18px;">
								</div>
								<label for="productAmount" class="col-sm-2 col-form-label">總金額&nbsp;&nbsp;(TWD)</label>
								<div class="col-sm-3">
									<input type="text" readonly class="form-control-plaintext"
										id="productAmount" value="..." style="color:#C20000;font-size:18px;font-weight:bold;">
								</div>
						</div>
				</fieldset>
				<fieldset>
						<label class="form-title col col-form-label formtitle" id="form-title">運&nbsp;送&nbsp;資&nbsp;訊</label>
						<div class="form-group row">
								<label for="contact" class="col-sm-2 col-form-label orderType">收件人</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext plaintext"
										id="contact" value="...">
								</div>
						</div>
							<div class="form-group row">
								<label for="paymentType" class="col-sm-2 col-form-label orderType">付款方式</label>
								<div class="col-sm-3">
									<input type="text" readonly class="form-control-plaintext plaintext"
										id="paymentType" value="...">
								</div>
								<label for="shippingType" class="col-sm-2 col-form-label orderType">運送單位</label>
								<div class="col-sm-3">
									<input type="text" readonly class="form-control-plaintext plaintext"
										id="shippingType" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="address" class="col-sm-2 col-form-label orderType">收件地址</label>
								<div class="col-sm-8">
									<input type="text" readonly class="form-control-plaintext plaintext"
										id="address" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="comment" class="col-sm-11 col-form-label orderType">訂單備註</label>
								<textarea class="form-control-plaintext plaintext" id="comment" rows="3"></textarea>
							</div>
				</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 訂單狀態更新modal -->
	<div class="modal fade" id="updateOrderList" tabindex="-1" role="dialog" aria-labelledby="updateAdoptList" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title modaltitle" id="updateOrderListTitle">確認取消訂單</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modalConditionContent">請再次確認是否取消訂單，或直接聯繫客服，謝謝您!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-info" id="updateOrderListSubmit">確認</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 客服對話框 -->
	<div id="catbowTalk" 
			style="position:fixed; bottom:0; right:5%; z-index:9999; display:block; hight:150px; width:150px; display:none">
		<img alt="" src="assets/img/Catbow_TalkToMe.png">
	</div>
	<div class="messaging" id="talkToMe" style="position:fixed; bottom:0; right:0; z-index:9998; display:block">
      <div class="inbox_msg">
          <div class="mesgs">
              <div id="chathead"><i class="bi bi-arrow-down-right-square"></i></div>
              <div class="msg_history" id="showMsg">
				<!-- 對話內容 -->
              </div>
              <div class="type_msg">
                  <div class="input_msg_write">
                      <input type="hidden" id="sendUser" value="${sessionScope.login_user.memberId}" />
                      <input type="text" id="write_msg" placeholder="請輸入......" />
                      <button class="msg_send_btn" onclick="send()">
                          <i class="bi bi-chat-dots"></i>
                      </button>
                  </div>
              </div>
          </div>
      </div>
  </div>
</body>
<script>
	$(function(){
		cancelAdoptListBeforeNow();
	})

	$(".connectOtherFeatures a").on("click",function() {
// 	  console.log($(this).index());
		switch ($(this).index()) {
		case 0:
			$(".memberprofile").attr("style", "");
			$('.text-content').html('');
			memberprofile();
			break;
		case 1:
     		$(".memberprofile").attr("style", "display:none;");
     		$('.text-content').html('<div class="row contentBox"></div><div class="pageGroup"></div>');
			$('.contentBox').attr("style","display:block;");
			currentPage = 1;
			selectAllOrderListMemberId();
			break;
		case 2:
			$(".memberprofile").attr("style", "display:none;");
			$('.text-content').html('<div class="wrapper"></div><div class="pageGroup"></div>');
			$('.wrapper').attr("style", "display:block;");
			currentPage = 1;
			selectAllAdoptListMemberId();
			break;
		default:
//			alert("無法辨識");
		}
	});
	/*--------------------------------------------會員資訊--------------------------------------------*/
	function memberprofile() {
		$.ajax({
			type : "GET", //指定http參數傳輸格式為POST
			url : "member.profile/${login_user.memberId}", //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
			success : function(member) {
				$('#updateName').val(member.name);
				$('#updatePwd').val(member.password);
				$('#updateMail').val(member.email);
				$('#updatePhone').val(member.phone);
				$('#updateAddress').val(member.address);
				$('#photo').attr("src", "member.getPhoto/" + member.memberId + "?" + Math.random());
			},
			
			//Ajax失敗後要執行的function，此例為印出錯誤訊息
			error : function(xhr, ajaxOptions, thrownError) {
			}
		})
	};
	$('#changephoto').on('change', function() {
		let reader = new FileReader();
		if(uploadImage()){
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(event) {
				$("#photo").attr('src', event.target.result);
			}
		}
		
		function uploadImage() {
	        // 判斷是否有選擇上傳文件 
        	let imgPath = $("#changephoto").val(); 
	        if (imgPath == "") { 
					        	alert("請選擇上傳圖片！");
					        	$("#changephoto").val('');  	
					        	return false; 
					        	}
	        // 判斷上傳文件的後綴名 
	        let strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
	        if (strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp') {
	            alert("請選擇圖片文件"); 
	            $("#changephoto").val('');
	            return false;
	        }
	        return true;
	    }
	});
	//ajax for 修改後顯示
	$('#sucess').on("click", function() {
		let formData = new FormData($('#profileupdateform')[0]);
		$.ajax({
					type : "POST",
					url : "member.profile.update",
					data : formData,
					contentType: false,
					cache: false,
					processData: false,
					success : function(memeber) {
								window.location = 'member.sussPwd';
								$("#changephoto").val('');
							},
					error : function(xhr, ajaxOptions, thrownError) {alert(ajaxOptions + " " + thrownError);}
				});
	})
	
	/*--------------------------------------------領養單--------------------------------------------*/
	/*顯示個人領養單*/
	function selectAllAdoptListMemberId() {
		$.ajax({
			type : "GET",
			url : "searchAllAdoptListMemberIdByAsc/${sessionScope.login_user.memberId}/10/"+currentPage,
			dataType : "json",
			beforeSend : function(XMLHttpRequest) {
// 						        console.log("gif");
                  },
			success : function(adoptListsResource) {
			            writeHtml(adoptListsResource.adoptLists);
			            createAdoptListPageBtn(adoptListsResource.adoptListTotal);
			          },
			error : function(xhr, ajaxOptions, thrownError) {
//			          console.log(xhr.status + "\n" + thrownError);
			        }
		});
	};
	/*寫入表單內容*/
	function writeHtml(adoptLists) {
		let cancelstr = "";
		let nowstr = "";
		let startstr = '<table class="table table-hover table-striped" id="table2">'
				+ '	<thead id="tablethead2">' + '<tr>'
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
				nowstr += '<tr>'
						+ '		<td scope="row">'
						+ adoptList.id
						+ '</td>'
						+ '		<td>'
						+ adoptList.visitTime
						+ '</td>'
						+ '		<td>'
						+ adoptList.cat.id
						+ '</td>'
						+ '		<td>'
						+ adoptList.cat.nickname
						+ '</td>'
						+ '		<td>'
						+ adoptList.adoptListStatus.description
						+ '</td>'
						+ '		<td><button type="button" class="btn btn-secondary updateAdoptListBtn" data-toggle="modal" data-target="#updateAdoptListModalCenter">取消</button>';
				if (adoptList.adoptListStatus.id == 2) {
					nowstr += '<button type="button" class="btn btn-primary confirmAdoptListBtn" data-toggle="modal" data-target="#confirmAdoptListModalCenter">確認領養</button>'
							+ '  <img src="<c:url value="/assets/img/AdoptListLoading.gif" />" width="30px" id="loadingGIF" style="display:none">';
				} else {
					nowstr += '	<button type="button" style="visibility: hidden;" class="btn btn-success">確認領養</button>';
				}
				nowstr += '</td></tr>';
			}else{
				cancelstr += '<tr>'
					+ '		<td scope="row">'
					+ adoptList.id
					+ '</td>'
					+ '		<td>'
					+ adoptList.visitTime
					+ '</td>'
					+ '		<td>'
					+ adoptList.cat.id
					+ '</td>'
					+ '		<td>'
					+ adoptList.cat.nickname
					+ '</td>'
					+ '		<td>'
					+ adoptList.adoptListStatus.description
					+ '</td>'
					+ '<td><button type="button" class="btn btn-secondary" disabled>已取消</button></td></tr>';
			}
		}

		let endstr = '</tbody></table>';
		$('.wrapper').html(startstr+nowstr+cancelstr+endstr);
	}

	/*取得表格內容*/
	$('body').on("click", ".updateAdoptListBtn", function() {
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
	$('#updateAdoptListSubmit').on("click", function() {
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
	$('body').on("click", ".confirmAdoptListBtn", function() {
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
	$('#confirmAdoptListSubmit').on("click",function() {
		$.ajax({
					type : "GET", //指定http參數傳輸格式為POST
					url : "sendEmail/${sessionScope.login_user.name}/${sessionScope.login_user.email}", //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
					beforeSend : function(xhr) {
									$('#loadingGIF').attr("style", " ");
									$('.confirmAdoptListBtn').attr("style","display:none");
								},
					success : function(response) {
								$('#loadingGIF').attr("style","display:none");
								$('.confirmAdoptListBtn').attr("style","");
								createtoast(response);
							},
					//Ajax失敗後要執行的function，此例為印出錯誤訊息
					error : function(xhr, ajaxOptions,thrownError) {
								createtoast("發生錯誤!!!");
							}
				});
		$('#confirmAdoptListModalCenter').modal("hide");
	})
	
	/*將進行中超過當前時間的領養單取消*/
	function cancelAdoptListBeforeNow() {
		$.ajax({
			type : "GET",
			url : "cancelAdoptListBeforeNow/${sessionScope.login_user.memberId}",
			dataType : "json",
			beforeSend : function(XMLHttpRequest) {
// 						console.log("gif");
                  },
			success : function(responses) {
// 			           console.log("cancelOK");
			          },
			error : function(xhr, ajaxOptions, thrownError) {
//			          console.log(xhr.status + "\n" + thrownError);
			        }
		});
	};
	
	/*搜尋全部表單內容(製作分頁按鈕)*/
	function createAdoptListPageBtn(adoptListTotal){
		let primaryBtn = '<button type="button" class="btn btn-primary" onclick="chooseAdoptListBtnVal(this)">';
		let secondaryBtn = '<button type="button" class="btn btn-secondary" onclick="chooseAdoptListBtnVal(this)">';
		
		let pagestr = "";
		if(adoptListTotal/pageLimit > 10){
			if(currentPage>6 && currentPage <= (adoptListTotal/pageLimit)-4){
				for(let i = currentPage-6 ; i < currentPage+4 ; i++){
					if(i == currentPage-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}else if(currentPage > (adoptListTotal/pageLimit)-4){
				for(let i = ((adoptListTotal/pageLimit)-10) ; i < (adoptListTotal/pageLimit) ; i++){
					if(i == currentPage-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}else{
				for(let i = 0 ; i < 10 ; i++){
					if(i == currentPage-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}
		}else{
			for(let i = 0 ; i < adoptListTotal/pageLimit ; i++){
				if(i == currentPage-1){
					pagestr+=primaryBtn+(i+1)+'</button>';		
				}else{
					pagestr+=secondaryBtn+(i+1)+'</button>';
				}
			}
		}
		
		$('.pageGroup').html(pagestr);
			
	}
	
	function chooseAdoptListBtnVal(e){	
		currentPage =  parseInt(e.innerText, 10);/*innerText 為 字串 須轉型成數字型態*/
		selectAllAdoptListMemberId();
	}

	/*小提示*/
	function createtoast(toaststr) {
		let str = "";
		str += '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="5000">'
				+ '	<div class="toast-header">'
				+ '		<strong class="mr-auto">小提示</strong>'
				+ '			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">'
				+ '			<span aria-hidden="true">&times;</span>'
				+ '		</button>'
				+ '	</div>'
				+ '	<div class="toast-body">'
				+ toaststr
				+ '	</div>' + '</div>';
		$('.littleWindow').html(str);
		$('.toast').toast('show');
		$('#adoptListDialog').modal('hide');
	}
	/*--------------------------------------------訂單--------------------------------------------*/
	var pageLimit = 10;
	var currentPage = 1; 
	
	/*顯示個人訂單*/
	function selectAllOrderListMemberId(){
		$.ajax({
			type:"GET",
			url:"order.getAllOrderListsMemberId/${sessionScope.login_user.memberId}"+"/"+pageLimit+"/"+currentPage,
			dataType : "json",
			beforeSend:function(XMLHttpRequest){
// 	            console.log(this); 
	        },
	        success:function(orderListsResource){
// 	            console.log(orderListsResource.orderLists); 

	        	writeHtml2(orderListsResource.orderLists);
	        	createPageBtn(orderListsResource.orderListTotal);
	        },
	        error:function(xhr, ajaxOptions, thrownError){
	        	alert(xhr.status + "\n" + thrownError);
	        }
		});
	}
	
	/*存心*/
	var formatter = new Intl.NumberFormat('en-IN', {
		maximumSignificantDigits: 3,
	});
	
	/*寫入表單內容*/
	function writeHtml2(orderLists){
		let tempList = '<table class="table table-hover table-striped" id="datatable">'
			+'<thead >'
			+'		<tr>'
			+ '			<th scope="col">訂單編號</th>' 
			+ '			<th scope="col">訂單已成立</th>'
			+ '			<th scope="col">訂單總金額(TWD)</th>'
			+ '			<th scope="col">訂單狀態</th>'
			+ '			<th scope="col">訂單詳情</th>'
			+ '		<tr>'
			+ '</thead>'
			+ '<tbody>';
		for (let i=0;i < orderLists.length;i++){
			let orderList = orderLists[i];
			tempList += '<tr>'
				+ '<td scope="row">'
				+ orderList.id
				+ '</td>'
				+ '<td>'
				+ orderList.createDate
				+ '</td>'
				+ '<td>'
				+ '$ &nbsp;'
				+ formatter.format(orderList.totalPrice)
				+ '</td>'
				+ '<td>'
				+ '<div>'
				+ orderList.orderStatus.description
				if(orderList.orderStatus.condition<3){
	 				tempList += '&nbsp;&nbsp;&nbsp;<a class="btn btn-outline-secondary btn-sm" href="javascript:;" role="button" id="orderStatus" data-toggle="modal" data-target="#updateOrderList">'
	 						 + ' 取消 </a>';
				}else{
					tempList += '&nbsp;&nbsp;&nbsp;<a class="btn btn-outline-secondary btn-sm" style="visibility: hidden;" href="javascript:;" role="button" id="orderStatus">'
						 + ' 取消 </a>';
				}
			tempList += '</div>'
				+ '</td>'
				+ '<td>'
				+ '<div class="orderDetailBox">'
				+ '<a class="btn btn-outline-info btn-sm" href="javascript:;" role="button" id="orderDetail" >'
				+ ' 詳細資訊</a>'
				+ '</div>'
				+ '</td>'
				+ '</tr>';
				
		}
		tempList += '</tbody></table>';
		$('.contentBox').html(tempList);
	}
	
	/*搜尋全部表單內容(製作分頁按鈕)*/
	function createPageBtn(orderListTotal){
		let primaryBtn = '<button type="button" class="btn btn-primary" onclick="chooseBtnVal(this)">';
		let secondaryBtn = '<button type="button" class="btn btn-secondary" onclick="chooseBtnVal(this)">';
		
		let pagestr = "";
		if(orderListTotal/pageLimit > 10){
			if(currentPage>6 && currentPage <= (orderListTotal/pageLimit)-4){
				for(let i = currentPage-6 ; i < currentPage+4 ; i++){
					if(i == currentPage-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}else if(currentPage > (orderListTotal/pageLimit-4)){
				for(let i = ((orderListTotal / pageLimit - 10)); i < (orderListTotal / pageLimit); i++){
					if(i == currentPage-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}else{
				for(let i = 0 ; i < 10 ; i++){
					if(i == currentPage-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}
		}else{
			for(let i = 0 ; i < orderListTotal/pageLimit ; i++){
				if(i == currentPage-1){
					pagestr+=primaryBtn+(i+1)+'</button>';		
				}else{
					pagestr+=secondaryBtn+(i+1)+'</button>';
				}
			}
		}
		
		$('.pageGroup').html(pagestr);
			
	}
	
	/*取得按鈕標籤內的值，並顯示當前頁數的內容*/
	function chooseBtnVal(e){	
		currentPage =  parseInt(e.innerText, 10);/*innerText 為 字串 須轉型成數字型態*/
		selectAllOrderListMemberId()
	}
	
	$('body').on("click","a#orderDetail",function(){
		//金額格式化
		let formatter = new Intl.NumberFormat('en-IN', {
			maximumSignificantDigits: 3,
		});
		let currentOrderId = parseInt($(this).parent().parent().parent().find('td').eq(0).text());
		//alert(currentOrderId);
		$.ajax({
			type : "GET",
			url :"order.selectById"+"/"+currentOrderId,   //後端的URL
			dataType : "json",       //response的資料格式
			success: function(orderLists) {
	            //console.log(orderLists);  //成功後回傳的資料
	         	let totalPrice=formatter.format(orderLists.totalPrice);
	            $('input#productAmount').val("$ "+totalPrice);
	            $('input#contact').val(orderLists.contact);
	            $('input#paymentType').val(orderLists.paymentType);
	            $('input#shippingType').val(orderLists.shippingType);
	            $('input#address').val(orderLists.address);
	            //備註判斷
	            if(orderLists.comment!="null"){
	          		  $('textarea#comment').text("## "+orderLists.comment);
				}else{
					 $('textarea#comment').val("無備註");
				}
	            if(orderLists.product1){
	            	$("div#MyProduct1").css("display","block");
	            	$("#img1").attr("src","orderImageToByte?path="+orderLists.product1.photo1);
	            	$("input#productName1").val(orderLists.product1.productName);
					let product1Price = formatter.format(orderLists.product1.price);
	            	$("input#productPrice1").val("$ "+product1Price);
					$("input#productQuota1").val(orderLists.productQua01);
	            }else{
	            	$("div#MyProduct1").css("display","none");
	            }
	            
	            if(orderLists.product2){
	            	$("div#MyProduct2").css("display","block");
	            	$("#img2").attr("src","orderImageToByte?path="+orderLists.product2.photo1);
	            	$("input#productName2").val(orderLists.product2.productName);
					let product2Price = formatter.format(orderLists.product2.price);
					$("input#productPrice2").val("$ "+product2Price);
					$("input#productQuota2").val(orderLists.productQua02);
	            }else{
	            	$("div#MyProduct2").css("display","none");
	            }
	            
	            if(orderLists.product3){
	            	$("div#MyProduct3").css("display","block");
	            	$("#img3").attr("src","orderImageToByte?path="+orderLists.product3.photo1);
	            	$("input#productName3").val(orderLists.product3.productName);
					let product3Price = formatter.format(orderLists.product3.price);
					$("input#productPrice3").val("$ "+product3Price);
	            	$("input#productQuota3").val(orderLists.productQua03);
	            }else{
	            	$("div#MyProduct3").css("display","none");
	            }
	            
	            if(orderLists.product4){
	            	$("div#MyProduct4").css("display","block");
	            	$("#img4").attr("src","orderImageToByte?path="+orderLists.product4.photo1);
	            	$("input#productName4").val(orderLists.product4.productName);
					let product4Price = formatter.format(orderLists.product4.price);
					$("input#productPrice4").val("$ "+product4Price);
	            	$("input#productQuota4").val(orderLists.productQua04);
	            }else{
	            	$("div#MyProduct4").css("display","none");
	            }
	            
	            if(orderLists.product5){
	            	$("div#MyProduct5").css("display","block");
	            	$("#img5").attr("src","orderImageToByte?path="+orderLists.product5.photo1);
	            	$("input#productName5").val(orderLists.product5.productName);
					let product5Price = formatter.format(orderLists.product5.price);
	            	$("input#productPrice5").val("$ "+product5Price);
					$("input#productQuota5").val(orderLists.productQua05);
	            }else{
	            	$("div#MyProduct5").css("display","none");
	            }
	            
	            //折扣判斷
	            if(orderLists.totalPrice<=160){
	            	$("input#productDiscount").css("font-size"," 15px");
	            	$("input#productDiscount").val("無折扣");
	            }else{
	            	$("input#productDiscount").css("font-size"," 18px");
	            	$("input#productDiscount").val("$ 60");
	            }
			}
		});
		
		$("#orderListDetails").modal("show");
 	})
 	
 	var currentOrderId;
 	$('body').on("click","#orderStatus",function(){
 		currentOrderId = parseInt($(this).parent().parent().parent().find('td').eq(0).text());
 		//console.log(currentOrderId);
 	});
 	
 	$('body').on("click","#updateOrderListSubmit",function(){
 		//console.log(currentOrderId);
 		$.ajax({
			type : "PUT",
			url :"order.updateOrderStatus"+"/"+currentOrderId,   //後端的URL
			dataType : "json",       //response的資料格式
			success: function(orderLists) {
//				console.log(orderLists.result);
				selectAllOrderListMemberId();
			},
			error : function(xhr, ajaxOptions, thrownError) {
//				console.log(xhr+" "+ajaxOptions+" "+thrownError);
			}
		});
 		
 		$("#updateOrderList").modal("hide");
 	})	
</script>
</html>