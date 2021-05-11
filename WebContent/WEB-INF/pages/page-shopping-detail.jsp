<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <!-- jquery CSS -->
    <link href="assets/css/jquery-ui-_1.12.1.css" rel="stylesheet">
    <!-- User Define CSS -->
    <link href="assets/css/index.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #box-product {
            padding: 20px;
        }

        #box3-product {
            padding: 20px;
            font-size: 18px;
        }

        .card-title {
            color: #df0b27;
            font-weight: 700;
            font-size: 26px;
            padding-right: 20px;
        }

        .card-text-dollar {
            color: #df0b27;
            font-size: 18px;
        }

        .price {
            line-height: 30px;
            color: #df0b27;
            font-size: 22px;
            padding-right: 10px;
        }

        #tabs {
            border: 1px solid rgba(255, 255, 127, 0.4);
        }

        #tabs>ul {
            border: 0px;
            background-color: rgba(255, 255, 127, 0.4);
        }

        #tabs>ul>li {
            border: 0px;
            font-size: 20px;
        }

        #tabs-1,
        #tabs-2 {
            margin-top: 20px;
            font-size: 16px;
        }

        .qty {
            width: 30%;
            text-align: center;
        }

        /*把輪播圖裡的箭頭改成黑色*/
        .carousel-control-next,
        .carousel-control-prev

        /*, .carousel-indicators */
            {
            filter: invert(100%);
        }
        
        /*導覽列滑鼠樣式*/
        .nav-pills a:hover{ 
	 	    color: #ff4e0d;
	 	    cursor:url("assets/img/mouse.png"),pointer; 
 		} 
 		/*分頁切換*/
 		.ui-tabs .ui-tabs-nav li.ui-tabs-active .ui-tabs-anchor,
		.ui-tabs .ui-tabs-nav li.ui-state-disabled .ui-tabs-anchor,
		.ui-tabs .ui-tabs-nav li.ui-tabs-loading .ui-tabs-anchor {
			cursor: text;
			background-color:rgba(102, 162, 255,1)
		}
		
		body {
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			margin-left: 0px;
		}
		.container{
/* 			height:1000px; */
			margin-top:0px;
			background: -webkit-linear-gradient(rgba(251,251,110,0.1),rgba(255,255,242,0.3));
			background: -o-linear-gradient(rgba(251,251,110,0.1),rgba(255,255,242,0.3));
			background: -moz-linear-gradient(rgba(251,251,110,0.1),rgba(255,255,242,0.3));
			background: linear-gradient(rgba(251,251,110,0.1),rgba(255,255,242,0.3));
		}
		
		#menu-detail{
			box-shadow:10px 0px 12px -8px rgba(255,199,162,0.37),-6px 0px 8px -4px rgba(255,199,162,0.37);
		}
    </style>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="assets/js/w3.js"></script>
    <script src="assets/js/jQuery-3.6.0.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script> 
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-ui_1.12.1.js"></script>
    <!-- User Define JS -->
    <script src="assets/js/index.js"></script>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
    <script src="assets/js/sweetalert.min.js"></script>
    <script>
        $(document).ready(function () {
            //購買數量輸入值為負值或者超過產品剩餘數量時的處理
            $("input.qty").val(1);
            $("body").on("blur", "input.qty", function () {
                let num = $("input.qty").val();
                let quantity = ${product.quantity};
                if (num < 1) {
                    num = 1;
                } else if (num > quantity) {
                    num = quantity;
                }
                $("input.qty").val(num);
            });
            $("body").on("click", "button#qtyplus", function () {
                let num = $("input.qty").val();
                let quantity = ${product.quantity};
                if (num > quantity) {
                    num = quantity;
                }
                $("input.qty").val(num);
            });
            $("body").on("click", "button#qtyminus", function () {
                let num = $("input.qty").val();
                if (num < 1) {
                	$("input.qty").val(1);
                }
            });
        });
        // 購物車加上本頁購物的商品資訊
        var name = "${product.productName}";
        var id = "${product.id}";
        var quantity = 1;
        var price = "${product.price}";
        var imgSrc = "prodImageToByte?path=${product.photo1}";
        var nowProductionItems = 0;
        if(localStorage.myProducts){
	        nowProductionItems = JSON.parse(localStorage.myProducts).length;
        }

        $(function () {
            $("body").on("blur", "input.qty", function () {
                quantity = $("input.qty").val();
            })
            $("body").on("click", "button#qtyplus", function () {
                quantity = $("input.qty").val();
            })
            $("body").on("click", "button#qtyminus", function () {
                quantity = $("input.qty").val();
            })
            $("body").on("click", "a#goBuyIt", function () {
            	nowProductionItems ++;
            	if(nowProductionItems > 5){
					alert("一次購物訂單至多能有5項商品");
					return;
            	}
                let newProductJSON = {
                    "name"    : name,
                    "id"      : id,
                    "quantity": quantity,
                    "price"   : price,
                    "imgSrc"  : imgSrc
                };

                let alreadyBuyJSON = [];
                if(localStorage.myProducts){
                	alreadyBuyJSON = JSON.parse(localStorage.myProducts);
                }
                alreadyBuyJSON.push(newProductJSON);
                localStorage.myProducts = JSON.stringify(alreadyBuyJSON);

                nowProductionItems = JSON.parse(localStorage.myProducts).length;
                if (nowProductionItems !== 0) {
                    $("span#cart-total").text(nowProductionItems);
                }
            })
            // 在購物車上顯示商品件數
            if (nowProductionItems !== 0) {
                $("span#cart-total").text(nowProductionItems);
            }
        });
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
    <div class="d-flex flex-column flex-md-row align-items-center p-2 px-md-4 mb-3 bg-white border-bottom shadow-sm"
        w3-include-html="<c:url value='/addFrame.controller/header'/>"></div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-2" id="menu-detail"
                w3-include-html="<c:url value='/addFrame.controller/aside'/>"></div>
            <div class="col-lg-10" id="div-v-pills">
                <!-- ###置入本頁資訊### -->
                <div class="container">
                    <div class="row" id="box-product">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <!-- ###圖片區### -->
                                    <div id="carouselExampleIndicators" class="carousel slide col-md-12"
                                        data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img alt="" src="prodImageToByte?path=${product.photo1}"
                                                    class="d-block w-100" />
                                            </div>
                                            <c:choose>
                                                <c:when test="${product.photo2!=null}">
                                                    <div class="carousel-item">
                                                        <img alt="" src="prodImageToByte?path=${product.photo2}"
                                                            class="d-block w-100" />
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${product.photo3!=null}">
                                                    <div class="carousel-item">
                                                        <img alt="" src="prodImageToByte?path=${product.photo3}"
                                                            class="d-block w-100" />
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators"
                                            role="button" data-slide="prev"> <span
                                                class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
                                            role="button" data-slide="next"> <span
                                                class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                    <!-- ###圖片區結尾### -->
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-12" id="box3-product">
                                        <p class="card-title">${product.productName}</p>
                                        <div class="row justify-content-start">
                                            <div class="col-3">
                                                <small>商品編號:${product.id}</small>
                                            </div>
                                            <div class="col-4">
                                                <small> 分類：${product.type}</small>
                                            </div>
                                            <div class="col-5">
                                                <p class="card-text-dollar">
                                                    好康價&nbsp;&nbsp;&nbsp;$NT<span
                                                        class="price">${product.price}</span>
                                                </p>
                                            </div>
                                        </div>

                                        <p class="card-text">★★★★商品描述★★★★</p>
                                        <p class="card-text">${product.comment1}</p>
                                        <p class="card-text">${product.comment2}</p>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col">
                                                <p class="text-danger">剩餘數量：${product.quantity}</p>
                                            </div>
                                        </div>
                                        <div class="input-group" style="text-aglin: center">
                                            <p>購買數量&nbsp;&nbsp;</p>
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-light"
                                                    id="qtyminus" field="quantity">
                                                    <i class="bi bi-dash"></i>
                                                </button>
                                            </span> <input type='text' name='quantity' value='1' class='qty'>
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-light"
                                                    id="qtyplus" field="quantity">
                                                    <i class="bi bi-plus"></i>
                                                </button>
                                            </span>
                                            <div class="bg-transparent col align-self-end">
                                                <a href="javascript:;" class="btn btn-primary" id="goBuyIt">
                                                    <i class="bi bi-cart-check"></i> 加入購物車
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="tabs">
                                            <ul>
                                                <li><a href="#tabs-1">購物須知</a></li>
                                                <li><a href="#tabs-2">換退貨須知</a></li>
                                            </ul>
                                            <div id="tabs-1">
                                                <p class="card-text">【十二萬分感謝您的惠顧】</p>
                                                <p class="card-text">
                                                    1.本網站僅提供台灣本島寄送服務(不接受郵政信箱地址)，指定商品採新竹物流配送，(暫無提供離島/店到店服務/郵局寄送)
                                                    ，確認付款完成我們會於1~3個工作日內將商品寄到您的收貨地址</p>
                                                <p class="card-text">#黑貓宅急便固定周日不配送</p>
                                                <p class="card-text">#無夜間6點後配送服務</p>
                                                <p class="card-text">#新竹物流配送物品暫無提供貨到付款服務</p>
                                                <p class="card-text">
                                                    2.飼料出貨皆有保證四個月以上保存期限，如期限太短會主動提前告知客人，與您確認是否有需要訂購，如飼料因期限問題，需退換貨需自行負擔運費。
                                                    (即期品會在標題標示效期以及優惠購買金額，不在保證四個月效期的範疇內)</p>
                                                <p class="card-text">3.貨到付款除需收取運費外 ，每筆加收60元貨到付款手續費</p>
                                                <p class="card-text">4.本系統保留取消訂單權利</p>
                                                <p class="card-text">【詐騙猖獗 -- 小心詐騙】</p>
                                                <p class="card-text">
                                                    本店絕不會另外通知消費者交易失敗，或是付款錯誤，一些奇怪理由，要您去提款機做任何取消交易或轉帳的動作，請小心不要受騙。
                                                </p>
                                            </div>
                                            <div id="tabs-2">
                                                <p class="card-text">
                                                    1.退回商品必須是全新狀態，完整包裝及附件及購買發票都需齊全，如有缺少或使用恕無法辦理退貨程序。</p>
                                                <p class="card-text">
                                                    2.本商家出貨前必定檢查商品完整，為避免接觸性傳染疾病，所以一經拆封使用不能退換貨，請您購買前先考量好以免造成日後買賣糾紛，若在運送過程有損壞，會為您向宅配公司申請賠償。
                                                </p>
                                                <p class="card-text">3.如非本商家售出商品本身有問題，要退換貨需自行負擔商品寄、退兩筆運費。</p>
                                                <p class="card-text">
                                                    4.請使用首頁"聯絡我們"與我們聯繫，收到訊息後將為您確認退貨所需的資料，確認後請您將欲退貨之商品寄到所指定的退貨地址，待商品查驗符合退貨資格後，將立即為您辦理退款手續。
                                                </p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 插入會員登入的 Modal start -->
    <c:if test="${sessionScope.login_user == null}">
        <div class="modal fade" id="component-login" tabindex="-1" role="dialog" aria-labelledby="LoginTitle"
            aria-hidden="true" w3-include-html="<c:url value='/component.login'/>"></div>
    </c:if>
    <c:if test="${sessionScope.login_user != null}">
        <div class="modal fade" id="component-login" tabindex="-1" role="dialog" aria-labelledby="LoginTitle"
            aria-hidden="true" w3-include-html="<c:url value='/component.relogin'/>"></div>
    </c:if>
    <!-- 插入會員登入的 Modal end -->

    <!-- 登入會員後會出現的會員專區連結 -->
    <c:if test="${sessionScope.login_user != null}">
        <script>
            $(document).ready(function () {
                $("a#anchor-login-modal").text("登出");
                let memberBadge = `<a class="btn btn-warning" href="<c:url value='/member.myPage'/>" role="button">${sessionScope.login_user.name},您好</a>`;
                $("a#anchor-login-modal").before(memberBadge);
                $("a#myShoppingCart").attr("class",
                    "btn btn-outline-warning");
                $("a#myShoppingCart").attr("href", "paymentS1");
                $("a#myShoppingCart>span").attr("class",
                    "badge btn-danger");
                $("a#goBuyIt").removeClass("disabled");
            });
        </script>
    </c:if>
    <c:if test="${sessionScope.login_user == null}">
        <script>
            $(document).ready(function () {
                $("body").on("click", "a#myShoppingCart", function () {
                	swal("請先登入會員喔!", "謝謝您~~~", "warning");
                });
				if(localStorage.myProducts != null || localStorage.myProducts == ""){
					localStorage.removeItem('myProducts');
				}
				$("a#goBuyIt").addClass("disabled");
            });
        </script>
    </c:if>

    <footer class="pt-4 my-md-5 pt-md-5 border-top"
        w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
    <script>
			<!--下方細項切頁-->
            $(function () {
                $("#tabs").tabs({
                    collapsible: true
                });
            });

			<!--控制數量-->
            $(function () {
                // This button will increment the value
                $('#qtyplus').click(
                    function (e) {
                        // Stop acting like a button	
                        e.preventDefault();
                        // Get the field name
                        fieldName = $(this).attr('field');
                        // Get its current value
                        var currentVal = parseInt($(
                            'input[name=' + fieldName + ']').val());
                        // If is not undefined
                        if (!isNaN(currentVal)) {
                            // Increment
                            $('input[name=' + fieldName + ']').val(
                                currentVal + 1);
                        } else {
                            // Otherwise put a 0 there
                            $('input[name=' + fieldName + ']').val(0);
                        }
                    });

                // This button will decrement the value till 0
                $("#qtyminus").click(
                    function (e) {
                        // Stop acting like a button
                        e.preventDefault();
                        // Get the field name
                        fieldName = $(this).attr('field');
                        // Get its current value
                        var currentVal = parseInt($(
                            'input[name=' + fieldName + ']').val());
                        // If it isn't undefined or its greater than 0
                        if (!isNaN(currentVal) && currentVal > 0) {
                            // Decrement one
                            $('input[name=' + fieldName + ']').val(
                                currentVal - 1);
                        } else {
                            // Otherwise put a 0 there
                            $('input[name=' + fieldName + ']').val(0);
                        }
                    });
            });
    </script>
</body>

</html>