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
<style>
.container {
	max-width: 960px;
}

form#product-list-formcheck {
	font-size: 0.75em;
}

.form-group {
	margin: 6px;
	padding: 3px;
	font-size: 18px;
	border-radius: 5px;
}



</style>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="assets/js/w3.js"></script>
<script src="assets/js/jQuery-3.6.0.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<!-- User Define JS -->
<script>
	$(document).ready(
			function() {
				// 遍歷清單，並且以Form型式加入畫面中
				jQuery.each(productsListJSON, function(idx, productEachObj) {
					// <div> root
					let aDiv = document.createElement("div");
					aDiv.setAttribute("class", "form-group row");
					// <div> - <div1> col-1 放圖片
					let b1Div = document.createElement("div");
					// b1Div.setAttribute("class", "col-md-1");
					b1Div.setAttribute("class", "col-md-2");
					let imgB1 = document.createElement("img");
					imgB1.setAttribute("src", productEachObj.imgSrc);
					imgB1.setAttribute("class", "img-fluid");
					b1Div.appendChild(imgB1);
					// <div> - <div2> col-7 放商品名稱
					let b2Div = document.createElement("div");
					//  b2Div.setAttribute("class", "col-md-7");
					b2Div.setAttribute("class", "col-md-5");
					let labelB2 = document.createElement("label");
					let textB2 = document.createTextNode(productEachObj.name);
					labelB2.appendChild(textB2);
					b2Div.appendChild(labelB2);
					// <div> -<div3> col-1 放商品單價
					let b3Div = document.createElement("div");
					b3Div.setAttribute("class", "col-md-1");
					b3Div.innerHTML = productEachObj.price;
					
					// <div> - <div4> col-1 放商品個數
					let b4Div = document.createElement("div");
					// b4Div.setAttribute("class", "col-md-1");
					b4Div.setAttribute("class", "col-md-2 input-group");
					//減少數量按鈕
					let spanB4 = document.createElement("span");
					spanB4.setAttribute("class","input-group-btn");
					b4Div.appendChild(spanB4);
					let buttonB4a = document.createElement("button1");
					buttonB4a.setAttribute("class","btn btn-outline-secondary btn-sm");
					spanB4.appendChild(buttonB4a);
					let b4I = document.createElement("i");
					b4I.setAttribute("class","bi bi-dash");
					buttonB4a.appendChild(b4I);
					//輸入數量框
					let inputB4 = document.createElement("input");
					inputB4.setAttribute("class","form-control form-control-sm");
					inputB4.setAttribute("type", "text");
					inputB4.setAttribute("value", productEachObj.quantity);
					b4Div.appendChild(inputB4);
					//增加數量按鈕
					let spanB4b = document.createElement("span");
					spanB4b.setAttribute("class","input-group-btn");
					b4Div.appendChild(spanB4b);
					let buttonB4b = document.createElement("button2");
					buttonB4b.setAttribute("class","btn btn-outline-secondary btn-sm");
					spanB4b.appendChild(buttonB4b);
					let b4I2 = document.createElement("i");
					b4I2.setAttribute("class","bi bi-plus");
					buttonB4b.appendChild(b4I2);
					
					// <div> - <div5> col-1 放價格小計
					let b5Div = document.createElement("div");
					b5Div.setAttribute("class", "col-md-1");
					let boldB5 = document.createElement("b");
					boldB5.setAttribute("class", "text-danger");
					let textB5 = document.createTextNode(productEachObj.price * productEachObj.quantity);
					boldB5.appendChild(textB5);
					b5Div.appendChild(boldB5);
					// <div> - <div6> col-1 放商品刪除觸發事件
					let b6Div = document.createElement("div");
					b6Div.setAttribute("class", "col-md-1");
					let trashB6 = document.createElement("i");
					trashB6.setAttribute("class", "bi bi-trash btn btn-light");
					trashB6.setAttribute("id","trash");
					b6Div.appendChild(trashB6);

					aDiv.appendChild(b1Div);
					aDiv.appendChild(b2Div);
					aDiv.appendChild(b3Div);
					aDiv.appendChild(b4Div);
					aDiv.appendChild(b5Div);
					aDiv.appendChild(b6Div);
					$("hr").eq(0).before(aDiv);
					
				});	
				
					//點擊加減按鈕改變數量
					//減
					$("body").on("click","button1",function(){
						let qtyminus = $(this).parent().siblings('input').val();
						let qua = parseInt($(this).parent().siblings('input').val(parseInt(qtyminus)-1));
						qua= $(this).parent().siblings('input').eq(0).val();
// 						console.log(qua);
						let price = parseInt($(this).parent().parent().prev().text());
// 						console.log($(this).parent().parent().prev().text());
// 						console.log(qua*price);
						if(qua>0){
							$(this).parent().parent().next().find("b").eq(0).text(qua*price);
						}else{
							$(this).parent().next().find("b").eq(0).text(price);
							$(this).parent().siblings('input').eq(0).val(1);
						}
						
						let changeQua1= $(this).parent().parent().find("input").eq(0).val();
						let changeName1 = $(this).parent().parent().parent().find("div").eq(1).find("label").eq(0).text();
// 						alert('changeQua1:'+changeQua1+'_changeName1:'+changeName1);
						jQuery.each(productsListJSON,function(idx, product){
							if (product.name === changeName1) {
						           product.quantity = changeQua1;
						           //console.log(product);
						           return false;
							}
						});
					});			
					//加
					$("body").on("click","button2",function(){
						let qtyplus = $(this).parent().siblings('input').val();
						let qua = $(this).parent().siblings('input').val(parseInt(qtyplus)+1);
						qua= $(this).parent().siblings('input').eq(0).val();
// 						console.log($(this).parent().siblings('input').eq(0).val());
						let price = parseInt($(this).parent().parent().prev().text());
						if(qua>0){
							$(this).parent().parent().next().find("b").eq(0).text(qua*price);
						}else{
							$(this).parent().next().find("b").eq(0).text(price);
							$(this).parent().siblings('input').eq(0).val(1);
						}
						
						let changeQua2= $(this).parent().parent().find("input").eq(0).val();
						let changeName2 = $(this).parent().parent().parent().find("div").eq(1).find("label").eq(0).text();
						jQuery.each(productsListJSON,function(idx, product){
							if (product.name === changeName2) {
						           product.quantity = changeQua2;
						           //console.log(product);
						           return false;
							}
						});
					});
					
					//手動輸入防呆
					$("body").on("blur","input",function(){
						let num = $(this).val();
						if(num<1){
							num = 1;
						}
						$(this).val(num);
					});
					
					
				// 改變數量時更改小計金額
				$("body").on("change","input",function() {
						//若值為負
						let qua = $(this).val();
						let price = $(this).parent().prev().text();
// 						console.log(qua);
						if(qua>0){
							$(this).parent().next().find("b").eq(0).text(qua*price);
						}else{
							$(this).parent().next().find("b").eq(0).text(price);
							$(this).parent().siblings('input').eq(0).val(1);
						}
						let changeQua = $(this).val();
						if(changeQua<1){
							changeQua=1;
						}
						//console.log("test..changeQua:"+changeQua);
						let changeName = $(this).parent().parent().find("div").eq(1).find("label").eq(0).text();
						// 更新JSON 裡面該物件的數量的值
						jQuery.each(productsListJSON,function(idx, product) {
							if (product.name === changeName) {
					           product.quantity = changeQua;
					           // console.log(product);
					           return false;
					          }
						});
				});
				
				
				
				// 商品刪除觸發
				$("body").on("click","form div i#trash",function() {
							// 取出要刪除的名稱，其實不太好...重名就完了
							let removeName = $(this).parent().parent().find(
									"div").eq(1).find("label").eq(0).text();
							//console.log("要移除的 removename : " + removeName);
							// JSON購物清單該項刪除
							jQuery.each(productsListJSON,
									function(idx, product) {
// 										console.log("第 " + idx + " 筆資料 : ");
// 										console.log(product.name);
										if (product.name === removeName) {
											productsListJSON.splice(idx, 1);
											return false;
										}
									});
							// 購物籃商品總數-1
							productCount--;
							// console.log("剩下的list" + productsListJSON);
							// 送出清單的按鈕移除
							$(this).parent().parent().remove();
							// 如果沒有商品了就顯示 : "商品明細沒有資料" 並且給予返回首頁的按鈕
							if (productCount === 0) {
								$("form#product-list-formcheck").children("div").eq(0).after('<div style="font-size: 150px;text-align:center;"><i class="bi bi-cart4"></i></div><br><h4 style="text-align:center;">您的購物車裡沒有任何商品。</h4>');
								$("button:contains('下一步')").remove();
								let returnA = document.createElement("a");
								returnA.setAttribute("class","btn btn-secondary btn-lg btn-block");
								returnA.setAttribute("href","SelectAllProduct");
								returnA.innerHTML = "繼續購物"; 
								$("form#product-list-formcheck").append(returnA);
								$("h3 span:first-of-type").attr("class","text-danger");
							}
						})
						
				// 訂單進入下一步 : 確認付款方式與地址
				$("body").on("click", "button#button-next-step", function() {
					localStorage.myProducts = JSON.stringify(productsListJSON);
					console.log(JSON.stringify(productsListJSON));
				});
			});
				
				
	// -------------------------------全域變數-------------------------------
	// 取得JSON購物清單
	var productsListJSON = JSON.parse(localStorage.myProducts);
	// console.log("payment收到的JSON : ")
	// console.log(productsListJSON);
	// 購物籃商品總數
	var productCount = productsListJSON.length;
	// console.log(productCount);
	// -------------------------------全域變數-------------------------------
