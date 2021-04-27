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
		.container{max-width:1600px; margin-top:8rem;}
		img{max-width:100%;}
		.inbox_people {
		  background: #f8f8f8 none repeat scroll 0 0;
		  float: left;
		  overflow: hidden;
		  width: 25%;
		/* border-right:1px solid #c4c4c4; */
		}
		.inbox_msg {
		/* border: 1px solid #c4c4c4; */
		  clear: both;
		  overflow: hidden;
		}
		.top_spac{ margin: 20px 0 0;}
		.recent_heading {float: left; width:40%;}
		.srch_bar {
		  display: inline-block;
		  text-align: right;
		  width: 60%;
		}
		.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}
		.recent_heading h4 {
		  color: #05728f;
		  font-size: 21px;
		  margin: auto;
		}
		.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
		.srch_bar .input-group-addon button {
		  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
		  border: medium none;
		  padding: 0;
		  color: #707070;
		  font-size: 18px;
		}
		.srch_bar .input-group-addon { margin: 0 0 0 -27px;}
		.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
		.chat_ib h5 span{ font-size:13px; float:right;}
		.chat_ib p{ font-size:14px; color:#989898; margin:auto}
		.chat_img {
		  float: left;
		  width: 11%;
		}
		.chat_ib {
		  float: left;
		  padding: 0 0 0 15px;
		  width: 88%;
		}
		.chat_people{ overflow:hidden; clear:both;}
		.chat_list {
		  border-bottom: 1px solid #c4c4c4;
		  margin: 0;
		  padding: 18px 16px 10px;
		}
		.inbox_chat { height: 550px; overflow-y: scroll;}
		
		.active_chat{ background:#ebebeb;}
		.incoming_msg_img {
		  display: inline-block;
		  width: 6%;
		}
		.received_msg {
		  display: inline-block;
		  padding: 0 0 0 10px;
		  vertical-align: top;
		  width: 92%;
		 }
		 .received_withd_msg p {
		  background: #ebebeb none repeat scroll 0 0;
		  border-radius: 3px;
		  color: #646464;
		  font-size: 14px;
		  margin: 0;
		  padding: 5px 10px 5px 12px;
		  width: 100%;
		}
		.time_date {
		  color: #747474;
		  display: block;
		  font-size: 12px;
		  margin: 8px 0 0;
		}
		.received_withd_msg { width: 57%;}
		.mesgs {
		  float: left;
		  padding: 30px 15px 0 25px;
		  width: 75%;
		}
		 .sent_msg p {
		  background: #ffc107 none repeat scroll 0 0;
		  border-radius: 3px;
		  font-size: 14px;
		  margin: 0; color:#fff;
		  padding: 5px 10px 5px 12px;
		  width:100%;
		}
		.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
		.sent_msg {
		  float: right;
		  width: 46%;
		}
		.input_msg_write input {
		  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
		  border: medium none;
		  color: #4c4c4c;
		  font-size: 15px;
		  min-height: 48px;
		  width: 100%;
		}
		.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
		.msg_send_btn {
		  background: #ffc107 none repeat scroll 0 0;
		  border: medium none;
		  border-radius: 50%;
		  color: #fff;
		  cursor: pointer;
		  font-size: 17px;
		  height: 33px;
		  position: absolute;
		  right: 0;
		  top: 11px;
		  width: 33px;
		}
		.messaging { padding: 0 0 50px 0;}
		.msg_history {
		  height: 516px;
		  overflow-y: auto;
		}
		body {
			background-image : url(assets/img/member_bg.jpg);
			background-size : 1440px 900px;
			background-position : right bottom;
			background-repeat : no-repeat;
			background-attachment : fixed;
		}
	</style>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!-- User Define JS -->
	<script>
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
		    };
		    if(type === "server"){
		    	// server 的 msg 給的是 JSON
		    	let fillinMsg = "<div class='incoming_msg'>"
		    					+ "<div class='incoming_msg_img'>"
		    					+ "<img src='assets/img/user-profile.png' alt=''>"
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
		    };
		};
		
		function closeWebSocket(){
			websocket.close();
		};
		
		function send() {
		    var sendUser = parseInt(document.getElementById("sendUser").value);
		    var toUser = 0; // 在用戶端固定將信息回覆給管理員
		    var message = document.getElementById("write_msg").value;
		
		    var jsonMsg = {"sendUser": sendUser, "toUser": toUser, "message": message}
		    websocket.send(JSON.stringify(jsonMsg));
		    
// 		    console.log("送出的JSON字串 : " + JSON.stringify(jsonMsg));
			
			setMessageDiv("client", message);
		    document.getElementById("write_msg").value = "";
		};
	</script>
	
	<title>FurHouse</title>
	
