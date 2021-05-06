// 我不是機器人驗證相關
var verifyCallback = function(re) {
	if(grecaptcha.getResponse()){
		$("#userLoginButton").prop("disabled", false);
	};
};

var onloadCallback = function() {
	grecaptcha.render(document.getElementById('recaptcha'), {
		'sitekey' : '6LczUscaAAAAALeBvAUE6l7-AnBjxcgiXeJaVRZL',
		'callback' : verifyCallback,
	});
};

$("div#component-login").on('hidden.bs.modal', function (e) {
	grecaptcha.reset();
	$("#userLoginButton").prop("disabled", true);
})

$(document).ready(function () {

	// 會員登入開關燈模式
	let masterMode = 1;
	$("body").on("click", "i#master", function(){
	
		let showMemberLists = "<div class='btn-group dropup' id='masterMode2'>"
							+ "<button type='button' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>使用者</button>"
							+ "<div class='dropdown-menu'>"
							+ "<a class='dropdown-item dropList' id='jlfkdlfjrk0'>廖崇欽</a>"
							+ "<a class='dropdown-item dropList' id='jlfkdlfjrk1'>鄭弘翔</a>"
							+ "<a class='dropdown-item dropList' id='jlfkdlfjrk2'>林純歆</a>"
							+ "<a class='dropdown-item dropList' id='jlfkdlfjrk3'>羅振旂</a>"
							+ "<a class='dropdown-item dropList' id='jlfkdlfjrk4'>陳皓</a>"
							+ "<a class='dropdown-item dropList' id='jlfkdlfjrk5'>李政瑩</a>"
							+ "<a class='dropdown-item dropList' id='jlfkdlfjrk6'>管理員</a>"
							+ "</div>"
							+ "</div>";	
	
		if(masterMode == 1) {
			$("i#master").removeClass("bi-toggle-off");
			$("i#master").addClass("bi-toggle-on");
			masterMode = 2;
			
			// 機器人驗證忽略
			$("div#recaptcha").after("<div id='recaptchaFixed' style='margin-top:16px;margin-bottom:15px'><img src='assets/img/reCAPTCHA.png' /></div>");
			$("div#recaptcha").hide();
			$("button#userLoginButton").prop("disabled", false);
			$("#masterMode1").after(showMemberLists);
			$("#masterMode1").hide();
			
		} else if(masterMode == 2) {
			$("i#master").removeClass("bi-toggle-on");
			$("i#master").addClass("bi-toggle-off");
			masterMode = 1;
			
			// 機器人驗證開啟
			$("div#recaptchaFixed").remove();
			$("div#recaptcha").show();
			$("button#userLoginButton").prop("disabled", true);
			$("#masterMode2").remove();
			$("#masterMode1").show();
		}
	});
	
	$("body").on('click',".dropList",function(){
		let index = this.id.substr(10);
		clickMe(index);
		
	})
	
	function clickMe(index){
		let peoplearr = [{account:"ccliao",pwd:"iiiEDU@08"},{account:"redfly",pwd:"iiiEDU@01"},{account:"pureheart",pwd:"iiiEDU@04"},{account:"xleo999",pwd:"iiiEDU@03"},{account:"haofun",pwd:"iiiEDU@05"},{account:"squarewin",pwd:"iiiEDU@033"},{account:"root",pwd:"0000"}];
		
		$("#inputAccount").val(peoplearr[index].account);
	  	$("#inputPassword").val(peoplearr[index].pwd);
		
	}
	
	  $("div").on("click", "#LoginTitle1", function () {
	  		 $("#inputAccount").val("ccliao");
	  		  $("#inputPassword").val("iiiEDU@08");
	  });
	

	

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
        if($(this).nextUntil("a[class*='cp01']").filter(".active").length == 0){
        	if (nowAt != beforeAt) {
        		if (nowAt == "v-pills-shopping-tab"){
        			// 滑出/入顯示動畫
					$(this).parent().children().not("[class*='cp01']").slideUp();
					$(this).next().slideToggle();
					$(this).next().next().slideToggle();
        			// 當前目標反藍底
					$("div#menu-detail>div>a[class~='active']").removeClass("active");
					$(this).addClass("active");
        		} else {
					// 滑出/入顯示動畫
					$(this).parent().children().not("[class*='cp01']").slideUp();
					$(this).nextUntil("a[class*='cp01']").slideToggle();
					// 當前目標反藍底
					$("div#menu-detail>div>a[class~='active']").removeClass("active");
					$(this).addClass("active");
        		}
	        }
	        beforeAt = nowAt;
        }     
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
    $("body").on("blur keyup", "form>div>div>input#accountid", function () {
        let reg = /^[0-9a-zA-Z]{4,}$/;
        if (/^[0-9a-zA-Z]{4,}$/.test($(this).val())) {
            $(this).removeClass("is-invalid");
            $(this).addClass("is-valid");
            $(this).next().removeClass("invalid-feedback");
            $(this).next().addClass("valid-feedback");
            $(this).next().html("帳號格式正確");
        }else if(accountid.value==""){
            $(this).removeClass("is-valid");
            $(this).addClass("is-invalid");
            $(this).next().removeClass("valid-feedback");
            $(this).next().addClass("invalid-feedback");
            $(this).next().html("帳號不可空白");
        }else{
            $(this).removeClass("is-valid");
            $(this).addClass("is-invalid");
            $(this).next().removeClass("valid-feedback");
            $(this).next().addClass("invalid-feedback");
            $(this).next().html("帳號格式不符");
        }
    });
    
    
    // for 帳戶密碼
    $("body").on("blur keyup", "form>div>div>input#accountpwd", function () {
        let reg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_ `\-={}:";'<>?,.\/]).{4,}$/;
        if (/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_ `\-={}:";'<>?,.\/]).{4,}$/.test($(this).val())) {
            $(this).removeClass("is-invalid");
            $(this).addClass("is-valid");
            $(this).next().removeClass("invalid-feedback");
            $(this).next().addClass("valid-feedback");
            $(this).next().html("密碼格式正確");
        } else if(accountpwd.value==""){
            $(this).removeClass("is-valid");
            $(this).addClass("is-invalid");
            $(this).next().removeClass("valid-feedback");
            $(this).next().addClass("invalid-feedback");
            $(this).next().html("密碼不可空白");
        }else {
            $(this).removeClass("is-valid");
            $(this).addClass("is-invalid");
            $(this).next().removeClass("valid-feedback");
            $(this).next().addClass("invalid-feedback");
            $(this).next().html("密碼格式不符");
        }
    });
    
    //for 電子信箱
    
    $("body").on("blur keyup", "form>div>input#accountmail", function () {
        let reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test($(this).val())) {
            $(this).removeClass("is-invalid");
            $(this).addClass("is-valid");
            $(this).next().removeClass("invalid-feedback");
            $(this).next().addClass("valid-feedback");
            $(this).next().html("E-mail格式正確");
        }else if(accountmail.value==""){
            $(this).removeClass("is-valid");
            $(this).addClass("is-invalid");
            $(this).next().removeClass("valid-feedback");
            $(this).next().addClass("invalid-feedback");
            $(this).next().html("密碼不可空白");
        } else {
            $(this).removeClass("is-valid");
            $(this).addClass("is-invalid");
            $(this).next().removeClass("valid-feedback");
            $(this).next().addClass("invalid-feedback");
            $(this).next().html("E-mail格式不符");
        }
    });
    
    
    //----------------------0504------------------//
    let flag1=false,flag2=false,flag3=false,flag4=false;
			$("body").on("blur keyup", "#accountname",function(){
						 $(this).removeClass("is-invalid");
           				 $(this).addClass("is-valid");
           				 $(this).next().removeClass("invalid-feedback");
			             $(this).next().addClass("valid-feedback");
			             $(this).next().html("姓名格式正確");
            			 		
				//不能为空	
				if(accountname.value==""){
						   $(this).removeClass("is-valid");
						   $(this).addClass("is-invalid");
						   $(this).next().removeClass("valid-feedback");
						   $(this).next().addClass("invalid-feedback");
						   $(this).next().html("請輸入您的姓名");
						   $("#checkSubmit").attr("disabled",true);//添加禁用
						   flag1 = false;
				}else{
				//不能有特殊符号
				
				let patrn = /[@#\$%\^&\*]+/g;//正則表達式
							        if(patrn.exec(accountname.value)){
							        $(this).next().html("姓名不能存在特殊符號");
							        $(this).removeClass("is-valid");
						   			$(this).addClass("is-invalid");
							        $(this).next().removeClass("valid-feedback");
						   			$(this).next().addClass("invalid-feedback");         
							        $("#checkSubmit").attr("disabled",true);
						        	flag1 = false;
							        }else{
							        	//清除错误提示，改成成功提示
							        	 $("#checkSubmit").attr("disabled",true);
							        	 accountname.classList.remove("is-invalid");
							        	 accountname.classList.add("is-valid");      
								         flag1 = true;
							        }
						        }
		 						if(flag1&&flag2&&flag3&&flag4==true){
	 							$("#checkSubmit").removeAttr("disabled"); 
	 							};
						});
						
					
						$("body").on("blur keyup","#accountphone",function(){
							 $(this).removeClass("is-valid");
           					 $(this).addClass("is-invalid");
				             $(this).next().removeClass("invalid-feedback");
				             $(this).next().addClass("valid-feedback");
				             $(this).next().html("手機格式正確");
				            
					    if(accountphone.value==""){
						   $(this).removeClass("is-valid");
						   $(this).addClass("is-invalid");
						   $(this).next().removeClass("valid-feedback");
						   $(this).next().addClass("invalid-feedback");
						   $(this).next().html("手機不可為空白");
						   $("#checkSubmit").attr("disabled",true);//添加禁用
						   flag2 = false;
					        }else{
						        //格式需符合台灣手機號碼
						        let patrn =/^09\d{8}$/;
						        if(!patrn.exec(accountphone.value)){
						        $(this).next().html("請輸入正確的手機格式(台灣手機門號)");
						        $(this).next().removeClass("valid-feedback");
						   		$(this).next().addClass("invalid-feedback");
						        accountphone.classList.remove("is-valid");
						        accountphone.classList.add("is-invalid");
						        $("#checkSubmit").attr("disabled",true);
						        flag2 = false;
						        }else{
									//清除错误提示，改成成功提示
							        accountphone.classList.remove("is-invalid");
							        accountphone.classList.add("is-valid");    
							        flag2 = true;
						        }
					        }
	 						if(flag1&&flag2&&flag3&&flag4==true){
	 							$("#checkSubmit").removeAttr("disabled"); 
	 						};
						});
						
						
						$("body").on("blur keyup","#accountaddr",function(){
								 $(this).removeClass("is-valid");
	           					 $(this).addClass("is-invalid");
					             $(this).next().removeClass("invalid-feedback");
					             $(this).next().addClass("valid-feedback");
					             $(this).next().html("地址格式正確");
					        if(accountaddr.value==""){
					        	   $(this).removeClass("is-valid");
								   $(this).addClass("is-invalid");
								   $(this).next().removeClass("valid-feedback");
								   $(this).next().addClass("invalid-feedback");
								   $(this).next().html("地址不可為空白");
								   $("#checkSubmit").attr("disabled",true);//添加禁用
								   flag3 = false;
					        }else{
					        	accountaddr.classList.remove("is-invalid");
					        	accountaddr.classList.add("is-valid");
					        	flag3 = true;
					        }
	 						if(flag1&&flag2&&flag3&&flag4==true){
	 							$("#checkSubmit").removeAttr("disabled");	
	 						};
						});	
						
						
						$("body").on("click","#agreecheck",function(){
							if($("#agreecheck").prop('checked')){						
								flag4 = true;
								/*$("#checkSubmit").attr("disabled",false);*/
							}else{
								   $(this).removeClass("is-valid");
								   flag4 = false;
								   $("#checkSubmit").attr("disabled",true);
							 }				 
						if(flag1&&flag2&&flag3&&flag4==true){
	 							$("#checkSubmit").removeAttr("disabled"); 
	 						};
						});
  
     /*-------------------------一鍵新增input------------------------------0504*/ 
	     $("body").on("click", "#inputdemo", function () {
	     
	     
	     /*--------------------------清空---------------------------*/
	     	$("#accountid").removeClass("is-invalid");
	  		$("#accountid").next().removeClass("invalid-feedback");
	  		$("#accountid").next().html("");
	  		$("#accountid").removeClass("is-valid");
            $("#accountid").next().removeClass("valid-feedback");
       /*---------------------------------------------------------------*/
            $("#accountpwd").removeClass("is-invalid");
	  		$("#accountpwd").next().removeClass("invalid-feedback");
	  		$("#accountpwd").next().html("");
	  		$("#accountpwd").removeClass("is-valid");
            $("#accountpwd").next().removeClass("valid-feedback");
       /*---------------------------------------------------------------*/      
            $("#accountmail").removeClass("is-invalid");
	  		$("#accountmail").next().removeClass("invalid-feedback");
	  		$("#accountmail").next().html("");
	  		$("#accountmail").removeClass("is-valid");
            $("#accountmail").next().removeClass("valid-feedback");
       /*-------------------------------------------------------------*/      
            $("#accountname").removeClass("is-invalid");
	  		$("#accountname").next().removeClass("invalid-feedback");
	  		$("#accountname").next().html("");
	  		$("#accountname").removeClass("is-valid");
            $("#accountname").next().removeClass("valid-feedback");
        /*-------------------------------------------------------------*/      
            $("#accountphone").removeClass("is-invalid");
	  		$("#accountphone").next().removeClass("invalid-feedback");
	  		$("#accountphone").next().html("");
	  		$("#accountphone").removeClass("is-valid");
            $("#accountphone").next().removeClass("valid-feedback");
        /*-------------------------------------------------------------*/      
            $("#accountaddr").removeClass("is-invalid");
	  		$("#accountaddr").next().removeClass("invalid-feedback");
	  		$("#accountaddr").next().html("");
	  		$("#accountaddr").removeClass("is-valid");
            $("#accountaddr").next().removeClass("valid-feedback");
        /*-------------------------------------------------------------*/  
            $("#checkSubmit").attr("disabled",true);
	    	/*-----------------------------------------------------*/	    	
	        $("#accountid").val("haofun");
	        /*-------------------------帳號驗證------------------------------*/
			            $("#accountid").addClass("is-valid");
			            $("#accountid").next().addClass("valid-feedback");
			            $("#accountid").next().html("帳號格式正確");
		    /*---------------------------------------------------------------*/
		    
		        	
	        $("#accountpwd").val("iiiEDU@05");
	        /*-------------------------密碼驗證------------------------------*/
			            $("#accountpwd").addClass("is-valid");
			            $("#accountpwd").next().addClass("valid-feedback");
			            $("#accountpwd").next().html("密碼格式正確");
	        /*---------------------------------------------------------------*/
	        
	        
	        $("#accountmail").val("hao84625@gmail.com");
	        /*-------------------------E-mail驗證------------------------------*/
			            $("#accountmail").addClass("is-valid");
			            $("#accountmail").next().addClass("valid-feedback");
			            $("#accountmail").next().html("Email格式正確");
	        /*---------------------------------------------------------------*/
	        $("#accountname").val("陳皓");
	        			$("#accountname").addClass("is-valid");
			            $("#accountname").next().addClass("valid-feedback");
			            $("#accountname").next().html("姓名格式正確");
	        $("#accountphone").val("0920350693");
	        			$("#accountphone").addClass("is-valid");
			            $("#accountphone").next().addClass("valid-feedback");
			            $("#accountphone").next().html("手機格式正確");
	        $("#radio1").prop("checked",true);
	        $("#accountaddr").val("淡水區淡海路231巷20號");
	         			$("#accountaddr").addClass("is-valid");
			            $("#accountaddr").next().addClass("valid-feedback");
			            $("#accountaddr").next().html("地址格式正確");        
	       
	       $("#agreecheck").prop('checked', 'checked')
	       
	       flag1=flag2=flag3=flag4=true;
	      
	       $("#checkSubmit").removeAttr("disabled");

	       
	        });
	        
	        
	  $("body").on("click", "#removeattr", function () {
	  		$("#accountid").removeClass("is-invalid");
	  		$("#accountid").next().removeClass("invalid-feedback");
	  		$("#accountid").next().html("");
	  		$("#accountid").removeClass("is-valid");
            $("#accountid").next().removeClass("valid-feedback");
       /*---------------------------------------------------------------*/
            $("#accountpwd").removeClass("is-invalid");
	  		$("#accountpwd").next().removeClass("invalid-feedback");
	  		$("#accountpwd").next().html("");
	  		$("#accountpwd").removeClass("is-valid");
            $("#accountpwd").next().removeClass("valid-feedback");
       /*---------------------------------------------------------------*/      
            $("#accountmail").removeClass("is-invalid");
	  		$("#accountmail").next().removeClass("invalid-feedback");
	  		$("#accountmail").next().html("");
	  		$("#accountmail").removeClass("is-valid");
            $("#accountmail").next().removeClass("valid-feedback");
       /*-------------------------------------------------------------*/      
            $("#accountname").removeClass("is-invalid");
	  		$("#accountname").next().removeClass("invalid-feedback");
	  		$("#accountname").next().html("");
	  		$("#accountname").removeClass("is-valid");
            $("#accountname").next().removeClass("valid-feedback");
        /*-------------------------------------------------------------*/      
            $("#accountphone").removeClass("is-invalid");
	  		$("#accountphone").next().removeClass("invalid-feedback");
	  		$("#accountphone").next().html("");
	  		$("#accountphone").removeClass("is-valid");
            $("#accountphone").next().removeClass("valid-feedback");
        /*-------------------------------------------------------------*/      
            $("#accountaddr").removeClass("is-invalid");
	  		$("#accountaddr").next().removeClass("invalid-feedback");
	  		$("#accountaddr").next().html("");
	  		$("#accountaddr").removeClass("is-valid");
            $("#accountaddr").next().removeClass("valid-feedback");
        /*-------------------------------------------------------------*/  
            $("#checkSubmit").attr("disabled",true);
            
 
	  });
	  
	  	  $("div").on("click", "#LoginTitle1", function () {
	  		 $("#inputAccount").val("ccliao");
	  		  $("#inputPassword").val("iiiEDU@08");
	  });
	   $("body").on("click", "#LoginTitle2", function () {
	    $("#inputAccount").val("xleo999");
	  		  $("#inputPassword").val("iiiEDU@03");
	   });
	    $("body").on("click", "#LoginTitle3", function () {
	     $("#inputAccount").val("redfly");
	  		  $("#inputPassword").val("iiiEDU@01");
	    });
	     $("body").on("click", "#LoginTitle4", function () {
	      $("#inputAccount").val("pureheart");
	  		  $("#inputPassword").val("iiiEDU@04");
	     });
	      $("body").on("click", "#LoginTitle5", function () {
	       $("#inputAccount").val("root");
	  		  $("#inputPassword").val("0000");
	      });
	       $("body").on("click", "#LoginTitle6", function () {
	        $("#inputAccount").val("haofun");
	  		  $("#inputPassword").val("iiiEDU@05");
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
