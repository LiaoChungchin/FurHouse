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
	<link href="assets/css/root-page-typeBlue.css" rel="stylesheet">
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
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
					<h1 class="h2">寵物預約</h1>
					
				</div>
			
				<!-- 領養單資訊表格 -->
				<div class="supportCatDetail">
				
					<div class="d-flex mb-3">
						<div class="mr-auto p-2">
							<div class="form-inline">
						  		<label for="selectSearchMaxResult">顯示</label> 
						  		<select class="custom-select" id="selectSearchMaxResult" >
									<option value="10">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="1">1</option>
								</select>
								<label for="selectSearchMaxResult">筆</label>
							</div>
						</div>
						<div class="p-2">
							<select class="form-control" id="selectSearchType" >
								<option value="0">會員名字</option>
								<option value="1">貓編號</option>
								<option value="2">貓名</option>
								<option value="3">會員編號</option>
							</select>
						</div>
						<div class="p-2">
							<input type="text" class="form-control" id="rootSearch"  onkeyup="value=value.replace(/^[.!@#$%^&*]+$/,'') " >
						</div>
					</div>
					<img src="<c:url value="/assets/img/AdoptListLoading.gif" />"  class="loadingGIF" style="display:none;">
					<article class="supportCatDetailContent"></article>
					<div class="pageGroup d-flex justify-content-center"></div>	
				</div>
			</main>
			
			<!-- 領養單更新modal -->
			<div class="modal fade" id="setAdoptListStatusModalCenter" tabindex="-1" role="dialog" aria-labelledby="setAdoptListStatusModalCenter" aria-hidden="true">
				<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="setAdoptListStatusModalCenterTitle">更新狀態</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="/updateAdoptList" enctype="multipart/form-data" id="setAdoptListStatusForm">
								<input type="hidden" id="adoptListId" name="adoptListId">
								<input type="hidden" id="adoptListVisitTime" name="visitTime">
								<input type="hidden" id="adoptListCatId" name="catId">
								<input type="hidden" id="adoptListMemberId" name="memberId">
								
								<div class="form-check">
								    <input class="form-check-input" type="radio" name="adoptListStatusId" id="adoptListStatusId1" value="0">
								    <label class="form-check-label" for="adoptListStatusId1">
								    	取消
								    </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="adoptListStatusId" id="adoptListStatusId2" value="1">
									<label class="form-check-label" for="adoptListStatusId2">
									   	進行中
									</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="adoptListStatusId" id="adoptListStatusId3" value="2">
									<label class="form-check-label" for="adoptListStatusId3">
									   	完成
									</label>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" id="updateAdoptListSubmit">確認</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
	<script type="text/javascript">
		$(document).ready(function() {
			selectAllAdoptListPage();
		});
		var pageLimit = 10;
		var currentPage = 1; 
		var searchTypeUrl = "searchAllAdoptListMemberName/";
		
		/*設定顯示筆數*/
		$('#selectSearchMaxResult').on("change",function(){
			pageLimit = $("#selectSearchMaxResult").val();
			currentPage = 1; 
			selectAllAdoptListPage();
		});
		
		/*選擇查詢方式*/
		$("#selectSearchType").on("change",function(){
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
					selectAllAdoptListPage();
					break;
			}
		})
		
		/*模糊查詢*/
		$("#rootSearch").on("keyup",function(){
			let val = $("#rootSearch").val();
			if(val.length!=0){
				currentPage=1;
				actionchangsearch(val);
			}else{
				currentPage=1;
				selectAllAdoptListPage();
			}
		})
		
		/*模糊查詢function*/
		function actionchangsearch(val){
			$.ajax({
				type:"GET",
				url: searchTypeUrl+"/"+val+"/"+pageLimit+"/"+currentPage ,
				dataType: "json",
				success: function(adoptListsResource){
					if(adoptListsResource.adoptLists.length!=0){
						writeHtml(adoptListsResource.adoptLists);
						createPageBtn(adoptListsResource.adoptListTotal);
					}else{
						selectAllAdoptListPage();
					}
				},
				error:function(xhr, ajaxOptions, thrownError){
// 					console.log(xhr.status+"\n"+thrownError);
				}	
			});	
		}
		
		/*取得按鈕標籤內的值，並顯示當前頁數的內容*/
		function chooseBtnVal(e){	
			currentPage =  parseInt(e.innerText, 10);/*innerText 為 字串 須轉型成數字型態*/
			if($("#rootSearch").val().length != 0){
				actionchangsearch($("#rootSearch").val());
			}else{
				selectAllAdoptListPage();
			}
		}
		
		/*顯示分頁*/
		function selectAllAdoptListPage(){
			$.ajax({
				type:"GET",
				url: "selectAllAdoptListPage/"+pageLimit+"/"+currentPage,
				dataType: "json",
				beforeSend : function(xhr) {
					$('.loadingGIF').attr("style", " ");
				},
				success: function(adoptListsResource){
					$('.loadingGIF').attr("style","display:none");
					writeHtml(adoptListsResource.adoptLists);
					createPageBtn(adoptListsResource.adoptListTotal);
				},
				error:function(xhr, ajaxOptions, thrownError){
					$('.loadingGIF').attr("style","display:none");
					alert(xhr.status+"\n"+thrownError);
				}	
			});	
		}
		
		/*搜尋全部表單內容(製作分頁按鈕)*/
		function createPageBtn(adoptListTotal){
			let primaryBtn = '<button type="button" class="btn btn-primary" onclick="chooseBtnVal(this)">';
			let secondaryBtn = '<button type="button" class="btn btn-secondary" onclick="chooseBtnVal(this)">';
			
// 			console.log(currentPage);
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
		
		/*狀態更新*/
		
		
		
		/*刪除表單內容*/
// 		function deleteAdoptList(myObj){			
// 			let deleteid = myObj.parentNode.parentNode.childNodes[1].innerText;
// 			$.ajax({	 
//             	type:"GET",                    //指定http參數傳輸格式為POST
// 				url: "deleteAdoptList/"+deleteid,        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
// 				//Ajax成功後執行的function，response為回傳的值
//  				success : function(response){
// 					console.log(response);
// 					selectAllAdoptListPage();
//  				},
//  				//Ajax失敗後要執行的function，此例為印出錯誤訊息
//  				error:function(xhr, ajaxOptions, thrownError){
// 					alert(xhr.status+"\n"+thrownError);
// 				}
// 			});
// 		}
		
		/*寫入表單內容*/
		function writeHtml(adoptLists){
			let tempstr ='<table class="table table-hover table-striped">'+
						'	<thead>'+
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
						 '		<td><button type="button" class="btn btn-primary updateAdoptListBtn" data-toggle="modal" data-target="#setAdoptListStatusModalCenter">更新狀態</button></td>'+
						 '	</tr>';						 
			}
			tempstr+='</tbody></table>';
			$('.supportCatDetailContent').html(tempstr);
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
		    $('#adoptListMemberId').val(tempstr[4]);
		    if(tempstr[6] == "取消"){
		    	$('#adoptListStatusId1').prop("checked",true);
		    }else if(tempstr[6] == "進行中"){
		    	$('#adoptListStatusId2').prop("checked",true);
		    }else{
		    	$('#adoptListStatusId3').prop("checked",true);
		    }
		    
		})
		
		/*更新貓狀態*/
		$('#updateAdoptListSubmit').on("click",function(){
			$.ajax({
				type : "POST", //指定http參數傳輸格式為POST
				url : "updateAdoptList", //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
				data : $("#setAdoptListStatusForm").serializeArray(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之內含有name的物件value
				success : function(response) {
// 					console.log(response);
					selectAllAdoptListPage();
				},
				//Ajax失敗後要執行的function，此例為印出錯誤訊息
				error : function(xhr, ajaxOptions, thrownError) {
// 					console.log("更新狀態失敗!!!");
				}
			});
			$('#setAdoptListStatusModalCenter').modal("hide");	
		})
		
		
		/*暫時存放區*/
		/*搜尋全部表單內容(製作分頁按鈕)*/
// 		function createPageBtn(){
// 			let primaryBtn = '<button type="button" class="btn btn-primary" onclick="chooseBtnVal(this)">';
// 			let secondaryBtn = '<button type="button" class="btn btn-secondary" onclick="chooseBtnVal(this)">';
			
// 			$.ajax({
// 				type:"GET",
// 				url: "selectAllAdoptList",
// 				dataType: "json",
// 				success: function(adoptLists){
// 					console.log(currentPage);
// 					let pagestr = "";
// 					if(adoptLists.length/pageLimit > 10){
// 						if(currentPage>6 && currentPage <= (adoptLists.length/pageLimit)-4){
// 							console.log("btn2");
// 							for(let i = currentPage-6 ; i < currentPage+4 ; i++){
// 								if(i == currentPage-1){
// 									pagestr+=primaryBtn+(i+1)+'</button>';		
// 								}else{
// 									pagestr+=secondaryBtn+(i+1)+'</button>';
// 								}
// 							}
// 						}else if(currentPage > (adoptLists.length/pageLimit)-4){
// 							console.log("btn3");
// 							for(let i = ((adoptLists.length/pageLimit)-10) ; i < (adoptLists.length/pageLimit) ; i++){
// 								if(i == currentPage-1){
// 									pagestr+=primaryBtn+(i+1)+'</button>';		
// 								}else{
// 									pagestr+=secondaryBtn+(i+1)+'</button>';
// 								}
// 							}
// 						}else{
// 							console.log("btn1");
// 							for(let i = 0 ; i < 10 ; i++){
// 								if(i == currentPage-1){
// 									pagestr+=primaryBtn+(i+1)+'</button>';		
// 								}else{
// 									pagestr+=secondaryBtn+(i+1)+'</button>';
// 								}
// 							}
// 						}
// 					}else{
// 						console.log("btn0");
// 						for(let i = 0 ; i < adoptLists.length/pageLimit ; i++){
// 							if(i == currentPage-1){
// 								pagestr+=primaryBtn+(i+1)+'</button>';		
// 							}else{
// 								pagestr+=secondaryBtn+(i+1)+'</button>';
// 							}
// 						}
// 					}
					
// 					$('.pageGroup').html(pagestr);
// 				},
// 				error:function(xhr, ajaxOptions, thrownError){
// 					alert(xhr.status+"\n"+thrownError);
// 				}	
// 			});	
// 		}
	</script>
</body>
</html>