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
        form#orderListForm{
            font-size: 0.75em;
        }
    </style>
	
	<link href="assets/css/index-root.css" rel="stylesheet">
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
			$('.nav-item').eq(2).children().attr("class","nav-link active");
			
			$("body").on("click", "a:contains('more')", function () {
				
				var currentOrderId = parseInt($(this).parent().parent().find("th").eq(0).text());
				var xhr = new XMLHttpRequest();
				xhr.open("GET", ("<c:url value='/order.selectById'/>" + "/" + currentOrderId), true);
				xhr.send();
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4){
						if(xhr.status == 200){
							var orderList = JSON.parse(xhr.responseText);
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
							$("textarea#comment").text("## " + orderList.comment);
							//產品資訊為可變長度的欄位
							if(orderList.product1){
								$("div#MyProduct1").css("display","block");
								$("input#productId1").val(orderList.product1.id);
								$("input#productName1").val(orderList.product1.productName);
								$("input#productPrice1").val(orderList.product1.price);
								$("input#productQuota1").val(orderList.productQua01);	
							} else {
								$("div#MyProduct1").css("display","none");
							}
							if(orderList.product2){
								$("div#MyProduct2").css("display","block");
								$("input#productId2").val(orderList.product2.id);
								$("input#productName2").val(orderList.product2.productName);
								$("input#productPrice2").val(orderList.product2.price);
								$("input#productQuota2").val(orderList.productQua02);	
							} else {
								$("div#MyProduct2").css("display","none");
							}
							if(orderList.product3){
								$("div#MyProduct3").css("display","block");
								$("input#productId3").val(orderList.product3.id);
								$("input#productName3").val(orderList.product3.productName);
								$("input#productPrice3").val(orderList.product3.price);
								$("input#productQuota3").val(orderList.productQua03);	
							} else {
								$("div#MyProduct3").css("display","none");
							}
							if(orderList.product4){
								$("div#MyProduct4").css("display","block");
								$("input#productId4").val(orderList.product4.id);
								$("input#productName4").val(orderList.product4.productName);
								$("input#productPrice4").val(orderList.product4.price);
								$("input#productQuota4").val(orderList.productQua04);	
							} else {
								$("div#MyProduct4").css("display","none");
							}
							if(orderList.product5){
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
			
			$("body").on("click", "a:contains('狀態更新')", function () {
				
				var currentOrderId = parseInt($(this).parent().parent().find("th").eq(0).text());
				var hiddenInput = "<input type='hidden' id='currentOrderId' value='" + currentOrderId + "'>"
				var currentStatus = $(this).parent().find("div").eq(0).text();
				var xhr2 = new XMLHttpRequest();
				xhr2.open("Get", "<c:url value='/orderStatus.selectAll' />", true)
				xhr2.send();
				xhr2.onreadystatechange = function(){
					if(xhr2.readyState == 4){
						if(xhr2.status == 200){
							var jsConditions = JSON.parse(xhr2.responseText);
							$("div#modalConditionContent").empty();
							$("div#modalConditionContent").append(hiddenInput);
							for(let i = 0; i < jsConditions.length; i ++){
								let addRadio = "";
								if(jsConditions[i].description == currentStatus){
									addRadio = "<div class='form-check'><input class='form-check-input' type='radio' name='orderStatusRadios' id='"
												+ "condition" + jsConditions[i].condition
												+ "' value='"
												+ jsConditions[i].condition
												+ "' checked><label class='form-check-label' for='"
												+ "condition" + jsConditions[i].condition
												+ "'>"
												+ jsConditions[i].description
												+ "</label></div>";
								} else {
									addRadio = "<div class='form-check'><input class='form-check-input' type='radio' name='orderStatusRadios' id='"
												+ "condition" + jsConditions[i].condition
												+ "' value='"
												+ jsConditions[i].condition
												+ "'><label class='form-check-label' for='"
												+ "condition" + jsConditions[i].condition
												+ "'>"
												+ jsConditions[i].description
												+ "</label></div>";
								}
				                $("div#modalConditionContent").append(addRadio);
							}
							
							$("#changeOrderListStatus").modal("toggle");
						}
					}
				}
			});
			
			$("body").on("click", "div#changeOrderListStatus>div>div>div.modal-footer>button", function(){
				
				var statusNum = parseInt($("[name='orderStatusRadios']:checked").val());
				var currentOrderId = parseInt($("input#currentOrderId").val());
				var currentCondition = {"condition" : statusNum};
				var xhr = new XMLHttpRequest();
				xhr.open("PUT", ("<c:url value='/order.updateStatus'/>" + "/" + currentOrderId), true);
				xhr.setRequestHeader("Content-type", "application/json;charset=UTF-8");
				xhr.send(JSON.stringify(currentCondition));
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4){
						if(xhr.status == 200){
							let confirmChangeResult = JSON.parse(xhr.responseText);
							if(confirmChangeResult.result == "success"){
								$("div#changeOrderListStatus>div>div>div.modal-footer>button").remove();
								$("div#changeOrderListStatus>div>div>div.modal-footer").append(
										"<button type='button' class='btn btn-success' data-dismiss='modal'>更改成功</button>");
								$('#changeOrderListStatus').on('hidden.bs.modal', function(){
									window.location.reload();
								})
							}
						}
					}
				};
			});
		});

	</script>
	
