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
			background-image :linear-gradient(rgba(252,252,252,0.8), rgba(252,252,252,0.8)), url(assets/img/member_bg.jpg); 
			background-size : 1440px 900px;
			background-position : right bottom;
			background-repeat : no-repeat;
			background-attachment : fixed;
		}
		
		h1 {
			margin-top : 300px;
		}
		
		.contentBox{
			margin: 30px auto;
			width: 80%;
			display:none;
			background-color: rgba(255,255,242,0.65)
		}
		
		.littleWindow{
			position: fixed;
			right: 20px;
			top: 200px;
		}
		
		.pageGroup2{
			margin:30px 0 50px 10px;
			text-align:center;
		}
		
		.pageGroup2 button{
			width: 45px;
			margin: 0px 2px;
		}
		
/* 		表單抬頭樣式 */
		.table thead{
/* 			background-color: rgba(0, 0, 143, 0.7); */
			background-color: rgba(243, 155, 39, 0.7);
			color:#FAFAFA !important;
		}
 		
 		/* 	更改Bootstrap 懸停顏色 */
		.table-hover tbody tr:hover, .table-hover tbody tr:hover td,
		.table-hover tbody tr:hover th {
 			background: rgba(0, 184, 0, 0.2) !important; 
			/* 	 color:#fff !important;  */
		}
		
		.modal-title#orderListDetailsLabel{
			color:#BD0000;
		}
		
		#form-title{
			margin-top:10px;
			background:#009494;
			color:#FAFAFA;
			font-size:18px;
			border-radius:5px;
		}
		
		.modal-hr{
		width: 80%;
		margin: 20px auto;
		border: 0;
 		height: 1px; 
		background: #ff9f99;
 		background-image: linear-gradient(to right, #ccc, #ff9f99, #ccc);
		}
		
		.formtitle{
			padding:10px;
			margin:10px 5px 10px 2px;
		}
		
		.orderType{
			margin:10px 10px 0 15px;
			padding-right:22px;
			border-radius:5px;
			background-color:rgba(153,183,183,0.5);
		}
		
		.plaintext{
			margin-top:10px;
		}
		
		#comment{
			padding:20px;
		}
		
		#modalConditionContent{
			margin:5px;
			text-align:center;
			font-size:18px;
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
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="member.myPage"><i class="bi bi-calendar-week-fill"></i> 預約紀錄</a>
			<a class="mx-1 p-2 text-dark text-decoration-none bg-warning shadow rounded" href="member.chat"><i class="bi bi-chat-left-dots-fill"></i> 客服視窗</a>
		</nav>
	</div>
	<div class="text-content">
		<h1 class="text-center font-weight-bolder">Hello ~</h1>
		<h2 class="mt-1 text-center text-muted font-weight-bolder">I'm Here...</h2>
	</div>
	<!--訂單詳細資訊 modal-->
	<div class="modal fade" id="orderListDetails" tabindex="-1"
		role="dialog" aria-labelledby="orderListDetailsLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="orderListDetailsLabel">&nbsp;&nbsp;訂單詳細資訊</h3>
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
					<h5 class="modal-title" id="updateOrderListTitle">確認取消訂單</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modalConditionContent">請再次確認是否取消訂單，或直接聯繫客服，謝謝您!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="updateOrderListSubmit">確認</button>
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
			$('.text-content').html('<div class="row contentBox"></div><div class="pageGroup2"></div>');
			$('.contentBox').attr("style","display:block;");
			currentPage2 = 1;
			selectAllOrderListMemberId()
			break;
		case 2:
			break;
		case 3:
			console.log("客服視窗")
			break;
		default:
			alert("無法辨識");
		}

	})
	
	
	/*-------------------訂單---------------------------------------------------------------*/
	var pageLimitt = 10;
	var currentPage2 = 1; 
	
	/*顯示個人訂單*/
	function selectAllOrderListMemberId(){
		$.ajax({
			type:"GET",
			url:"order.getAllOrderListsMemberId/${sessionScope.login_user.memberId}"+"/"+pageLimitt+"/"+currentPage2,
			dataType : "json",
			beforeSend:function(XMLHttpRequest){
	            console.log(this); 
	        },
	        success:function(orderListsResource){
	            console.log(orderListsResource.orderLists); 

	        	writeHtml(orderListsResource.orderLists);
	        	createPageBtn(orderListsResource.orderListTotal);
	        },
	        error:function(xhr, ajaxOptions, thrownError){
	        	alert(xhr.status + "\n" + thrownError);
	        }
		});
	}
	
	
	/*寫入表單內容*/
	function writeHtml(orderLists){
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
				+ '$'
				+ orderList.totalPrice
				+ '</td>'
				+ '<td>'
				+ '<div>'
				+ orderList.orderStatus.description
				if(orderList.orderStatus.condition<3){
	 				tempList += '&nbsp;&nbsp;&nbsp;<a class="btn btn-outline-secondary btn-sm" href="javascript:;" role="button" id="orderStatus" data-toggle="modal" data-target="#updateOrderList">'
	 						 + ' 更新 </a>';
				}else{
					tempList += '&nbsp;&nbsp;&nbsp;<a class="btn btn-outline-secondary btn-sm" style="visibility: hidden;" href="javascript:;" role="button" id="orderStatus">'
						 + ' 更新 </a>';
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
		let primaryBtn = '<button type="button" class="btn btn-info" onclick="chooseBtnVal(this)">';
		let secondaryBtn = '<button type="button" class="btn btn-secondary" onclick="chooseBtnVal(this)">';
		
		let pagestr = "";
		if(orderListTotal/pageLimitt > 10){
			if(currentPage2>6 && currentPage2 <= (orderListTotal/pageLimitt)-4){
				for(let i = currentPage2-6 ; i < currentPage2+4 ; i++){
					if(i == currentPage2-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}else if(currentPage2 > (orderListTotal/pageLimitt-4)){
				for(let i = ((orderListTotal/pageLimitt-10)) ; i <(orderListTotal/pageLimitt); i++){
					if(i == currentPage2-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}else{
				for(let i = 0 ; i < 10 ; i++){
					if(i == currentPage2-1){
						pagestr+=primaryBtn+(i+1)+'</button>';		
					}else{
						pagestr+=secondaryBtn+(i+1)+'</button>';
					}
				}
			}
		}else{
			for(let i = 0 ; i < orderListTotal/pageLimitt ; i++){
				if(i == currentPage2-1){
					pagestr+=primaryBtn+(i+1)+'</button>';		
				}else{
					pagestr+=secondaryBtn+(i+1)+'</button>';
				}
			}
		}
		
		$('.pageGroup2').html(pagestr);
			
	}
	
	/*取得按鈕標籤內的值，並顯示當前頁數的內容*/
	function chooseBtnVal(e){	
		currentPage2 =  parseInt(e.innerText, 10);/*innerText 為 字串 須轉型成數字型態*/
		selectAllOrderListMemberId()
	}
	
	
	$('body').on("click","a#orderDetail",function(){
		let currentOrderId = parseInt($(this).parent().parent().parent().find('td').eq(0).text());
		//alert(currentOrderId);
		$.ajax({
			type : "GET",
			url :"order.selectById"+"/"+currentOrderId,   //後端的URL
			dataType : "json",       //response的資料格式
			success: function(orderLists) {
	            console.log(orderLists);  //成功後回傳的資料
	            $('input#productAmount').val(orderLists.totalPrice);
	            $('input#contact').val(orderLists.contact);
	            $('input#paymentType').val(orderLists.paymentType);
	            $('input#shippingType').val(orderLists.shippingType);
	            $('input#address').val(orderLists.address);
	            $('textarea#comment').text("## "+orderLists.comment);
	            
	            if(orderLists.product1){
	            	$("div#MyProduct1").css("display","block");
	            	$("#img1").attr("src","orderImageToByte?path="+orderLists.product1.photo1);
	            	$("input#productName1").val(orderLists.product1.productName);
					$("input#productPrice1").val(orderLists.product1.price);
					$("input#productQuota1").val(orderLists.productQua01);
	            }else{
	            	$("div#MyProduct1").css("display","none");
	            }
	            
	            if(orderLists.product2){
	            	$("div#MyProduct2").css("display","block");
	            	$("#img2").attr("src","orderImageToByte?path="+orderLists.product2.photo1);
	            	$("input#productName2").val(orderLists.product2.productName);
					$("input#productPrice2").val(orderLists.product2.price);
					$("input#productQuota2").val(orderLists.productQua02);
	            }else{
	            	$("div#MyProduct2").css("display","none");
	            }
	            
	            if(orderLists.product3){
	            	$("div#MyProduct3").css("display","block");
	            	$("#img3").attr("src","orderImageToByte?path="+orderLists.product3.photo1);
	            	$("input#productName3").val(orderLists.product3.productName);
					$("input#productPrice3").val(orderLists.product3.price);
					$("input#productQuota3").val(orderLists.productQua03);
	            }else{
	            	$("div#MyProduct3").css("display","none");
	            }
	            
	            if(orderLists.product4){
	            	$("div#MyProduct4").css("display","block");
	            	$("#img4").attr("src","orderImageToByte?path="+orderLists.product4.photo1);
	            	$("input#productName4").val(orderLists.product4.productName);
					$("input#productPrice4").val(orderLists.product4.price);
					$("input#productQuota4").val(orderLists.productQua04);
	            }else{
	            	$("div#MyProduct4").css("display","none");
	            }
	            
	            if(orderLists.product5){
	            	$("div#MyProduct5").css("display","block");
	            	$("#img5").attr("src","orderImageToByte?path="+orderLists.product5.photo1);
	            	$("input#productName5").val(orderLists.product5.productName);
					$("input#productPrice5").val(orderLists.product5.price);
					$("input#productQuota5").val(orderLists.productQua05);
	            }else{
	            	$("div#MyProduct5").css("display","none");
	            }
	            
	            $("input#productDiscount").val("60");
	            
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
				console.log(orderLists.result);
				selectAllOrderListMemberId();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				console.log(xhr+" "+ajaxOptions+" "+thrownError);
			}
		});
 		
 		$("#updateOrderList").modal("hide");
 	})
 	
</script>

</html>