// modify by 廖崇欽
$(document).ready(function () {

	// 匯入HTML
	w3.includeHTML();

    //----------------------------商品相關JS開始
    //商品頁面跳轉
    $("body").on("click",".SelectProductByClass",function(){    
    	console.log($(this));
		let getId = $(this).attr("id").substr(4);
		window.location.href = "SelectOneProduct?SelectProductByID="+getId;				
		}
	)
    //----------------------------商品相關JS結束
    
    // 淡入淡出MenuList
    $("button#nav-menu").click(function () {
        if ($("div#div-v-pills").hasClass("offset-lg-1")) {
            $("div#div-v-pills").removeClass("offset-lg-1");
            $("div#menu-detail").fadeToggle("fast");
        } else {
            $("div#menu-detail").fadeToggle("fast", function () {
                $("div#div-v-pills").addClass("offset-lg-1");
            });
        }
    });
    // 隱藏次分類
    $("div#v-pills-tab>a[class='nav-link offset-2']").hide();
    $("div#v-pills-tab>div.dropdown-divider").hide();
    // 定位MenuList選到哪個分類就會顯示該分類的次分類，cp01只是個checkpoint01
    // 還需要判斷當下是否重複點擊同一分類
    let nowAt = "", beforeAt = "";
    $("div#v-pills-tab>a[class*='cp01']").click(function () {
        nowAt = this.getAttribute("id");
        if (nowAt != beforeAt) {
            $(this).parent().children().not("[class*='cp01']").slideUp();
            $(this).nextUntil("a[class*='cp01']").slideToggle();
        }
        beforeAt = nowAt;
    });
    // 觸發會員登入Modal的視窗
    $("a#anchor-login-modal").click(function () {
        $("div#component-login").modal();
    });
    // 觸發註冊畫面的跳轉
    $("body").on("click", "a:contains('我要註冊')", function () {
        $("button#nav-menu").hide();
        $("div#menu-detail").hide();
        $("div#v-pills-tabContent").remove();
        $("div#div-v-pills").removeClass();
        $("div#div-v-pills").addClass("col-lg-6 offset-lg-3  p-lg-3 pb-lg-5 bg-light");
        $("div#div-v-pills").empty();
        $("div#div-v-pills").append("<div w3-include-html='component.register'></div>");
        w3.includeHTML();
        $("div#component-login").modal("hide");
    });
    // 簡易註冊驗證效果
    // for 帳戶名稱
    $("body").on("blur", "form>div>div>input#accountid", function () {
        let reg = /^[0-9a-zA-Z]{4,}$/;
        if (/^[0-9a-zA-Z]{4,}$/.test($(this).val())) {
            $(this).removeClass("is-invalid");
            $(this).addClass("is-valid");
            $(this).next().removeClass("invalid-feedback");
            $(this).next().addClass("valid-feedback");
            $(this).next().html("帳號格式正確");
        } else {
            $(this).removeClass("is-valid");
            $(this).addClass("is-invalid");
            $(this).next().removeClass("valid-feedback");
            $(this).next().addClass("invalid-feedback");
            $(this).next().html("帳號格式不符");
        }
    });
    // for 帳戶密碼
    $("body").on("blur", "form>div>div>input#accountpwd", function () {
        let reg = /^[0-9a-zA-Z]{4,}$/;
        if (/^[0-9a-zA-Z]{4,}$/.test($(this).val())) {
            $(this).removeClass("is-invalid");
            $(this).addClass("is-valid");
            $(this).next().removeClass("invalid-feedback");
            $(this).next().addClass("valid-feedback");
            $(this).next().html("密碼格式正確");
        } else {
            $(this).removeClass("is-valid");
            $(this).addClass("is-invalid");
            $(this).next().removeClass("valid-feedback");
            $(this).next().addClass("invalid-feedback");
            $(this).next().html("密碼格式不符");
        }
    });

    // 購物籃啟動
    $("body").on("mouseover", "button#button-basket", function () {
        $("button#button-basket").dropdown('toggle');
    });
    // 購物藍清單刪除觸發
    $("body").on("mouseenter", "#form-myShoppingBasket i", function () {
        this.style.color = "red";
    })
    $("body").on("mouseleave", "#form-myShoppingBasket i", function () {
        this.style.color = "black";
    })
    $("body").on("click", "#form-myShoppingBasket i", function () {
        let divTop = $(this).parent().parent().parent().parent();
        $(this).parent().parent().remove();
        productCount--;

        if (productCount === 0) {
            $("div#form-tittle").remove();
            $("button:contains('加入結帳清單')").remove();
            $("div#noItems").show();
        }

        let productNoListTemp = new Array(5);
        let removeSN = $(this).parent().parent().find("input").eq(0).attr("id").substr(9);
        let increment = 0;
        for (let productNo of productNoList) {
            if (productNo !== removeSN) {
                productNoListTemp[increment] = productNo;
                increment++;
            }
        }
        productNoList = productNoListTemp;
    })
    // 購物籃清空並轉到結帳清單中
    $("body").on("click", "button:contains('加入結帳清單')", function () {
        // 儲存JSON
        $("div#form-tittle").nextAll().each(function () {
            // $(this).find("div").eq(1).find("img").eq(0).attr("src");
            let impPath = $(this).find("div").eq(1).find("img").eq(0).attr("src");
            let productPrice = $(this).find("div").eq(4).find("p").eq(0).text();
            let productName = $(this).find("div").eq(2).find("p").eq(0).text();
            let productId = $(this).find("div").eq(3).find("input").eq(0).attr("id");
            productId = productId.substr(9);
            let productQua = $(this).find("div").eq(3).find("input").eq(0).val();
            // 創建物件
            let productObj = new Object();
            productObj.name = productName;
            productObj.id = productId;
            productObj.quantity = productQua;
            productObj.price = productPrice;
            productObj.imgSrc = impPath;
            // 插入JSON數組
            productsListJSON.push(productObj);
        })
        $(this).prev().children("div.row").remove();
        let aDiv = document.createElement("div");
        aDiv.setAttribute("class", "form-group");
        aDiv.setAttribute("id", "shipping-Done");
        aDiv.innerHTML = "已加入結帳清單!";
        $('form#form-myShoppingBasket').append(aDiv);
        $("button:contains('加入結帳清單')").remove();
        // 記錄清空
        productCount = 0;
        productNoList = new Array(5);
        // JSON數組清空
        // productsListJSON = [];
        // JSON轉型字串
        // console.log("購物籃給購物車的JSON : " + JSON.stringify(productsListJSON));
        localStorage.myProducts = JSON.stringify(productsListJSON);
        // 在購物車上顯示商品件數
        if (productsListJSON.length !== 0) {
            $("span#cart-total").text(productsListJSON.length);
        }
    })   
});

