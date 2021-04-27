<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/bootstrapValidator.min.css" rel="stylesheet">
<!-- User Define CSS -->
<style>
.container {
	max-width: 960px;
}

#need{
	color:red;
}

#Newdata{
	cursor: pointer;
} 


#radio1box,#radio4box{ 
  	padding:8px 10px 8px 20px;  
}

#shippingImg{
	padding:10px;
	margin:5px 0 10px 0;
	height:80px;
	width:auto;
}

</style>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="assets/js/w3.js"></script>
<script src="assets/js/jQuery-3.6.0.js"></script>
<script src="assets/js/bootstrapValidator.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>

<!-- User Define JS -->
<script src="assets/js/tw-city-selector.min.js"></script>
<!-- User Define JS -->
<script>
 	new TwCitySelector({
    el: '.city-selector-set',
    elCounty: '.county', // 在 el 裡查找 element
    elDistrict: '.district', // 在 el 裡查找 element
    elZipcode: '.zipcode' // 在 el 裡查找 element
  });
</script>

<script>
	// -------------------------------全域變數-------------------------------
	// 取得JSON購物清單
	var productsListJSON = JSON.parse(localStorage.myProducts);
	// console.log("payment收到的JSON : ")
	// console.log(productsListJSON);
	// 購物籃商品總數
	var productCount = productsListJSON.length;
	// console.log(productCount);
	// 商品清單總價
	var totalPrice = 0;
	// -------------------------------全域變數-------------------------------
	$(document)
			.ready(
					function() {
						// 塞商品JSON進入表單中
						$("[name='productsJson']").val(localStorage.myProducts);
						// 遍歷step1最終確認的商品
						jQuery.each(productsListJSON,function(idx, product) {
											// 讀取product資訊
											let productName = product.name;
											let productId = product.id;
											let productImg = product.imgSrc;
											let productPrice = product.price;
											let productQua = product.quantity;
											// 寫出到左表中
											let aLi = document.createElement("li");
											aLi.setAttribute("class","list-group-item d-flex justify-content-between lh-condensed");
											let aDiv = document.createElement("div");
											let aH6 = document.createElement("h6");
											aH6.setAttribute("class", "my-0");
											aH6.innerHTML = productName;
											let aSmall = document.createElement("small");
											aSmall.setAttribute("class","text-muted");
											aSmall.innerHTML = "購買數量 : "+ productQua;
											aDiv.appendChild(aH6);
											aDiv.appendChild(aSmall);
											let aSpan = document.createElement("span");
											aSpan.setAttribute("class","text-secondary font-weight-bold ml-3");
											aSpan.innerHTML = "$"+ (productPrice * productQua);
											aLi.appendChild(aDiv);
											aLi.appendChild(aSpan);
											$("ul#myTotalLists").prepend(aLi);
											// 總金額累加
											totalPrice += productPrice * productQua;
										});
						// 購物籃商品總數
						$("span.badge").text(productCount);
						// 顯示總金額
						$("ul#myTotalLists li strong").text("$" + (totalPrice - 60));
						
						//---------------------表單驗證---------------------
						let flag1=false,flag2=false,flag3=false;
						$("body").on("blur","input#userName",function(){
							let userName = document.getElementById("userName");
							let feedback = document.getElementById("userName-feedback");
							userName.classList.remove("is-valid");
							userName.classList.remove("is-invalid");
								//不能为空
						        if(userName.value==""){
						            feedback.innerHTML ="<b>請輸入您的姓名</b>";//修改username-feedback div中的内容
						            userName.classList.remove("is-valid");//清除合法狀態
						            userName.classList.add("is-invalid");//添加非法狀態
						            $("#checkSubmit").attr("disabled",true);//添加禁用
						            flag1 = false;
						        }else{
						        	//不能有特殊符号
							        let patrn = /[@#\$%\^&\*]+/g;//正則表達式
							        if(patrn.exec(userName.value)){
							            feedback.innerHTML ="<b>用户名不能存在特殊符号</b>";
							            userName.classList.remove("is-valid");
							            userName.classList.add("is-invalid");
							            $("#checkSubmit").attr("disabled",true);
							            flag1 = false;
							        }else{
							        	//清除错误提示，改成成功提示
							        	 $("#checkSubmit").attr("disabled",true);
								        userName.classList.remove("is-invalid");
								        userName.classList.add("is-valid");
								        feedback.innerHTML="";
								        flag1 = true;
							        }
						        }
		 						if(flag1&&flag2&&flag3==true){
	 							$("#checkSubmit").removeAttr("disabled"); 
	 							};
						});
						
						
						$("body").on("blur","input#phone1",function(){
							let phone1 = document.getElementById("phone1");
							let feedback = document.getElementById("phone1-feedback");
							phone1.classList.remove("is-valid");
							phone1.classList.remove("is-invalid");
					        if(phone1.value==""){
					            feedback.innerHTML ="<b>請輸入您的手機號碼 </b>";
					            phone1.classList.remove("is-valid");
					            phone1.classList.add("is-invalid");
					            $("#checkSubmit").attr("disabled",true);
					            flag2 = false;
					        }else{
						        //格式需符合台灣手機號碼
						        let patrn =/^09\d{8}$/;
						        if(!patrn.exec(phone1.value)){
						            feedback.innerHTML = "請輸入正確的手機格式(台灣手機門號)";
						            phone1.classList.remove("is-valid");
						            phone1.classList.add("is-invalid");
						            $("#checkSubmit").attr("disabled",true);
						            flag2 = false;
						        }else{
									//清除错误提示，改成成功提示
							        phone1.classList.remove("is-invalid");
							        phone1.classList.add("is-valid");
							        feedback.innerHTML="";
							        flag2 = true;
						        }
					        }
	 						if(flag1&&flag2&&flag3==true){
	 							$("#checkSubmit").removeAttr("disabled"); 
	 						};
						});
						
						$("body").on("blur","input#address",function(){
							let address = document.getElementById("address");
							let feedback = document.getElementById("address-feedback");
							address.classList.remove("is-valid");
							address.classList.remove("is-invalid");
					        if(address.value==""){
					            feedback.innerHTML = "請輸入您的收貨地址 ";
					            address.classList.remove("is-valid");
					            address.classList.add("is-invalid");
					            $("#checkSubmit").attr("disabled",true);
					            flag3 = false;
					        }else{
					        address.classList.remove("is-invalid");
					        address.classList.add("is-valid");
					        feedback.innerHTML="";
					        flag3 = true;
					        }
	 						if(flag1&&flag2&&flag3==true){
	 							$("#checkSubmit").removeAttr("disabled"); 
	 						};
						});
						
						$("body").on("click","button#resetMyForm",function(){
							let form = $('#myOrderForm');
							form.find('#userName,#phone1,#address,#email,#phone2,#comment,select,textarea').val('');
							form.find('input:read-only').val('');
// 							console.log(form.find('input:read-only'));
							form.find('#userName-feedback,#phone1-feedback,#address-feedback').innerHTML = '';
							userName.classList.remove("is-valid");
							userName.classList.remove("is-invalid");
							phone1.classList.remove("is-valid");
							phone1.classList.remove("is-invalid");
				            address.classList.remove("is-valid");
				            address.classList.remove("is-invalid");
				            $("#checkSubmit").attr("disabled",true);
							return false;
						});
						
						/*-------------------------一鍵新增input------------------------------*/
						$("#Newdata").on("click",function(){
							$(email).val("sandy60806@yahoo.com.tw");
							$(phone2).val("(02)66316666");
							$(comment).val("請於平日上午送達");
							$(radio2).prop('checked',true);
							$(radio7).prop('checked',true);
							$(userName).val("林小歆");
							userName.classList.add("is-valid");
							$(phone1).val("0919302313");
							phone1.classList.add("is-valid");
							$(address).val("復興南路一段390號2樓");
							address.classList.add("is-valid");
							$(county).val("台北市");
							$(district).html('<option value="大安區"  data-zipcode="106">大安區</option>');
							$(district).val("大安區");
							$(zipcode).html('<input class="zipcode form-control col-md-3" id="zipcode" type="text" size="3" readonly placeholder="106">');
							$(zipcode).val("106");
							flag1=true;flag2=true;flag3=true;
							$("#checkSubmit").removeAttr("disabled");
						});
						
						/*-------------------------清除選項時，清除郵遞區號------------------------------*/
						$("body").on("change","select#county,select#district",function(){
							let form = $('#myOrderForm');
							form.find('input:read-only').val('');
						});
	});
					
	
</script>

<title>FurHouse</title>
</head>
<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<h3>
				<span>確認購買清單</span> <i
					class="bi bi-arrow-right-circle text-success"></i> <span
					class="text-success">確認付款方式與地址</span> <i
					class="bi bi-arrow-right-circle"></i> <span>完成訂購</span>
			</h3>
		</div>
		<div class="row">
			<div class="col-md-5 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">我的購物清單</span> <span
						class="badge badge-secondary badge-pill"></span>
				</h4>
				<ul class="list-group mb-3" id="myTotalLists">
					<li class="list-group-item d-flex justify-content-between bg-light">
						<div class="text-success">
							<h6 class="my-0">開站慶祝運費優惠折扣</h6>
							<small>Code : ewQri97Gre</small>
						</div> <span class="text-success">-$60</span>
					</li>
					<li class="list-group-item d-flex justify-content-between"><span>Total
							(TWD)</span> <strong class="text-danger"></strong></li>
				</ul>

				<form class="card p-2">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Code">
						<div class="input-group-append">
							<button type="submit" class="btn btn-secondary">輸入優惠代碼</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-7 order-md-1">
				<h3 class="mb-3" id="Newdata" >收貨人資訊</h3>

				<!-- form data binding start-->
				<form:form Class="needs-validation" method="POST" id="myOrderForm" action="order.insert" modelAttribute="formOrderlist" onsubmit="return checkForm()">
					<div class="form-group mb-3">
							<label for="userName" class="control-label">收貨人姓名<small id="need">&nbsp&nbsp&nbsp(必填)</small></label> 
							<input type="text" class="form-control" id="userName" name="userName" >
							<div class="invalid-feedback" id="userName-feedback"></div>
					</div>
					<div class="form-group mb-3">
						<label for="email" class="control">Email <i class="text-muted">(該電子信箱可用於接收訂單資訊)</i></label>
						<input type="email" class="form-control" id="email" name="email" placeholder="@example.com" />
					</div>
					<div class="form-group mb-3">
						<form:label path="phone1" class="control-label" >手機號碼<small id="need">&nbsp&nbsp&nbsp(必填)</small></form:label>
						<form:input path="phone1" Class="form-control" id="phone1"/>
						<div class="invalid-feedback" id="phone1-feedback">請輸入您的手機號碼 </div>
					</div>
					<div class="form-group mb-3">
						<form:label path="phone2" class="control-label">市話號碼</form:label>
						<form:input path="phone2" class="form-control" id="phone2"/>
					</div>

					<div class="form-group mb-3">
						<form:label path="address" class="control-label">收貨地址<small id="need">&nbsp&nbsp&nbsp(必填)</small></form:label>
<!-- 						<div role="tw-city-selector" data-bootstrap-style data-has-zipcode></div> -->
							<div class="city-selector-set row ml-1">
							    <!-- 縣市選單 -->
							    <select class="county form-control col-md-4 mb-4 mr-3" id="county"></select>
								<!-- 區域選單 -->
								<select class="district form-control col-md-4 mr-3" id="district"></select>
							    <!-- 郵遞區號欄位 (建議加入 readonly 屬性，防止修改) -->
							    <input class="zipcode form-control col-md-3" id="zipcode" name="zipcode" type="text" size="3" readonly placeholder="郵遞區號" >
							</div>
						<form:input type="text" path="address"
							class="form-control" id="address" name="address"/>
						<div class="invalid-feedback" id="address-feedback">請輸入您的收貨地址 </div>
					</div>

					<div class="form-group mb-3">
						<form:label path="comment">訂單備註</form:label>
						<form:textarea path="comment" class="form-control" id="comment" rows="3"></form:textarea>
					</div>

					<hr class="mb-4" />
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="rememberAddr" name="rememberAddr" value="true" /> <label
							class="custom-control-label" for="rememberAddr">收貨地址與會員通訊錄地址相同</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="rememberInfo" name="rememberInfo" value="true" /> <label
							class="custom-control-label" for="rememberInfo">記住我這次的資訊，方便下次購物時使用</label>
					</div>
					
					<hr class="mb-4" />
					<h4 class="mb-3">付款方式</h4>
					<div class="row" id="radio1box">
						<div class="custom-control custom-radio col-sm mr-4">
							<input id="radio1" name="paymentMethod" type="radio" value="線上付款(信用卡)"
								class="custom-control-input" disabled> <label
								class="custom-control-label" for="radio1">線上付款(信用卡)</label>
						</div>
						<div class="custom-control custom-radio col-sm">
							<input id="radio2" name="paymentMethod" type="radio"
								value="貨到付款" class="custom-control-input" checked> <label
								class="custom-control-label" for="radio2">貨到付款</label>
						</div>
						<div class="custom-control custom-radio col-sm">
							<input id="radio3" name="paymentMethod" type="radio" value="銀行轉帳"
								class="custom-control-input"> <label
								class="custom-control-label" for="radio3">銀行轉帳</label>
						</div>
					</div>
						<h4 class="mb-2 my-3">送貨方式</h4>
						<div class="row" id="radio4box">
							<div class="custom-control custom-radio col-sm">
							<input id="radio4" name="ShippingType" type="radio" value="7-ELEVEn"
								class="custom-control-input"> <label
								class="custom-control-label" for="radio4">7-ELEVEn</label>
							<img id="shippingImg" src="assets\img\order\7ELEVEn.jpg">	
							</div>
							<div class="custom-control custom-radio col-sm">
							<input id="radio5" name="ShippingType" type="radio" value="FamilyMart"
								class="custom-control-input"> <label
								class="custom-control-label" for="radio5">FamilyMart</label>
							<img id="shippingImg" src="assets\img\order\FamilyMart.jpg">
							</div>
							<div class="custom-control custom-radio col-sm">
							<input id="radio6" name="ShippingType" type="radio" value="黑貓宅急便"
								class="custom-control-input"> <label
								class="custom-control-label" for="radio6">黑貓宅急便</label>
							<img id="shippingImg" src="assets\img\order\BlackCat.jpg">
							</div>
							<div class="custom-control custom-radio col-sm">
							<input id="radio7" name="ShippingType" type="radio" value="物流/宅配"
								class="custom-control-input" checked> <label
								class="custom-control-label" for="radio7">物流/宅配</label>
							<br>
							<img id="shippingImg" src="assets\img\order\KERRY.jpg">
							</div>
						
						</div>
					
					<hr class="mb-4" />
					<div class="col-mb-4 text-right">
					<div class="help-block with-errors"></div>
					<input type="hidden" id="productsJson" name="productsJson" value="" />
					<input class="btn btn-secondary btn-lg col-mb-4" type ="button" onclick="history.back()" value="返回上一頁"></input>&nbsp;&nbsp;&nbsp;
					<button class="btn btn-primary btn-lg col-mb-4 " type="reset" id="resetMyForm">清除表單</button>&nbsp;&nbsp;&nbsp;
					<button class="btn btn-primary btn-lg col-mb-4 " type="submit" disabled id="checkSubmit">送出訂購</button>&nbsp;&nbsp;&nbsp;
					</div>
				</form:form>
					
				<!-- form data binding end-->

			</div>
		</div>
		<div class="my-lg-3">
			<div class="p-lg-3 bg-white rounded">
				<p class="lead text-left">購買說明事項:</p>
				<p class="text-secondary text-left">
					1.發票將由CatBow代為開立，相關發票作業請參考【電子發票流程】。<br>
					2.除【即買即得電子票券】商品外，若本次購物享優惠活動，如欲取消訂單或退貨，一起結帳的訂單須全部取消或退回。<br>
					3.優惠活動之折扣順序為：滿件→滿額→折價券或折扣碼→會員優惠→跨店折扣→超贈點。商品價格、數量、贈品、優惠等，以實際結帳完成為準。<br>
					4.折扣金額依比例均攤到參與活動的商品．如跨店結帳有使用超贈點折抵，以有加倍折抵的為優先，如折抵倍數相同，則以金額較高的為優先折抵。<br>
					5.每人、每個帳號限使用折扣碼/折價券活動規定的最高使用次數，若同一人利用多帳號異常使用折扣碼/折價券消費，店家保留訂單接受與否權利。
				</p>
			</div>
		</div>
		<footer class="pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2021-2021 CatBow 貓飽×貓寶</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="javascript:;">Privacy</a></li>
				<li class="list-inline-item"><a href="javascript:;">Terms</a></li>
				<li class="list-inline-item"><a href="javascript:;">Support</a></li>
			</ul>
		</footer>
	</div>
</body>
</html>