</head>
<body>
	<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		<h2 class="my-0 mr-md-auto font-weight-normal">會員專區</h2>
		<a class="btn btn-outline-warning" href="<c:url value='/index'/>">返回首頁</a>
	</div>
	<div class="text-center mb-lg-5">
		<nav>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-file-earmark-person-fill"></i> 個人資料</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-bag-check-fill"></i> 我的訂單</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="javascript:;"><i class="bi bi-calendar-week-fill"></i> 預約紀錄</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded active" href="<c:url value='/member.chat'/>"><i class="bi bi-chat-left-dots-fill"></i> 客服視窗</a>
		</nav>
	</div>
	<div class="container">
		<div class="col col-lg-7">
		
			<div class="messaging pt-5">
				<div class="inbox_msg">
					<div class="mesgs">
						<div class="msg_history" id="showMsg">
							<!-- incoming_msg -->
							<div class="incoming_msg">
								<div class="incoming_msg_img">
									<img src="assets/img/user-profile.png"
										alt="">
								</div>
								<div class="received_msg">
									<div class="received_withd_msg">
										<p>很高興能夠為您服務...</p>
										<span class="time_date">2021-04-11 12:00:34</span>
									</div>
								</div>
							</div>
							<!-- outgoing_msg -->
<!-- 							<div class="outgoing_msg"> -->
<!-- 								<div class="sent_msg"> -->
<!-- 									<p>模板信息字段</p> -->
<!-- 									<span class="time_date">模板時間字段</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
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
<!-- 					對話紀錄，之後會配合資料庫保留紀錄實現 -->
<!-- 					<div class="inbox_people"> -->
<!-- 						<div class="headind_srch"> -->
<!-- 							<div class="recent_heading"> -->
<!-- 								<h4>Recent</h4> -->
<!-- 							</div> -->
<!-- 							<div class="srch_bar"> -->
<!-- 								<div class="stylish-input-group"> -->
<!-- 									<input type="text" class="search-bar" placeholder="Search"> -->
<!-- 									<span class="input-group-addon"> -->
<!-- 										<button type="button"> -->
<!-- 											<i class="bi bi-binoculars-fill"></i> -->
<!-- 										</button> -->
<!-- 									</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="inbox_chat"> -->
<!-- 							<div class="chat_list active_chat"> -->
<!-- 								<div class="chat_people"> -->
<!-- 									<div class="chat_img"> -->
<!-- 										<img src="assets/img/user-profile.png" -->
<!-- 											alt=""> -->
<!-- 									</div> -->
<!-- 									<div class="chat_ib"> -->
<!-- 										<h5> -->
<!-- 											Sunil Rajput <span class="chat_date">Dec 25</span> -->
<!-- 										</h5> -->
<!-- 										<p>Test, which is a new approach to have all solutions -->
<!-- 											astrology under one roof.</p> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="chat_list"> -->
<!-- 								<div class="chat_people"> -->
<!-- 									<div class="chat_img"> -->
<!-- 										<img src="assets/img/user-profile.png" -->
<!-- 											alt=""> -->
<!-- 									</div> -->
<!-- 									<div class="chat_ib"> -->
<!-- 										<h5> -->
<!-- 											Sunil Rajput <span class="chat_date">Dec 25</span> -->
<!-- 										</h5> -->
<!-- 										<p>Test, which is a new approach to have all solutions -->
<!-- 											astrology under one roof.</p> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>