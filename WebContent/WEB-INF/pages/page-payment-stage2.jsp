<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
        .container {
            max-width: 960px;
        }
    </style>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="assets/js/w3.js"></script>
    <script src="assets/js/jQuery-3.6.0.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <!-- User Define JS -->
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
        $(document).ready(function () {
        	// 塞商品JSON進入表單中
        	$("[name='productsJson']").val(localStorage.myProducts);
            // 遍歷step1最終確認的商品
            jQuery.each(productsListJSON, function (idx, product) {
                // 讀取product資訊
                let productName = product.name;
                let productId = product.id;
                let productImg = product.imgSrc;
                let productPrice = product.price;
                let productQua = product.quantity;
                // 寫出到左表中
                let aLi = document.createElement("li");
                aLi.setAttribute("class", "list-group-item d-flex justify-content-between lh-condensed");
                let aDiv = document.createElement("div");
                let aH6 = document.createElement("h6");
                aH6.setAttribute("class", "my-0");
                aH6.innerHTML = productName;
                let aSmall = document.createElement("small");
                aSmall.setAttribute("class", "text-muted");
                aSmall.innerHTML = "productNo : " + productId;
                aDiv.appendChild(aH6);
                aDiv.appendChild(aSmall);
                let aSpan = document.createElement("span");
                aSpan.setAttribute("class", "text-secondary font-weight-bold ml-3");
                aSpan.innerHTML = "$" + (productPrice * productQua);
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
        });
    </script>
    <title>FurHouse</title>
</head>
<body class="bg-light">
<div class="container">
    <div class="py-5 text-center">
        <h3><span>確認購買商品與運送</span>
            <i class="bi bi-arrow-right-circle text-success"></i>
            <span class="text-success">確認付款方式與地址</span>
            <i class="bi bi-arrow-right-circle"></i>
            <span>完成訂購</span>
        </h3>
    </div>
    <div class="row">
        <div class="col-md-5 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">我的購物清單</span>
                <span class="badge badge-secondary badge-pill"></span>
            </h4>
            <ul class="list-group mb-3" id="myTotalLists">
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                        <h6 class="my-0">開站慶祝運費優惠折扣</h6>
                        <small>Code : ewQri97Gre</small>
                    </div>
                    <span class="text-success">-$60</span>
                </li>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (TWD)</span>
                    <strong class="text-danger"></strong>
                </li>
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
            <h4 class="mb-3">收貨人資訊</h4>
            
			<!-- form data binding start-->
            <form:form Class="needs-validation" method="POST" action="order.insert" modelAttribute="formOrderlist">
                <div class="form-group row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">姓氏</label>
                        <input type="text" class="form-control" id="firstName" name="firstName"/>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">名字</label>
                        <input type="text" class="form-control" id="lastName" name="lastName"/>
                    </div>
                </div>
                <div class="form-group mb-3">
                    <label for="email">Email <i class="text-muted">(該電子信箱可用於接收訂單資訊)</i></label>
					<input type="email" class="form-control" id="email" name="email" placeholder="@example.com"/>
                </div>
                <div class="form-group mb-3">
                    <form:label path="phone1">手機號碼</form:label>
                    <form:input path="phone1" Class="form-control"/>
                </div>
                <div class="form-group mb-3">
                    <form:label path="phone2">市話號碼</form:label>
                    <form:input path="phone2" class="form-control"/>
                </div>
                <div class="form-group mb-3">
                    <label for="address2">收貨地址</label>
                    <input type="text" class="form-control" id="address2" name="address2"/>
                </div>
                <div class="form-group row">
                    <div class="col-md-4 mb-3">
                        <form:label path="address">縣市</form:label>
                        <form:select path="address" class="custom-select d-block w-100">
                            <option value="NONE">縣市名稱...</option>
                            <option value="基隆市">基隆市</option>
                            <option value="新北市">新北市</option>
                            <option value="台北市">台北市</option>
                        </form:select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="state">地區</label>
                        <select class="custom-select d-block w-100" id="state" name="state" required>
                            <option value="NONE">地區名稱...</option>
                            <option value="蘆洲區">蘆洲區</option>
                            <option value="三重區">三重區</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="zip">郵遞區號 <span class="text-muted">(3加3)</span></label>
                        <input type="text" class="form-control" id="zip" name="zip" required/>
                    </div>
                </div>
                <hr class="mb-4"/>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="rememberAddr" name="rememberAddr" value="true"/>
                    <label class="custom-control-label" for="rememberAddr">收貨地址與會員通訊錄地址相同</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="rememberInfo" name="rememberInfo" value="true"/>
                    <label class="custom-control-label" for="rememberInfo">記住我這次的資訊，方便下次購物時使用</label>
                </div>
                <hr class="mb-4"/>
                <h4 class="mb-3">Payment</h4>
                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
						<input id="radio1" name="paymentMethod" type="radio" value="線上付款" class="custom-control-input" disabled>
						<label class="custom-control-label" for="radio1">線上付款</label>
                    </div>
                    <div class="custom-control custom-radio">
						<input id="radio2" name="paymentMethod" type="radio" value="貨運/宅配" class="custom-control-input" checked>
						<label class="custom-control-label" for="radio2">貨運/宅配</label>
                    </div>
                    <div class="custom-control custom-radio">
						<input id="radio3" name="paymentMethod" type="radio" value="郵寄" class="custom-control-input">
						<label class="custom-control-label" for="radio3">郵寄</label>
                    </div>
                </div>
                <hr class="mb-4"/>
                <input type="hidden" id="productsJson" name="productsJson" value=""/>
                <button class="btn btn-primary btn-lg btn-block" type="submit">送出訂購</button>
            </form:form>
            <!-- form data binding end-->
            
        </div>
    </div>
    <div class="my-lg-3">
        <div class="p-lg-3 bg-white rounded">
            <p class="lead text-left">購買說明事項:</p>
            <p class="text-secondary text-left">1.發票將由CatBow代為開立，相關發票作業請參考【電子發票流程】。<br>
                2.除【即買即得電子票券】商品外，若本次購物享優惠活動，如欲取消訂單或退貨，一起結帳的訂單須全部取消或退回。<br>
                3.優惠活動之折扣順序為：滿件→滿額→折價券或折扣碼→會員優惠→跨店折扣→超贈點。商品價格、數量、贈品、優惠等，以實際結帳完成為準。<br>
                4.折扣金額依比例均攤到參與活動的商品．如跨店結帳有使用超贈點折抵，以有加倍折抵的為優先，如折抵倍數相同，則以金額較高的為優先折抵。<br>
                5.每人、每個帳號限使用折扣碼/折價券活動規定的最高使用次數，若同一人利用多帳號異常使用折扣碼/折價券消費，店家保留訂單接受與否權利。</p>
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