</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow" w3-include-html="<c:url value='/addFrame.controller/rootheader' />"></nav>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" w3-include-html="<c:url value='/addFrame.controller/rootaside' />"></nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				
				<!-- ###置入本頁資訊### -->
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
					<h2>Order Manager</h2>
					<small>update : 2021/04/06</small>
				</div>
				<table class="table table-hover">
					<thead>
				    	<tr>
							<th scope="col">訂單編號</th>
				      		<th scope="col">訂單時間</th>
				     		<th scope="col">會員帳號</th>
				      		<th scope="col">配送方式</th>
				      		<th scope="col">總金額</th>
				      		<th scope="col">訂單備註</th>
				      		<th class="text-right" scope="col">訂單狀態</th>
				    	</tr>
					</thead>
					<tbody>
						<c:forEach items="${Lists}" var="orderList">
							<tr>
								<th scope="row">${orderList.id}</th>
								<td>${orderList.createDate}</td>
								<td>
									${orderList.member.account}
									<a class="bi bi-person-lines-fill text-secondary" href="javascript:;"></a>
								</td>
								<td>
									${orderList.paymentType}
									<a class="btn btn-outline-secondary btn-sm" href="javascript:;" role="button">more</a>
<!-- 									<a class="btn btn-outline-secondary btn-sm" href="/FurHouse/selectById/1" role="button">more</a> -->
								</td>
								<td>
									${orderList.totalPrice}
									<a class="bi bi-card-list text-secondary" href="<c:url value='/orderInDetails/${orderList.id}' />"></a>
								</td>
								<td>
									<p class="text-nowrap text-truncate bg-light text-dark" style="width: 10rem; font-size: 0.75em">${orderList.comment}</p>
								</td>
								<td class="text-right">
									<div>${orderList.orderStatus.description}</div>
									<a class="btn btn-outline-secondary btn-sm" href="javascript:;" role="button">狀態更新</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</main>
		</div>
	</div>
	<!-- Modal 訂單詳細資訊-->
	<div class="modal fade" id="orderListDetails" tabindex="-1" role="dialog" aria-labelledby="orderListDetailsLabel"
	     aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="orderListDetailsLabel">訂單詳細資訊</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <form id="orderListForm">
	                    <fieldset>
	                        <legend>訂單資訊</legend>
	                        <div class="form-group row">
	                            <label for="orderId" class="col-sm-2 col-form-label">訂單編號</label>
	                            <div class="col-sm-4">
	                                <input type="text" readonly class="form-control-plaintext" id="orderId"
	                                       value="...">
	                            </div>
	                            <label for="orderStatus" class="col-sm-2 col-form-label">訂單狀態</label>
	                            <div class="col-sm-4">
	                                <input type="text" readonly class="form-control-plaintext" id="orderStatus"
	                                       value="...">
	                            </div>
	                        </div>
	                        <div class="form-group row">
	                            <label for="createDate" class="col-sm-2 col-form-label">購買日期</label>
	                            <div class="col-sm-10">
	                                <input type="text" readonly class="form-control-plaintext" id="createDate"
	                                       value="...">
	                            </div>
	                        </div>
	                        <div class="form-group row">
	                            <label for="memberName" class="col-sm-2 col-form-label">購買人</label>
	                            <div class="col-sm-10">
	                                <input type="text" readonly class="form-control-plaintext" id="memberName"
	                                       value="...">
	                            </div>
	                        </div>
	                    </fieldset>
	                    <fieldset>
	                       	<legend>運送資訊</legend>
	                        <div class="form-group row">
	                            <label for="paymentType" class="col-sm-2 col-form-label">付款方式</label>
	                            <div class="col-sm-4">
	                                <input type="text" readonly class="form-control-plaintext" id="paymentType"
	                                       value="...">
	                            </div>
	                            <label for="shippingType" class="col-sm-2 col-form-label">運送單位</label>
	                            <div class="col-sm-4">
	                                <input type="text" readonly class="form-control-plaintext" id="shippingType"
	                                       value="...">
	                            </div>
	                        </div>
	                        <div class="form-group row">
	                            <label for="contact" class="col-sm-2 col-form-label">收件人</label>
	                            <div class="col-sm-10">
	                                <input type="text" readonly class="form-control-plaintext" id="contact"
	                                       value="...">
	                            </div>
	                        </div>
	                        <div class="form-group row">
	                            <label for="phone1" class="col-sm-2 col-form-label">連絡電話</label>
	                            <div class="col-sm-4">
	                                <input type="text" readonly class="form-control-plaintext" id="phone1"
	                                       value="...">
	                            </div>
	                            <label for="phone2" class="col-sm-2 col-form-label">備用電話</label>
	                            <div class="col-sm-4">
	                                <input type="text" readonly class="form-control-plaintext" id="phone2"
	                                       value="...">
	                            </div>
	                        </div>
	                        <div class="form-group row">
	                            <label for="address" class="col-sm-2 col-form-label">連絡地址</label>
	                            <div class="col-sm-10">
	                                <input type="text" readonly class="form-control-plaintext" id="address"
	                                       value="...">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label for="comment">訂單備註</label>
	                            <textarea class="form-control-plaintext" id="comment" rows="3"></textarea>
	                        </div>
	                    </fieldset>
	                    <fieldset>
	                        <legend>商品資訊</legend>
	                        <div id = "MyProduct1">
		                        <div class="form-group row">
		                            <label for="productId1" class="col-sm-2 col-form-label">商品編號</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productId1"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productName1" class="col-sm-2 col-form-label">商品名稱</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productName1"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productPrice1" class="col-sm-2 col-form-label">商品金額</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productPrice1"
		                                       value="...">
		                            </div>
		                            <label for="productQuota1" class="col-sm-2 col-form-label">商品數量</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productQuota1"
		                                       value="...">
		                            </div>
		                        </div>
	                        </div>
	                        <div id = "MyProduct2">
		                        <div class="form-group row">
		                            <label for="productId2" class="col-sm-2 col-form-label">商品編號</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productId2"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productName2" class="col-sm-2 col-form-label">商品名稱</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productName2"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productPrice2" class="col-sm-2 col-form-label">商品金額</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productPrice2"
		                                       value="...">
		                            </div>
		                            <label for="productQuota2" class="col-sm-2 col-form-label">商品數量</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productQuota2"
		                                       value="...">
		                            </div>
		                        </div>
	                        </div>
	                        <div id = "MyProduct3">
		                        <div class="form-group row">
		                            <label for="productId3" class="col-sm-2 col-form-label">商品編號</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productId3"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productName3" class="col-sm-2 col-form-label">商品名稱</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productName3"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productPrice3" class="col-sm-2 col-form-label">商品金額</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productPrice3"
		                                       value="...">
		                            </div>
		                            <label for="productQuota3" class="col-sm-2 col-form-label">商品數量</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productQuota3"
		                                       value="...">
		                            </div>
		                        </div>
	                        </div>
	                        <div id = "MyProduct4">
		                        <div class="form-group row">
		                            <label for="productId4" class="col-sm-2 col-form-label">商品編號</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productId4"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productName4" class="col-sm-2 col-form-label">商品名稱</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productName4"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productPrice4" class="col-sm-2 col-form-label">商品金額</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productPrice4"
		                                       value="...">
		                            </div>
		                            <label for="productQuota4" class="col-sm-2 col-form-label">商品數量</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productQuota4"
		                                       value="...">
		                            </div>
		                        </div>
	                        </div>
	                        <div id = "MyProduct5">
		                        <div class="form-group row">
		                            <label for="productId5" class="col-sm-2 col-form-label">商品編號</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productId5"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productName5" class="col-sm-2 col-form-label">商品名稱</label>
		                            <div class="col-sm-10">
		                                <input type="text" readonly class="form-control-plaintext" id="productName5"
		                                       value="...">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label for="productPrice5" class="col-sm-2 col-form-label">商品金額</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productPrice5"
		                                       value="...">
		                            </div>
		                            <label for="productQuota5" class="col-sm-2 col-form-label">商品數量</label>
		                            <div class="col-sm-4">
		                                <input type="text" readonly class="form-control-plaintext" id="productQuota5"
		                                       value="...">
		                            </div>
		                        </div>
	                        </div>
	                    </fieldset>
	                </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
	                <button type="button" class="btn btn-primary" disabled>列印訂單</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 訂單狀態變更的Modal -->
	<div class="modal fade" id="changeOrderListStatus" tabindex="-1" role="dialog" aria-labelledby="statusRadio" aria-hidden="true">
	    <div class="modal-dialog modal-sm" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="statusRadio">訂單狀態更新</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body" id = "modalConditionContent">
	            	
	            </div>
	            <div class="modal-footer">
                	<button type="button" class="btn btn-primary">確認</button>
            	</div>
        	</div>
    	</div>
	</div>
	
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
</body>
</html>