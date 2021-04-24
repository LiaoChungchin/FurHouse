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
<link rel="shortcut icon" href="assets/img/favicon.ico"
	type="image/x-icon">

<!-- Bootstrap CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-icons.css" rel="stylesheet">
<!-- User Define CSS -->
<link href="assets/css/bootstrap-datatables.min.css" rel="stylesheet" />

<style>
form#orderListForm {
	font-size: 0.75em;
	text-align: center;
}

.modal-title {
	color: #B20000;
}

/* 	表單標題樣式*/
.form-title {
	/* 	margin: 5px 20px 5px 12px; */
	padding: 12px;
	font-size: 20px;
	color: #FFFFA1;
	font-weight: bold;
	border-radius: 3px;
	background-color: #6A00B8;
}

.statustitle{
/* 	margin: 5px 20px 5px 12px; */
	margin: 10px 10px;
	padding: 14px;  
	font-size: 20px;
	color: #FFFFA1;
	font-weight: bold;
	border-radius: 3px;
	background-color: #6A00B8;
}

.form-group {
	margin: 10px;
}

/* 	表單欄位樣式 */
.col-form-label {
	margin-top: 10px;
	font-size: 14px;
	color: #000000;
	background-color: #DEDEDE;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
}

/* 	表單分隔線樣式 */
hr{
	border: 2px solid #F5E8FF;
}


/* 	表單內文樣式 */
.form-control-plaintext {
	font-size: 16px;
	font-weight: bold;
	color: #000000;
	margin: 10px;
}

