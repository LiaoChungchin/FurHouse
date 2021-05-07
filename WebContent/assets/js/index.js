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

	// 匯入HTML
	w3.includeHTML();

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
		let peoplearr = [{account:"ccliao"   ,pwd:"iiiEDU@08"},
						 {account:"redfly"   ,pwd:"iiiEDU@01"},
						 {account:"pureheart",pwd:"iiiEDU@04"},
						 {account:"xleo999"  ,pwd:"iiiEDU@03"},
						 {account:"haofun"   ,pwd:"iiiEDU@05"},
						 {account:"squarewin",pwd:"iiiEDU@33"},
						 {account:"root"     ,pwd:"0000"}];
						 
		$("#inputAccount").val(peoplearr[index].account);
	  	$("#inputPassword").val(peoplearr[index].pwd);
		
	}
	
	  $("div").on("click", "#LoginTitle1", function () {
	  		 $("#inputAccount").val("ccliao");
	  		  $("#inputPassword").val("iiiEDU@08");
	  });
	

	

	

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
    
    // 會員登出把 local storage 清空
    
    
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
});