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
		.container{max-width:1600px; margin:auto; padding-left:0px;}
		img{ max-width:100%;}
		.inbox_people {
		  background: #f8f8f8 none repeat scroll 0 0;
		  float: left;
		  overflow: hidden;
		  width: 30%;
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
/* 		.active_chat{ background:#ebebeb;} */
		.active_chat{ background : linear-gradient(to bottom, #f5f5f5 0%,#dcdcdc 100%);}
		.incoming_msg_img {
		  display: inline-block;
 		  width: 6%;
		  margin: 5px 0 0 0;
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
		  width: 70%;
		}
		 .sent_msg p {
		  background: #007bff none repeat scroll 0 0;
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
		  background: #007bff none repeat scroll 0 0;
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
/* 		.messaging { padding: 0 0 50px 0;} */
		.messaging { padding: 0 0 0 0;}
		.msg_history {
		  height: 516px;
		  overflow-y: auto;
		}
		.px-4 {
			padding-left : 0rem !important;
		}
		.broadcast {
			font-size : 12px;
		}
	</style>
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!-- User Define JS -->
	
	<title>*ROOT*</title>
	
	<script>
		var websocket = null;
		var msgLists = [];
		
		$(document).ready(function() {
			// 匯入include所有語句
			w3.includeHTML();
			
			$('.nav-item').children().attr("class","nav-link");
			$('.nav-item').eq(7).children().attr("class","nav-link active");
			
			if ("WebSocket" in window) {
				// var sendUser = document.getElementById("sendUser").value;
				// document.getElementById("sendUser").disabled = true;
				var sendUser = 0;
		        websocket = new WebSocket("ws://localhost:8080/FurHouse/chatToServer/" + sendUser);
		    } else {
		        alert("Not support Websocket")
		    }
		
		    websocket.onerror = function () {
		        document.getElementById("status").innerHTML = "error";
		    };
		
		    websocket.onopen = function (event) {
		        document.getElementById("status").innerHTML = "服務器連線成功";
		    }
		
		    websocket.onmessage = function (event) {
		        var msg = event.data;
		        if (event.data.indexOf("count") > -1) {
		            var data = msg.split(" : ");
		            document.getElementById("count").innerHTML = data[1] - 1; // 只顯示會員進線人數，不包含管理員本身
		        } else if(event.data.indexOf("broadcast!offlineUser : ") > -1) {
		        	var offlineUserId = msg.split(" : ");
// 		        	console.log("接收後台getBasicRemote().sendText(message) : offlineUserId = " + offlineUserId[1]);
		        	broadcastLeave(offlineUserId[1]);
		        } else if(event.data.indexOf("broadcast!inlineUser : ") > -1) {
		        	var inlineUserId = msg.split(" : ");
// 		        	console.log("接收後台getBasicRemote().sendText(message) : offlineUserId = " + inlineUserId[1]);
		        	broadcastEnter(inlineUserId[1]);
		        } else {
		        	msg = JSON.parse(msg);
// 		        	console.log("接收後台getBasicRemote().sendText(message) : " + JSON.stringify(msg));
		        	
			        if(!memberInLists(msg)){
			        	// 判斷是新增成員進入對話列表
		        		let member = {user:msg.sendUser, unreadMsgCount:0, nowTime:msg.talkTime};
			        	
			        	if(msg.isRead == "unread") {
				        	member.unreadMsgCount = 1;
			        	}
// 			        	console.log("當前新增信息的包裝成員 : " + JSON.stringify(member));
			        	msgLists.push(member);
// 			        	console.log("msgLists現在總成員 : " + msgLists);
			        	// 創建一個對話列表的標籤，但是不創建用戶 ID:0 的標籤
			        	if(msg.sendUser != 0){
				        	setInboxChatMember(member);
			        	}
				        // 加入對話泡泡框架
			        	$("div.mesgs").prepend("<div class='msg_history' id='showMsg" + msg.sendUser + "' style='display:none'></div>");
						// 塞進對應的對話泡泡中
						if(msg.sendUser != 0){
				        	setMessageDiv("server", msg);
						} else {
							// 將信息轉成管理員的回覆，包裝到用戶對話框中
							setMessageDiv("client",[msg.message, msg.toUser, msg.talkTime]);
						}
			        } else {
			        	// 或是更新對話列表
			        	let thisUnreadMsgCount = memberUnreadMsgCount(msg.sendUser);
			        	
			        	if(msg.isRead == "unread") {
			        		thisUnreadMsgCount = memberUnreadMsgCount(msg.sendUser) + 1;
			        	}
			        	if(memberRemoveFromList(msg.sendUser)) {
			        		
			        		let member_re = {user:msg.sendUser, unreadMsgCount:thisUnreadMsgCount, nowTime:msg.talkTime};
				        	msgLists.push(member_re);
			        	};
			        	if(thisUnreadMsgCount != 0){
				        	let UnreadMsgCountText = "有<span class='badge badge-pill badge-danger'>" + thisUnreadMsgCount + "</span>封未讀信息";
				        	let chooseTargetChartList = "h5:contains('用戶ID[" + msg.sendUser + "]')";
				        	$(chooseTargetChartList).parent().find("p").eq(0).html(UnreadMsgCountText);
			        	}
			        	// 塞進對應的對話泡泡中
						if(msg.sendUser != 0){
				        	setMessageDiv("server", msg);
						} else {
							// 將信息轉成管理員的回覆，包裝到用戶對話框中
							setMessageDiv("client",[msg.message, msg.toUser, msg.talkTime]);
						}
			        }
		        }
		    }
		
		    websocket.onclose = function () {
		        document.getElementById("status").innerHTML = "連線成功關閉";
		    }
		
		    window.onbeforeunload = function () {
		        websocket.close();
		    }
		    
		    // 點選特定用戶可以顯示專屬一對一對話視窗
		    $("body").on("click", "div.chat_list", function(){
		    	$(this).parent().children().removeClass("active_chat");
		    	$(this).addClass("active_chat");
		    	$(this).find("p").eq(0).text("沒有新的信息");
		    	let startIdx = $(this).text().indexOf("[");
		    	let endIdx = $(this).text().indexOf("]");
		    	let userId = $(this).text().slice(startIdx + 1, endIdx);
		    	$("div.msg_history").hide();
		    	let msg_history_showMsg = "div#showMsg" + userId;
		    	$(msg_history_showMsg).show();
		    	$(":input#toUser").val(userId);
		    	// 連接資料庫，將isRead更新為已讀
		    	$.get("<c:url value='/Talk.setRead' />/" + userId);
		    	// 清除msgLists的unreadMsgCount
		    	for(let i = 0; i < msgLists.length; i++){
// 		    		console.log(msgLists[i].user);
// 		    		console.log(msgLists[i].unreadMsgCount);
// 		    		console.log(msgLists[i].nowTime);
		    		if(msgLists[i].user == userId) {
		    			msgLists[i].unreadMsgCount = 0;
// 						console.log("成功重置userID[" + userId + "]的未讀信息數量");
					}
		    	}
		    	// scrollbar保持在最底部
				let thisScrollMainWindow = $(msg_history_showMsg).get(0);
			    thisScrollMainWindow.scrollTop = thisScrollMainWindow.scrollHeight;
		    });
		});
		
		function memberInLists(msg) {
			// "msg" needs to be an object
			if(msgLists.length == 0) {
// 				console.log("msgLists is empty.");
				return false;
			}
			for(let i = 0; i < msgLists.length; i++){
				if(msgLists[i].user == msg.sendUser) {
// 					console.log(msgLists[i].user);
// 		    		console.log(msgLists[i].unreadMsgCount);
// 		    		console.log(msgLists[i].nowTime);
// 					console.log(".inbox_chat has ths member msg.")
					return true;
				}
			}
// 			console.log(".inbox_chat dose not have this new member yet.");
			return false;
		}
		
		function memberUnreadMsgCount(userId) {
			for(let i = 0; i < msgLists.length; i++){
				if(msgLists[i].user == userId){
					return msgLists[i].unreadMsgCount;
				}
			}
			return 0;
		}
		
		function memberRemoveFromList(userId) {
			for(let i = 0; i < msgLists.length; i++){
				if(msgLists[i].user == userId){
					msgLists.splice(i, 1);
					return true;
				}
			}
			return false;
		}
		
		function setInboxChatMember(member) {
			// member = {user:Integer,unreadMsgCount:Integer,nowTime:String}
			if(member.unreadMsgCount != 0){
				let newChatMember = "<div class='chat_list'>"
									+ "<div class='chat_people'>"
									+ "<div class='chat_img'>"
									+ "<img src='member.getPhoto/" + member.user + "' alt=''/>"
									+ "</div>"
									+ "<div class='chat_ib'>"
									+ "<h5>"
									+ "用戶ID["
									+ member.user
									+ "]"
									+ "<span class='chat_date'>"
									+ member.nowTime
									+ "</span>"
									+ "</h5>"
									+ "<p>"
									+ "有"
									+ "<span class='badge badge-pill badge-danger'>"
									+ member.unreadMsgCount
									+ "</span>"
									+ "封未讀信息"
									+ "</p>"
									+ "</div></div></div>";
				$("div.inbox_chat").prepend(newChatMember);
			} else {
				let newChatMember = "<div class='chat_list'>"
									+ "<div class='chat_people'>"
									+ "<div class='chat_img'>"
									+ "<img src='member.getPhoto/" + member.user + "' alt=''/>"
									+ "</div>"
									+ "<div class='chat_ib'>"
									+ "<h5>"
									+ "用戶ID["
									+ member.user
									+ "]"
									+ "<span class='chat_date'>"
									+ member.nowTime
									+ "</span>"
									+ "</h5>"
									+ "<p>"
									+ "沒有新的信息"
									+ "</p>"
									+ "</div></div></div>";
				$("div.inbox_chat").prepend(newChatMember);
			}
		}
		
		function broadcastLeave(id) {
			let chooseElement = "div#showMsg" + id;
			let fillingMsg = "<div class='broadcast my-lg-1 bg-dark text-white text-center font-weight-lighter'>"
							+ new Date() 
							+" 離線客服 " 
							+ "</div>";
			$(chooseElement).append(fillingMsg);
		}
		
		function broadcastEnter(id) {
			let chooseElement = "div#showMsg" + id;
			let fillingMsg = "<div class='broadcast my-lg-1 bg-light text-dark text-center font-weight-lighter'>" 
							+ new Date() 
							+" 連線客服 " 
							+ "</div>";
			$(chooseElement).append(fillingMsg);
		}
		
		function setMessageDiv(type, msg) {
		    if(type === "client"){
		    	// clinet 的 msg 給的是數組 [message, toUser, talkTime(可能沒有)]
		    	function fillzeros(value){
		    		if(value < 9){
		    			return "0" + value;
		    		}
		    		return value;
		    	};
		    	
		    	let theTime; // 要輸出的時間，如果msg從資料庫抓的，會有時間；如果是當下send()的訊息，就需要加上當前時間戳
		    	
		    	if(msg[2] == null){
		    		
		    		theTime = new Date();
		    		theTime = (theTime.getFullYear()) 
			    				+ "-" 
			    				+ fillzeros((theTime.getMonth() + 1))
			    				+ "-" 
			    				+ fillzeros(theTime.getDate())
			    				+ " " 
			    				+ fillzeros(theTime.getHours()) 
			    				+ ":" 
			    				+ fillzeros(theTime.getMinutes())
			    				+ ":" 
			    				+ fillzeros(theTime.getSeconds());
		    	} else {
		    		theTime = msg[2];
		    	}
		    	
		    	let fillinMsg = "<div class='outgoing_msg'><div class='sent_msg'><p>"
		    					+ msg[0]
		    					+ "</p><span class='time_date'>"
		    					+ theTime
		    					+ "</span></div></div>";
		    	let chooseElement = "div#showMsg" + msg[1];
		    	$(chooseElement).append(fillinMsg);
		    	
		    	// scrollbar保持在最底部
		    	let whosDiv = "#showMsg" + msg[1];
				let thisScrollMainWindow = $(whosDiv).get(0);
			    thisScrollMainWindow.scrollTop = thisScrollMainWindow.scrollHeight;
				
		    	// 更新用戶列表(左側)的最新時間
		    	let chooseTargetChartList = "h5:contains('用戶ID[" + msg[1] + "]')";
	        	$(chooseTargetChartList).find("span").eq(0).text(theTime);
		    };
		    if(type === "server"){
		    	// server 的 msg 給的是 JSON
		    	let fillinMsg = "<div class='incoming_msg'>"
		    					+ "<div class='incoming_msg_img'>"
		    					+ "<img src='member.getPhoto/" + msg.sendUser + "' alt=''/>"
		    					+ "</div>"
		    					+ "<div class='received_msg'>"
		    					+ "<div class='received_withd_msg'>"
		    					+ "<p>"
		    					+ "<b>"
		    					+ "["
		    					+ "userID : "
		    					+ msg.sendUser
		    					+ "]&nbsp;"
		    					+ "</b>"
		    					+ msg.message
		    					+ "</p>"
		    					+ "<span class='time_date'>"
		    					+ msg.talkTime
		    					+ "</span></div></div></div>"
		    	let chooseElement = "div#showMsg" + msg.sendUser;
		    	$(chooseElement).append(fillinMsg);
		    	
		    	// scrollbar保持在最底部
		    	let whosDiv = "#showMsg" + msg.sendUser;
			    let thisScrollMainWindow = $(whosDiv).get(0);
			    thisScrollMainWindow.scrollTop = thisScrollMainWindow.scrollHeight;
		    	
		    	// 更新用戶列表(左側)的最新時間
		    	let chooseTargetChartList = "h5:contains('用戶ID[" + msg.sendUser + "]')";
	        	$(chooseTargetChartList).find("span").eq(0).text(msg.talkTime);
		    };
		};
		
		function closeWebSocket(){
			websocket.close();
		}
		
		function send() {
			
			if(document.getElementById("write_msg").value != ""){
				
			    var sendUser = 0 // 客服ID:0
			    var toUser = parseInt(document.getElementById("toUser").value);
				var message = document.getElementById("write_msg").value;
			    var jsonMsg = {"sendUser": sendUser, "toUser": toUser, "message": message}
			    websocket.send(JSON.stringify(jsonMsg));
			    
	// 		    console.log("送出的JSON字串 : " + JSON.stringify(jsonMsg));
			
			    setMessageDiv("client", [message, toUser, null]);
			    document.getElementById("write_msg").value = "";
			    
			 	// scrollbar保持在最底部
		    	let whosDiv = "#showMsg" + toUser;
			    let thisScrollMainWindow = $(whosDiv).get(0);
			    thisScrollMainWindow.scrollTop = thisScrollMainWindow.scrollHeight;
			};
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow" w3-include-html="<c:url value='/addFrame.controller/rootheader' />"></nav>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" w3-include-html="<c:url value='/addFrame.controller/rootaside' />"></nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h2 class="ml-lg-4">Message Box</h2>
					<small>update : 2021/04/30</small>
				</div>
				<div class="m-lg-2">連線狀態 : <span class="mr-5" id="status"></span>會員在線人數 : <span id="count"></span></div>
				<!-- ###置入本頁資訊### -->
				<div class="container">
					<div class="messaging">
						<div class="inbox_msg">
							<!-- 使用者列表 -->
							<div class="inbox_people">
								<div class="headind_srch">
									<div class="recent_heading">
										<h4>對話列表</h4>
									</div>
									<div class="srch_bar">
										<div class="stylish-input-group">
											<input type="text" class="search-bar" placeholder="Search">
											<span class="input-group-addon">
												<button type="button">
													<i class="bi bi-binoculars-fill"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
								<div class="inbox_chat">
								</div>
							</div>
							<!-- 信息視窗 -->
							<div class="mesgs">
								<div class="msg_history">
								</div>
								<div class="type_msg">
									<div class="input_msg_write">
										<input type="hidden" name="toUser" id="toUser" value="" />
										<input type="text" id="write_msg" placeholder="請輸入......" />
										<button class="msg_send_btn" onclick="send()">
											<i class="bi bi-chat-dots"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<footer class="pt-4 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
</body>
</html>