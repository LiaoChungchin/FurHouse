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
		.supportCatDetail{
			width:90%;
			margin:5px auto;
		}
		.supportCatDetailHeader{
			margin-right:0px;
		}	
		.adoptListDelete{
			width:200px;
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
		$(document).ready(function() {
			// 匯入include所有語句
			w3.includeHTML();
			
			$('.nav-item').children().attr("class","nav-link");
			$('.nav-item').eq(6).children().attr("class","nav-link active");
		});
	</script>
	
</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow" w3-include-html="<c:url value='/addFrame.controller/rootheader' />"></nav>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" w3-include-html="<c:url value='/addFrame.controller/rootaside' />"></nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">AdoptListPage</h1>
					
				</div>
			
				<!-- 領養單資訊表格 -->
				<div class="supportCatDetail">
					<div class="form-group row float-right supportCatDetailHeader">
						<select class="form-control col-sm-6" id="selectSearchType">
							<option value="0">會員名字</option>
							<option value="1">貓編號</option>
							<option value="2">貓名</option>
							<option value="3">會員編號</option>
						</select>
						<input type="text" class="form-control col-sm-6 rootSearch" id="rootSearch">
					</div>
					<article class="supportCatDetailContent"></article>	
				</div>
				
			</main>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
	<script type="text/javascript">
		$(document).ready(function() {
			selectAllAdoptList();
		});
		
		var searchTypeUrl = "searchAllAdoptListMemberName/";
		
		$("#selectSearchType").on("change",function(){
			console.log($("#selectSearchType").val())
			switch($("#selectSearchType").val()){
				case "0": 
					searchTypeUrl = "searchAllAdoptListMemberName/";
					break;
				case "1": 
					searchTypeUrl = "searchAllAdoptListCatId/";
					break;
				case "2": 
					searchTypeUrl = "searchAllAdoptListCatNickname/";
					break;
				case "3": 
					searchTypeUrl = "searchAllAdoptListMemberId/";
					break;
				default:
					selectAllAdoptList();
					break;
			}
			console.log(searchTypeUrl);
		})
		
		$("#rootSearch").on("keyup",function(){
			console.log(searchTypeUrl);
			let val = $("#rootSearch").val();
			if(val.length!=0){
				$.ajax({
					type:"GET",
					url: searchTypeUrl + val,
					dataType: "json",
					success: function(adoptLists){
						if(adoptLists.length!=0){
							writeHtml(adoptLists);
						}else{
							selectAllAdoptList();
						}
					},
					error:function(xhr, ajaxOptions, thrownError){
						console.log(xhr.status+"\n"+thrownError);
					}	
				});	
			}else{
				selectAllAdoptList();
			}
			
			
		})
		

		function selectAllAdoptList(){
			$.ajax({
				type:"GET",
				url: "selectAllAdoptList",
				dataType: "json",
				success: function(adoptLists){
					writeHtml(adoptLists);
				},
				error:function(xhr, ajaxOptions, thrownError){
					alert(xhr.status+"\n"+thrownError);
				}	
			});	
		}
		
		function deleteAdoptList(myObj){			
			let deleteid = myObj.parentNode.parentNode.childNodes[1].innerText;
			$.ajax({	 
            	type:"GET",                    //指定http參數傳輸格式為POST
				url: "deleteAdoptList/"+deleteid,        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
				//Ajax成功後執行的function，response為回傳的值
 				success : function(response){
					console.log(response);
					selectAllAdoptList();
 				},
 				//Ajax失敗後要執行的function，此例為印出錯誤訊息
 				error:function(xhr, ajaxOptions, thrownError){
					alert(xhr.status+"\n"+thrownError);
				}
			});
		}
		
		function writeHtml(adoptLists){
			let tempstr='<table class="table table-hover table-striped">'+
						'	<thead class="thead-light">'+
						'		<tr>'+
						'			<th scope="col">編號</th>'+
						'			<th scope="col">探望時間</th>'+
						'			<th scope="col">貓編號</th>'+
						'			<th scope="col">貓名</th>'+
						'			<th scope="col">會員編號</th>'+
						'			<th scope="col">會員名字</th>'+
						'			<th scope="col">狀態</th>'+
						'			<th scope="col">功能</th>'+
						'		</tr>'+
						'	</thead>'+
						'	<tbody>';
			for(let i = 0 ; i < adoptLists.length ; i++){
				let adoptList = adoptLists[i];
				tempstr+='	<tr>'+
						 '		<td scope="row">'+adoptList.id+'</td>'+
						 '		<td>'+adoptList.visitTime+'</td>'+
						 '		<td>'+adoptList.cat.id+'</td>'+
						 '		<td>'+adoptList.cat.nickname+'</td>'+
						 '		<td>'+adoptList.member.memberId+'</td>'+
						 '		<td>'+adoptList.member.name+'</td>'+
						 '		<td>'+adoptList.adoptListStatus.description+'</td>'+
						 '		<td><button type="button" class="btn btn-primary" onclick="deleteAdoptList(this)">刪除</button></td>'+
						 '	</tr>';						 
			}
			tempstr+='</tbody></table>';
			$('.supportCatDetailContent').html(tempstr);
		}
		
	</script>
</body>
</html>