/* 	表單內文備註滑鼠移入顯示全文樣式 */
.toolong {
	/*  	width: 120px; */
	width: 10rem;
	font-size: 0.75em white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.table thead{
	background-color: rgba(0, 0, 143, 0.8);
	color:#FAFAFA !important;
}

/* 	更改Bootstrap 懸停顏色 */
.table-hover tbody tr:hover, .table-hover tbody tr:hover td,
	.table-hover tbody tr:hover th {
	/* 	background: rgba(255, 243, 165) !important; */
	background: rgba(92, 102, 204, 0.2) !important;
	/* 	 color:#fff !important;  */
}

.list-group-item{
	border: none;
	font-size: 18px;
}


</style>

<link href="assets/css/index-root.css" rel="stylesheet">
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="assets/js/w3.js"></script>
<script src="assets/js/jQuery-3.6.0.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<!-- User Define JS -->
<script src="assets/js/bootstrap-datatables.min.js"></script>

<title>*ROOT*</title>
<!--http://localhost:8080/FurHouse/-->

<script>
	$(document)
			.ready(
					function() {
						// 匯入include所有語句
						w3.includeHTML();
						// 滑鼠移入顯示全文
						$(".toolong").on("mouseenter", function() {
							if (!this.title)
								this.title = $(this).text();
						});

						//------------------modal------------------
						//memberDetails
						$("body").on("click","a#memberDetail",function() {
							//alert("ok");
							var currentOrderId = parseInt($(this).parent().parent().find("th").eq(0).text());
							var xhr = new XMLHttpRequest();
							xhr.open("GET",("<c:url value='/order.selectById'/>"+ "/" + currentOrderId),true);
							xhr.send();
							xhr.onreadystatechange = function() {
								if (xhr.readyState == 4) {
									if (xhr.status == 200) {
										var orderList = JSON.parse(xhr.responseText);	
// 										console.log(xhr.responseText);
										$("input#memberNameV1").val(orderList.member.name);
 										//性別英轉中
										let tempGender = orderList.member.gender;
										if(tempGender === "male"){
											orderList.member.gender='男';
										}else if(tempGender === "female"){
											orderList.member.gender='女';
										}else{
											orderList.member.gender='未公開';
										}
										$("input#genderV1").val(orderList.member.gender);
										$("input#phoneV1").val(orderList.member.phone);
										$("input#emailV1").val(orderList.member.email);
										
									}
								$("#memberDetails").modal("show");
								}
							}
						});

						//orderListDetails
						$("body").on("click","a:contains('more')",function() {
							var currentOrderId = parseInt($(this).parent().parent().find("th").eq(0).text());
							var xhr2 = new XMLHttpRequest();
							xhr2.open("GET",("<c:url value='/order.selectById'/>"+ "/" + currentOrderId),true);
							xhr2.send();
							xhr2.onreadystatechange = function() {
								if (xhr2.readyState == 4) {
									if (xhr2.status == 200) {
										var orderList = JSON.parse(xhr2.responseText);
// 										console.log(xhr2.responseText);
										$("input#orderId").val(orderList.id.toString());
										$("input#orderStatus").val(orderList.orderStatus.description);
										$("input#createDate").val(orderList.createDate);
										$("input#memberName").val(orderList.member.name);
										$("input#paymentType").val(orderList.paymentType);
										$("input#shippingType").val(orderList.shippingType);
										$("input#contact").val(orderList.contact);
										$("input#phone1").val(orderList.phone1);
										$("input#phone2").val(orderList.phone2);
										$("input#address").val(orderList.address);
										$("textarea#comment").text("## "+ orderList.comment);
										//產品資訊為可變長度的欄位	
										
										if (orderList.product1) {
											$("div#MyProduct1").css("display","block");
											$("input#productId1").val(orderList.product1.id);
											$("input#productName1").val(orderList.product1.productName);
											$("input#productPrice1").val(orderList.product1.price);
											$("input#productQuota1").val(orderList.productQua01);
										} else {
											$("div#MyProduct1").css("display","none");
										}
										
										if (orderList.product2) {
											$("div#MyProduct2").css("display","block");
											$("input#productId2").val(orderList.product2.id);
											$("input#productName2").val(orderList.product2.productName);
											$("input#productPrice2").val(orderList.product2.price);
											$("input#productQuota2").val(orderList.productQua02);
										} else {
											$("div#MyProduct2").css("display","none");
										}
														
										if (orderList.product3) {
											$("div#MyProduct3").css("display","block");
											$("input#productId3").val(orderList.product3.id);
											$("input#productName3").val(orderList.product3.productName);
											$("input#productPrice3").val(orderList.product3.price);
											$("input#productQuota3").val(orderList.productQua03);
										} else {
											$("div#MyProduct3").css("display","none");
										}
													
										if (orderList.product4) {
											$("div#MyProduct4").css("display","block");
											$("input#productId4").val(orderList.product4.id);
											$("input#productName4").val(orderList.product4.productName);
											$("input#productPrice4").val(orderList.product4.price);
											$("input#productQuota4").val(orderList.productQua04);
										} else {
											$("div#MyProduct4").css("display","none");
										}
														
										if (orderList.product5) {
											$("div#MyProduct5").css("display","block");
											$("input#productId5").val(orderList.product5.id);
											$("input#productName5").val(orderList.product5.productName);
											$("input#productPrice5").val(orderList.product5.price);
											$("input#productQuota5").val(orderList.productQua05);
										} else {
											$("div#MyProduct5").css("display","none");
										}

										$("#orderListDetails").modal("show");
									}
								}
							};
 						});

						//金額詳請控制 amountDetails
						$("body").on("click", "a#amountDetail", function() {
							//alert("ok");
							var currentOrderId = parseInt($(this).parent().parent().find("th").eq(0).text());
							var xhr3 = new XMLHttpRequest();
							xhr3.open("GET",("<c:url value='/order.selectById'/>"+ "/" + currentOrderId),true);
							xhr3.send();
							xhr3.onreadystatechange = function(){
							if (xhr3.readyState == 4){
								if (xhr3.status == 200){
 								var orderList = JSON.parse(xhr3.responseText);
									console.log(xhr3.responseText);
									
									if (orderList.product1) {
										$("hr#amountV1").css("display","block");
										$("div#amountProduct1").css("display","block");
										$("input#amountProductId1").val(orderList.product1.id);
										$("input#amountProductName1").val(orderList.product1.productName);
										$("input#amountProductCount1").val(orderList.productQua01);
										$("input#amountProductPrice1").val(orderList.product1.price);
									} else {
										$("hr#amountV1").hide();
										$("div#amountProduct1").hide();
									}
									if (orderList.product2) {
										$("hr#amountV2").css("display","block");
										$("div#amountProduct2").css("display","block");
										$("input#amountProductId2").val(orderList.product2.id);
										$("input#amountProductName2").val(orderList.product2.productName);
										$("input#amountProductCount2").val(orderList.productQua02);
										$("input#amountProductPrice2").val(orderList.product2.price);
									} else {
										$("hr#amountV2").hide();
										$("div#amountProduct2").hide();
									}
									if (orderList.product3) {
										$("hr#amountV3").css("display","block");
										$("div#amountProduct3").css("display","block");
										$("input#amountProductId3").val(orderList.product3.id);
										$("input#amountProductName3").val(orderList.product3.productName);
										$("input#amountProductCount3").val(orderList.productQua03);
										$("input#amountProductPrice3").val(orderList.product3.price);
									} else {
										$("hr#amountV3").hide();
										$("div#amountProduct3").hide();
									}
									if (orderList.product4) {
										$("hr#amountV4").css("display","block");
										$("div#amountProduct4").css("display","block");
										$("input#amountProductId4").val(orderList.product4.id);
										$("input#amountProductName4").val(orderList.product4.productName);
										$("input#amountProductCount4").val(orderList.productQua04);
										$("input#amountProductPrice4").val(orderList.product4.price);
									} else {
										$("hr#amountV4").hide();
										$("div#amountProduct4").hide();
									}		
									if (orderList.product5) {
										$("hr#amountV5").css("display","block");
										$("div#amountProduct5").css("display","block");
										$("input#amountProductId5").val(orderList.product5.id);
										$("input#amountProductName5").val(orderList.product5.productName);
										$("input#amountProductCount5").val(orderList.productQua05);
										$("input#amountProductPrice5").val(orderList.product5.price);
									} else {
										$("hr#amountV5").hide();
										$("div#amountProduct5").hide();
									}
										
									$("input#productDiscount").val("60");
									$("input#productAmount").val(orderList.totalPrice);
										
									}
									$("#amountDetails").modal("show");
								}
							}
						});

						//orderStatus
						$("body").on("click","a:contains('狀態更新')",function() {
							var currentOrderId = parseInt($(this).parent().parent().find("th").eq(0).text());
							var hiddenInput = "<input type='hidden' id='currentOrderId' value='" + currentOrderId + "'>"
							var currentStatus = $(this).parent().find("div").eq(0).text();
							var xhr4 = new XMLHttpRequest();
							xhr4.open("Get","<c:url value='/orderStatus.selectAll' />",true)
							xhr4.send();
							xhr4.onreadystatechange = function() {
							if (xhr4.readyState == 4) {
								if (xhr4.status == 200) {
									var jsConditions = JSON.parse(xhr4.responseText);
									$("div#modalConditionContent").empty();
									$("div#modalConditionContent").append(hiddenInput);
										for (let i = 0; i < jsConditions.length; i++) {
											let addRadio = "";
											if (jsConditions[i].description == currentStatus) {
												addRadio ="<div class='form-check list-group'>"
												+"<label class='form-check-label list-group-item' for='"
												+ "condition" 
												+ jsConditions[i].condition
												+ "'>"
												+"<input class='form-check-input' type='radio' name='orderStatusRadios' id='"
												+ "condition" + jsConditions[i].condition
												+ "' value='"
												+ jsConditions[i].condition
												+ "' checked>"
												+ jsConditions[i].description
												+ "</label>"
												+"</div>";
											} else {
												addRadio = "<div class='form-check list-group'>"
												+"<label class='form-check-label list-group-item' for='"
												+ "condition" 
												+ jsConditions[i].condition
												+ "'>"
												+"<input class='form-check-input' type='radio' name='orderStatusRadios' id='"
												+ "condition" + jsConditions[i].condition
												+ "' value='"
												+ jsConditions[i].condition
												+ "'>"
												+ jsConditions[i].description
												+ "</label>"
												+"</div>";
											}
											$("div#modalConditionContent").append(addRadio);
										}
										$("#changeOrderListStatus").modal("toggle");
													}
												}
											}
										});

						$("body").on("click","div#changeOrderListStatus>div>div>div.modal-footer>button",function() {
							var statusNum = parseInt($("[name='orderStatusRadios']:checked").val());
							var currentOrderId = parseInt($("input#currentOrderId").val());
							var currentCondition = {"condition" : statusNum};
							var xhr2 = new XMLHttpRequest();
							xhr2.open("PUT",("<c:url value='/order.updateStatus'/>"+ "/" + currentOrderId),true);
							xhr2.setRequestHeader("Content-type","application/json;charset=UTF-8");
							xhr2.send(JSON.stringify(currentCondition));
							xhr2.onreadystatechange = function() {
								if (xhr2.readyState == 4) {
									if (xhr2.status == 200) {
										let confirmChangeResult = JSON.parse(xhr2.responseText);
										if (confirmChangeResult.result == "success") {
										$("div#changeOrderListStatus>div>div>div.modal-footer>button").remove();
										$("div#changeOrderListStatus>div>div>div.modal-footer").append("<button type='button' class='btn btn-success' data-dismiss='modal'>更改成功</button>");
										$('#changeOrderListStatus').on('hidden.bs.modal',function() {window.location.reload();})
										}
									}
								}
							};
						});
						
						
						$('#allOrdertb').DataTable({
								"language": {
										  "emptyTable":"無資料...",
										  "processing":"處理中...",
										  "loadingRecords":"載入中...",
										  "lengthMenu":"顯示 _MENU_ 項結果",
										  "zeroRecords":"沒有符合的結果",
										  "info":"顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
										  "infoEmpty":"顯示第 0 至 0 項結果，共 0 項",
										  "infoFiltered":"(從 _MAX_ 項結果中過濾)",
										  "infoPostFix":"",
										  "search":"搜尋:",
										  "paginate":{
										    "first":"第一頁",
										    "previous":"上一頁",
										    "next":"下一頁",
										    "last":"最後一頁"
										  },
										  "aria": {
											    "sortAscending": ": 升冪排列",
											    "sortDescending": ": 降冪排列"
											  }
								}
						});
						
					});
</script>

</head>
<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow"
		w3-include-html="<c:url value='/addFrame.controller/rootheader' />"></nav>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar"
				w3-include-html="<c:url value='/addFrame.controller/rootaside' />"></nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

				<!-- ###置入本頁資訊### -->
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
					<h2>Order Manager</h2>
					<small>update : 2021/4/10</small>
				</div>
				<table class="table table-hover table-striped " id="allOrdertb">
					<thead class="indigo white-text">
						<tr>
							<th scope="col">訂單編號</th>
							<th scope="col">訂單時間</th>
							<th scope="col">會員帳號</th>
							<th scope="col">配送方式</th>
							<th scope="col">總金額(TWD)</th>
							<th scope="col">訂單備註</th>
							<th class="text-right" scope="col">訂單狀態</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${Lists}" var="orderList">
							<tr>
								<th scope="row">${orderList.id}</th>
								<td>${orderList.createDate}</td>
								<td>${orderList.member.account}&nbsp;&nbsp;<a
									id="memberDetail"
									class="bi bi-person-lines-fill text-secondary"
									href="javascript:;"></a>
								</td>
								<td>${orderList.paymentType}&nbsp;&nbsp;&nbsp;<a
									class="btn btn-outline-secondary btn-sm" href="javascript:;"
									role="button">more</a>
								</td>
								<td>&nbsp;${orderList.totalPrice}&nbsp;&nbsp;&nbsp;<a
									id="amountDetail" class="bi bi-card-list text-secondary"
									href="javascript:;"></a>
								</td>
								<td>
									<p class="text-nowrap text-truncate text-dark toolong">${orderList.comment}</p>
								</td>
								<td class="text-right">
									<div>${orderList.orderStatus.description}</div> <a
									class="btn btn-outline-secondary btn-sm" href="javascript:;"
									role="button">狀態更新</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</main>
		</div>
	</div>

	<!-- Modal 訂單詳細資訊-->
	<div class="modal fade" id="orderListDetails" tabindex="-1"
		role="dialog" aria-labelledby="orderListDetailsLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<h3 class="modal-title" id="orderListDetailsLabel">&nbsp;&nbsp;訂單詳細資訊</h3> -->
					<h3 class="modal-title" id="orderListDetailsLabel"></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="orderListForm">
						<br>
						<fieldset>
							<legend class="form-title">訂單資訊</legend>
							<div class="form-group row">
								<label for="orderId" class="col-sm-2 col-form-label">訂單編號</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext"
										id="orderId" value="...">
								</div>
								<label for="orderStatus" class="col-sm-2 col-form-label">訂單狀態</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext"
										id="orderStatus" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="createDate" class="col-sm-2 col-form-label">購買日期</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control-plaintext"
										id="createDate" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="memberName" class="col-sm-2 col-form-label">購買人</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control-plaintext"
										id="memberName" value="...">
								</div>
							</div>
						</fieldset>
						<br>
						<fieldset>
							<legend class="form-title">運送資訊</legend>
							<div class="form-group row">
								<label for="contact" class="col-sm-2 col-form-label">收件人</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control-plaintext"
										id="contact" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="paymentType" class="col-sm-2 col-form-label">付款方式</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext"
										id="paymentType" value="...">
								</div>
								<label for="shippingType" class="col-sm-2 col-form-label">運送單位</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext"
										id="shippingType" value="...">
								</div>
							</div>

							<div class="form-group row">
								<label for="phone1" class="col-sm-2 col-form-label">連絡電話</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext"
										id="phone1" value="...">
								</div>
								<label for="phone2" class="col-sm-2 col-form-label">備用電話</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext"
										id="phone2" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="address" class="col-sm-2 col-form-label">連絡地址</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control-plaintext"
										id="address" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="comment" class="col-sm-12 col-form-label">訂單備註</label>
								<textarea class="form-control-plaintext" id="comment" rows="3"></textarea>
							</div>
						</fieldset>
						<br>
						<fieldset>
							<legend class="form-title">商品資訊</legend>
							<c:forEach var="i" begin="1" end="5">
							<div id="MyProduct<c:out value="${i}"/>">
								<div class="form-group row">
									<label for="productId<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品編號</label>
									<div class="col-sm-10">
										<input type="text" readonly class="form-control-plaintext"
											id="productId<c:out value="${i}"/>" value="...">
									</div>
								</div>
								<div class="form-group row">
									<label for="productName<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品名稱</label>
									<div class="col-sm-10">
										<input type="text" readonly class="form-control-plaintext"
											id="productName<c:out value="${i}"/>" value="...">
									</div>
								</div>
								<div class="form-group row">
									<label for="productPrice<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品金額<br>(TWD)
									</label>
									<div class="col-sm-4">
										<input type="text" readonly class="form-control-plaintext"
											id="productPrice<c:out value="${i}"/>" value="...">
									</div>
								</div>
								<div class="form-group row">
		                            <label for="productQuota<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品數量</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productQuota<c:out value="${i}"/>"
		                                       value="...">
		                            </div>
								</div>
								<hr>
							</div>
 							</c:forEach>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
					<button type="button" class="btn btn-primary" disabled>列印訂單</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 訂單狀態變更的Modal -->
	<div class="modal fade" id="changeOrderListStatus" tabindex="-1"
		role="dialog" aria-labelledby="statusRadio" aria-hidden="true">
		<div class="modal-dialog modal-mg" role="document">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<h3 class="modal-title" id="statusRadio">訂單狀態更新</h3> -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="statustitle">訂單狀態更新</div>
				<div class="modal-body" id="modalConditionContent"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">確認</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal --會員基本資訊 -->
	<div class="modal fade" id="memberDetails" tabindex="-1" role="dialog"
		aria-labelledby="memberDetailsLabel" aria-hidden="true">
		<div class="modal-dialog modal-mg" role="document">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<h3 class="modal-title" id="memberDetailsLabel">會員基本訊息</h3> -->
					<h3 class="modal-title" id="memberDetailsLabel"></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="memberDetailsForm">
						<fieldset>
							<legend class="form-title">會員資訊</legend>
							<div class="form-group row">
								<label for="memberNameV1" class="col-sm-3 col-form-label">會員姓名</label>
								<div class="col-sm-5">
									<input type="text" readonly class="form-control-plaintext"
										id="memberNameV1" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="genderV1" class="col-sm-3 col-form-label">性別</label>
								<div class="col-sm-3">
									<input type="text" readonly class="form-control-plaintext"
										id="genderV1" value="...">
								</div>
							</div>
							<div class="form-group row">
								<label for="phoneV1" class="col-sm-3 col-form-label">手機號碼</label>
								<div class="col-sm-5">
									<input type="text" readonly class="form-control-plaintext"
										id="phoneV1" value="...">
								</div>
							</div>

							<div class="form-group row">
								<label for="emailV1" class="col-sm-3 col-form-label">信箱</label>
								<div class="col-sm-9">
									<input type="text" readonly class="form-control-plaintext"
										id="emailV1" value="...">
								</div>
							</div>

						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- Modal --總金額詳細資訊 -->
	<div class="modal fade" id="amountDetails" tabindex="-1" role="dialog"
		aria-labelledby="amountDetailsLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<h4 class="modal-title" id="amountDetailsLabel">金額詳細資訊</h4> -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="amountDetailsForm">
						<fieldset>
							<legend class="form-title">金額詳細資訊</legend>
							<c:forEach var="i" begin="1" end="5">
							<div id="amountProduct<c:out value="${i}"/>">
							<div class="form-group row">
								<label for="amountProductId<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品編號</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext" id="amountProductId<c:out value="${i}"/>" value="...">
								</div>
								<label for="amountProductPrice<c:out value="${i}"/>" class="col-sm-2 col-form-label">單價&nbsp;&nbsp;(TWD)</label>
 								<div class="col-sm-4">
 									<input type="text" readonly class="form-control-plaintext"
										id="amountProductPrice<c:out value="${i}"/>" value="...">
 								</div>
							</div>
							 <div class="form-group row">
  								<label for="amountProductName<c:out value="${i}"/>" class="col-sm-2 col-form-label">商品名稱</label>
 								<div class="col-sm-10">
 									<input type="text" readonly class="form-control-plaintext" 
  										id="amountProductName<c:out value="${i}"/>" value="...">
 								</div>
  								<label for="amountProductCount<c:out value="${i}"/>" class="col-sm-2 col-form-label">數量</label>
 								<div class="col-sm-4">
 									<input type="text" readonly class="form-control-plaintext"
  										id="amountProductCount<c:out value="${i}"/>" value="...">
 								</div>

 							</div>
 							<hr id="amountV<c:out value="${i}"/>">
 							</div>
 							
							</c:forEach>
							<div class="form-group row">
								<label for="productDiscount" class="col-sm-2 col-form-label">折扣&nbsp;&nbsp;(TWD)</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext"
										id="productDiscount" value="...">
								</div>
								<label for="productAmount" class="col-sm-2 col-form-label">總金額&nbsp;&nbsp;(TWD)</label>
								<div class="col-sm-4">
									<input type="text" readonly class="form-control-plaintext"
										id="productAmount" value="...">
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>



	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />">
	</footer>
</body>
</html>