</script>

<title>FurHouse</title>

</head>
<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<!-- 	        <h3><span class="text-success">確認購買商品與運送</span> -->
			<h3>
				<span class="text-success">確認購買清單</span> <i
					class="bi bi-arrow-right-circle"></i> <span>確認付款方式與地址</span> <i
					class="bi bi-arrow-right-circle"></i> <span>完成訂購</span>
			</h3>
		</div>
		<div class="row">
			<h4 class="mb-3" style="padding-left:20px;">商品明細</h4>
			<div class="col-md-12">
				<form class="needs-validation" id="product-list-formcheck"
					method="post" action="paymentS2" novalidate>
					<div class="form-group row bg-secondary text-white">
						<div class="col-md-2">
							<label>商品</label>
						</div>
						<div class="col-md-5">
							<label>名稱與規格</label>
						</div>
						<div class="col-md-1">
							<label>單價</label>
						</div>
						<div class="col-md-2">
							<label>數量</label>
						</div>
						<div class="col-md-1">
							<label>小計</label>
						</div>
						<div class="col-md-1">
							<label>變更</label>
						</div>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-mg btn-block col-mb-4"
						id="button-next-step" type="submit">下一步</button>
				</form>
			</div>
		</div>
		<footer class="pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2021-2021 CatBow 貓飽×貓寶</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>
</body>
</html>