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
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!-- User Define JS -->
	
	<script type="text/javascript">
        var websocket = null;

		function login() {
		    if ('WebSocket' in window) {
		        var sendUser = document.getElementById("sendUser").value;
		        document.getElementById("sendUser").disabled = true;
		        websocket = new WebSocket("ws://localhost:8080/FurHouse/chatToServer/" + sendUser);
		    } else {
		        alert('Not support Websocket')
		    }
		
		    websocket.onerror = function () {
		        document.getElementById('status').innerHTML = "error";
		    };
		
		    websocket.onopen = function (event) {
		        document.getElementById('status').innerHTML = "服務器連線成功";
		    }
		
		    websocket.onmessage = function (event) {
		        var msg = event.data;
		        if (event.data.indexOf("count") > -1) {
		            var data = msg.split(" : ");
		            document.getElementById('count').innerHTML = data[1];
		        } else {
		        	console.log("接收後台getBasicRemote().sendText(message) : " + msg)
		            setMessageInnerHTML(event.data);
		        }
		    }
		
		    websocket.onclose = function () {
		        document.getElementById('status').innerHTML = "連線成功關閉";
		    }
		
		    window.onbeforeunload = function () {
		        websocket.close();
		    }
		}
		
		function setMessageInnerHTML(msg) {
		    document.getElementById('showMsg').value += (msg + "\n");
		}
		
		function closeWebSocket(){
			websocket.close();
		}
		
		function send() {
		    var sendUser = parseInt(document.getElementById("sendUser").value);
		    var toUser = parseInt(document.getElementById("toUser").value);
		    var message = document.getElementById("message").value;
		
		    var jsonMsg = {"sendUser": sendUser, "toUser": toUser, "message": message}
		    websocket.send(JSON.stringify(jsonMsg));
		    
		    console.log("送出的JSON字串 : " + JSON.stringify(jsonMsg));
		
		    document.getElementById("showMsg").value += (message + "\n\n");
		    document.getElementById("message").value = "";
		}
      
    </script>
    
	<title>FurHouse</title>
	
	<%-- EL接收session中的member bean有沒有認證過 --%>
	<c:if test="${loginErrorMsg != null}">
		<script>
			window.alert("${loginErrorMsg}");
		</script>
	</c:if>
</head>
<body>
	<div class="mt-5 ml-5">
	    <label for="sendUser" class="mr-2">登入ID : </label><input type="text" name="sendUser" id="sendUser"/>
	    <input type="button" id="login" value="登入" onclick="login()"/>
	    <input type="button" value="登出" onclick="closeWebSocket()"/>
	    <div>在線人數 : <span id="count"></span></div>
		<div>連線狀態 : <span id="status"></span></div>
	</div>
	<div class="mt-5 ml-5">
	    <label for="toUser" class="mr-2">客服ID : </label><input type="text" name="toUser" id="toUser"/><br/>
	    <br/>
	    <label for="showMsg">對話內容</label><br/>
	    <textarea rows="10" cols="15" id="showMsg" name="showMsg" readonly="readonly" style="width: 660px; height: 460px; background-color: azure"></textarea><br/>
	    <label for="message">傳送文字</label><br/>
	    <textarea rows="1" cols="15" id="message" name="sendMsg" style="width: 660px; height: 32px;"></textarea><br/>
	    <input type="button" value="send" onclick="send()"/>　
	    <input type="button" value="closeWebSocket" onclick="closeWebSocket()"/>
	</div>
</body>
</html>