//---------------------------------------全域變數---------------------------------------
// 購物籃商品總數
var productCount = 0;
// 購物籃商品編號List數組
var productNoList = new Array(5);
// 購物籃中的商品集JSON格式
var productsListJSON = [];
//---------------------------------------全域變數---------------------------------------

// 購物籃 drag & drop function
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
    ev.dataTransfer.effectAllowed = "copy";
}

function drop(ev) {
    ev.preventDefault();
    if (productCount === 0) {
        // 給定字段名稱
        $("div#noItems").hide();
        let aDivTop = document.createElement("div");
        aDivTop.setAttribute("class", "row form-group");
        aDivTop.setAttribute("id", "form-tittle");
        let b0DivTop = document.createElement("div");
        b0DivTop.setAttribute("class", "col-lg-1");
        let b1DivTop = document.createElement("div");
        b1DivTop.setAttribute("class", "col-lg-2");
        let b2DivTop = document.createElement("div");
        b2DivTop.setAttribute("class", "col-lg-5");
        b2DivTop.innerText = "商品名稱";
        let b3DivTop = document.createElement("div");
        b3DivTop.setAttribute("class", "col-lg-2");
        b3DivTop.innerText = "數量";
        let b4DivTop = document.createElement("div");
        b3DivTop.setAttribute("class", "col-lg-2");
        b4DivTop.innerText = "價格";
        aDivTop.appendChild(b0DivTop);
        aDivTop.appendChild(b1DivTop);
        aDivTop.appendChild(b2DivTop);
        aDivTop.appendChild(b3DivTop);
        aDivTop.appendChild(b4DivTop);
        $("form#form-myShoppingBasket").append(aDivTop);
    }
    // 商品總數大於5件，購物籃會裝不下
    if (productCount > 5) {
        return;
    }
    // 不予許重複拉商品進購物籃
    for (let productNo of productNoList) {
        if (ev.dataTransfer.getData("text") === productNo) {
            return;
        }
    }
    // 登記商品總個術與商品編號清單
    productNoList[productCount] = ev.dataTransfer.getData("text");
    productCount++;
    // 每個商品的格式
    let data = ev.dataTransfer.getData("text");
    let original = document.getElementById(data);
    // <div> root tag
    let aDiv = document.createElement("div");
    aDiv.setAttribute("class", "row form-group");
    // <div>-<div> has col-1
    let b0Div = document.createElement("div");
    b0Div.setAttribute("class", "col-lg-1");
    b0Div.innerHTML = "<i class=\"bi bi-x-circle-fill\"></i>";
    // <div>-<div> has col-2
    let b1Div = document.createElement("div");
    b1Div.setAttribute("class", "col-lg-2");
    // <div>-<div> has col-5
    let b2Div = document.createElement("div");
    b2Div.setAttribute("class", "col-lg-5");
    // <div>-<div> has col-2
    let b3Div = document.createElement("div");
    b3Div.setAttribute("class", "col-lg-2");
    // <div>-<div> has col-2
    let b4Div = document.createElement("div");
    b4Div.setAttribute("class", "col-lg-2");
    // <div> - <div1> - <img>
    let copyimg = document.createElement("img");
    copyimg.setAttribute("width", "60px");
    copyimg.setAttribute("height", "60x");
    copyimg.setAttribute("src", original.getAttribute("src"));
    // <div> - <div2> - <p1>
    let aP = document.createElement("p");
    let data2 = "#" + data;
    let productName = $(data2).parent().find("h5").eq(0).text();
    let aPtext = document.createTextNode(productName);
    aP.appendChild(aPtext);
    // <div> - <div3> - <input>
    let aInput = document.createElement("input");
    aInput.setAttribute("class", "form-control form-control-sm");
    aInput.setAttribute("type", "text");
    let productSN = "productSN" + ev.dataTransfer.getData("text");
    aInput.setAttribute("id", productSN);
    aInput.setAttribute("value", "1");
    // <div> - <div4> - <p2>
    let aP2 = document.createElement("p");
    let productPrice = ($(data2).parent().find("p").eq(0).text()).substr(3);
    let aPtext2 = document.createTextNode(productPrice);
    aP2.appendChild(aPtext2);
    // 加入form表中
    b1Div.appendChild(copyimg);
    b2Div.appendChild(aP);
    b3Div.appendChild(aInput);
    b4Div.appendChild(aP2);
    aDiv.appendChild(b0Div);
    aDiv.appendChild(b1Div);
    aDiv.appendChild(b2Div);
    aDiv.appendChild(b3Div);
    aDiv.appendChild(b4Div);
    $("form#form-myShoppingBasket").append(aDiv);
    // 建立加入結帳清單的按鈕
    if (productCount === 1) {
        // let butt = document.createElement("button");
        // butt.setAttribute("type", "submit");
        // butt.setAttribute("class", "btn btn-secondary btn-sm btn-block");
        // butt.setAttribute("form", "form-myShoppingBasket");
        // butt.innerHTML = "加入結帳清單";
        // $("form#form-myShoppingBasket").parent().append(butt);

        // 只建立一個對應JS的按鈕，不送出表單
        $("div#shipping-Done").remove();
        let butt = document.createElement("button");
        butt.setAttribute("type", "button");
        butt.setAttribute("class", "btn btn-secondary btn-sm btn-block");
        butt.innerHTML = "加入結帳清單";
        $("form#form-myShoppingBasket").parent().append(butt);
    }
}
