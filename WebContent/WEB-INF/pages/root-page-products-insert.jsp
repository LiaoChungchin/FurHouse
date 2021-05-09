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
<!-- Bootstrap CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-icons.css" rel="stylesheet">
<!-- User Define CSS -->
<link href="assets/css/index-root.css" rel="stylesheet">
<link href="assets/css/datatables.min.css" rel="stylesheet" />
<link href="assets/css/root-page-typeBrown.css" rel="stylesheet">
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="assets/js/w3.js"></script>
<script src="assets/js/jQuery-3.6.0.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/datatables.min.js"></script>

<title>*ROOT Products*</title>
<style type="text/css">
	.card:hover {
		border: 3px solid silver;
		box-shadow: 12px 12px 7px black;
	}
	img{
		max-width:150px;
		max-height:150px
	}
	.bd-example{
			width:70%;
			position: relative;
    		padding: 1rem;
   			margin: 3px;
   			border: solid #f8f9fa;
    		border-width: .2rem;
	}
</style>
<script>
	$(document).ready(function() {
		// 匯入include所有語句
		w3.includeHTML();
		
		//aside active
        $('.nav-item').children().attr("class","nav-link");
		$('.nav-item').eq(3).children().attr("class","nav-link active");
		
		//數字欄位輸入值為負值的處理
		$("body").on("blur","#InsertProdPrice,#InsertProdQuantity,#InsertProdStock",function(){
			let num = $(this).val();
			if(num<0){
				num = 0;
			}
			$(this).val(num);
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
        
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">商品管理</h1>
                
                <!--Button trigger modal -->
                <div class="btn-toolbar mb-2 mb-md-0">
                    
                </div>
            </div>
            
            <!--main content start-->
				<div class="row">
					<div class="col-md-12">
						<article>
							<h2 onclick="Newdata()" style="color: #A80000;">新增資料</h2>
							<div class="mt-4 bd-example">
								<form class="needs-validation" method="POST" action="InsertProduct_Root" enctype="multipart/form-data" id="prodForm">
									<div class="row mb-4">
										<div class="col">
											<label class="form-label" for="InsertProdName">產品名稱</label>
											<input type="text" class="form-control" id="InsertProdName" name="productName">
											<div class="invalid-feedback" id="prodName-feedback"></div>
										</div>
										<div class="col">
											<label class="form-label" for="InsertProdBrandName">品牌</label>
											<input type="text" class="form-control" id="InsertProdBrandName" name="brandName">
											<div class="invalid-feedback" id="prodBrandName-feedback"></div>
										</div>
									</div>
									<div class="row mb-4">
										<div class="col">
											<label class="form-label" for="InsertProdType">分類</label>
											<input type="text" class="form-control" id="InsertProdType" name="type">
											<div class="invalid-feedback" id="prodType-feedback"></div>
										</div>
										<div class="col">
											<label class="form-label" for="InsertProdSubType">子分類</label>
											<input type="text" class="form-control" id="InsertProdSubType" name="subType">
											<div class="invalid-feedback" id="prodSubType-feedback"></div>
										</div>
										<div class="col">
											<label class="form-label" for="InsertProdPlace">產地</label>
											<input type="text" class="form-control" id="InsertProdPlace" name="place">
											<div class="invalid-feedback" id="prodPlace-feedback"></div>
										</div>
									</div>
									<!-- Number input -->
									<div class="row mb-4">
										<div class="col">
											<label class="form-label" for="InsertProdPrice">售價</label>
											<div class="form-outline">
											    <input type="number" class="form-control" id="InsertProdPrice" name="price">
											</div>
											<div class="invalid-feedback" id="prodPrice-feedback"></div>
									  	</div>
									  	<div class="col">
									  		<label class="form-label" for="InsertProdQuantity">數量</label>
										  	<div class="form-outline">
											    <input type="number" class="form-control" id="InsertProdQuantity" name="quantity">
											</div>
									  	</div>
									  	<div class="col">
									  		<label class="form-label" for="InsertProdStock">庫存</label>
										  	<div class="form-outline">
											    <input type="number" class="form-control" id="InsertProdStock" name="stock">
											</div>
									  	</div>
									</div>
									
									<!-- Message input -->
									<div class="form-outline mb-4">
										<label class="form-label" for="InsertProdComment1">描述1</label>
									    <textarea class="form-control" id="InsertProdComment1" name="comment1" rows="4"></textarea>
									</div>
									<div class="form-outline mb-4">
										<label class="form-label" for="InsertProdComment2">描述2</label>
									    <textarea class="form-control" id="InsertProdComment2" name="comment2" rows="4"></textarea>
									</div>
									<!-- Picture Input -->
									<div class="row mb-5">	
										<div class="col">
											<label class="form-label" for="InsertProdFile1">圖片1</label>&nbsp;&nbsp;
											<label class="btn btn-primary">
												<input type="file" accept="image/*" class="form-control-file" id="InsertProdFile1" name="file1" style="display:none;">
								            	<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
							            	</label>
							            	<img id="photo1">
							            	<div id="test1" style="color:red">至少須上傳一張圖</div>
							            </div>
										<div class="col invisible" id="ShowFile2">
										<label class="form-label" for="InsertProdFile2">圖片2</label>
											<label class="btn btn-primary">
												<input type="file" accept="image/*" class="form-control-file" id="InsertProdFile2" name="file2" style="display:none;">
								            	<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
							            	</label>
							            	<img id="photo2">
							            </div>
										<div class="col invisible" id="ShowFile3">
										<label class="form-label" for="InsertProdFile3">圖片3</label>
											<label class="btn btn-primary">
												<input type="file" accept="image/*" class="form-control-file" id="InsertProdFile3" name="file3" style="display:none;">
								            	<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
							            	</label>
							            	<img id="photo3">
							             </div>
									</div>
									<!-- Submit button -->
									<div class="row justify-content-center">
										<div class="col-2">
											<button type="submit" class="btn btn-primary btn-block mb-4" id="checkSubmit" disabled>新增</button>
										</div>
										<div class="col-2">
											<button type="reset"  class="btn btn-secondary btn-block mb-4" id="InsertProductReset">重置</button>
										</div>
										<div class="col-2">
											<input type="button" value="取消" class="btn btn-secondary btn-block mb-4" onclick="window.location.href='SelectAllProduct_Root'">
										</div>
									</div>
								</form>
							</div>
						</article>
					</div>
				</div>
			</main>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>		
<script>
	//---------------------表單驗證---------------------
	let flag1=false,flag2=false,flag3=false,flag4=false,flag5=false,flag6=false;
	
	//---------------------驗證ProdName---------------------
	$("body").on("blur","#InsertProdName",function(){
		let insertProdName = document.getElementById("InsertProdName");
		let feedback = document.getElementById("prodName-feedback");
		insertProdName.classList.remove("is-valid");
		insertProdName.classList.remove("is-invalid");
		//不能为空
	    if(insertProdName.value==""){
	    	feedback.innerHTML ="請輸入產品名稱";
	    	insertProdName.classList.remove("is-valid");//清除合法狀態
	    	insertProdName.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag1 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(insertProdName.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	insertProdName.classList.remove("is-valid");
		    	insertProdName.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag1 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        insertProdName.classList.remove("is-invalid");
		        insertProdName.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag1 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	
	//---------------------驗證ProdBrandName---------------------
	$("body").on("blur","#InsertProdBrandName",function(){
		let insertProdBrandName = document.getElementById("InsertProdBrandName");
		let feedback = document.getElementById("prodBrandName-feedback");
		insertProdBrandName.classList.remove("is-valid");
		insertProdBrandName.classList.remove("is-invalid");
		//不能为空
	    if(insertProdBrandName.value==""){
	    	feedback.innerHTML ="請輸入品牌名稱";
	    	insertProdBrandName.classList.remove("is-valid");//清除合法狀態
	    	insertProdBrandName.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag2 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(insertProdBrandName.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	insertProdBrandName.classList.remove("is-valid");
		    	insertProdBrandName.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag2 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        insertProdBrandName.classList.remove("is-invalid");
		        insertProdBrandName.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag2 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	//---------------------驗證ProdType---------------------
	$("body").on("blur","#InsertProdType",function(){
		let insertProdType = document.getElementById("InsertProdType");
		let feedback = document.getElementById("prodType-feedback");
		insertProdType.classList.remove("is-valid");
		insertProdType.classList.remove("is-invalid");
		//不能为空
	    if(insertProdType.value==""){
	    	feedback.innerHTML ="請輸入產品分類";
	    	insertProdType.classList.remove("is-valid");//清除合法狀態
	    	insertProdType.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag3 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(insertProdType.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	insertProdType.classList.remove("is-valid");
		    	insertProdType.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag3 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        insertProdType.classList.remove("is-invalid");
		        insertProdType.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag3 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	//---------------------驗證ProdSubType---------------------
	$("body").on("blur","#InsertProdSubType",function(){
		let insertProdSubType = document.getElementById("InsertProdSubType");
		let feedback = document.getElementById("prodSubType-feedback");
		insertProdSubType.classList.remove("is-valid");
		insertProdSubType.classList.remove("is-invalid");
		//不能为空
	    if(insertProdSubType.value==""){
	    	feedback.innerHTML ="請輸入產品子分類";
	    	insertProdSubType.classList.remove("is-valid");//清除合法狀態
	    	insertProdSubType.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag4 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(insertProdSubType.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	insertProdSubType.classList.remove("is-valid");
		    	insertProdSubType.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag4 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        insertProdSubType.classList.remove("is-invalid");
		        insertProdSubType.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag4 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	//---------------------驗證ProdPlace---------------------
	$("body").on("blur","#InsertProdPlace",function(){
		let insertProdPlace = document.getElementById("InsertProdPlace");
		let feedback = document.getElementById("prodPlace-feedback");
		insertProdPlace.classList.remove("is-valid");
		insertProdPlace.classList.remove("is-invalid");
		//不能为空
	    if(insertProdPlace.value==""){
	    	feedback.innerHTML ="請輸入產地名";
	    	insertProdPlace.classList.remove("is-valid");//清除合法狀態
	    	insertProdPlace.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag5 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(insertProdPlace.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	insertProdPlace.classList.remove("is-valid");
		    	insertProdPlace.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag5 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        insertProdPlace.classList.remove("is-invalid");
		        insertProdPlace.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag5 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	/*-------------------------圖片預覽 驗證-------------------------*/
	$('#InsertProdFile1').change(function() {
		var file = $('#InsertProdFile1')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo1').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
		$("#test1").html("");
		$("#ShowFile2").removeClass("invisible");
		flag6 = true;
		
		if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6==true){
			$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	
	$('#InsertProdFile2').change(function() {
		var file = $('#InsertProdFile2')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo2').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
		$("#ShowFile3").removeClass("invisible");
	});
	
	$('#InsertProdFile3').change(function() {
		var file = $('#InsertProdFile3')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo3').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	/*-----------------------按reset重置所有屬性-----------------------*/
	$("#InsertProductReset").on("click",function(){
		let form = $('#prodForm');
		form.find('#prodName-feedback,#prodBrandName-feedback,#prodType-feedback,#prodSubType-feedback,#prodPlace-feedback').innerHTML = '';
		$("#photo1").attr('src',"");
		$("#photo2").attr('src',"");
		$("#photo3").attr('src',"");
		$("#ShowFile2").addClass("invisible");
		$("#ShowFile3").addClass("invisible");
		$("#test1").html("至少須上傳一張圖 ");
		$("#InsertProdName").removeClass("is-valid");
		$("#InsertProdName").removeClass("is-invalid");
		$("#InsertProdBrandName").removeClass("is-valid");
		$("#InsertProdBrandName").removeClass("is-invalid");
		$("#InsertProdType").removeClass("is-valid");
		$("#InsertProdType").removeClass("is-invalid");
		$("#InsertProdSubType").removeClass("is-valid");
		$("#InsertProdSubType").removeClass("is-invalid");
		$("#InsertProdPlace").removeClass("is-valid");
		$("#InsertProdPlace").removeClass("is-invalid");
		$("#checkSubmit").attr("disabled",true);
	});
	
	/*-------------------------一鍵新增input------------------------------*/ 
	function Newdata(){   	
	    $("#InsertProdType").val("生活用品");
	    $("#InsertProdSubType").val("外出提籠");
	    $("#InsertProdBrandName").val("PETKIT佩奇");
	    $("#InsertProdName").val("PETKIT佩奇 智能貓用背包 (寵物外出包)");
	    $("#InsertProdPrice").val("2880");
	    $("#InsertProdQuantity").val("10");
	    $("#InsertProdStock").val("0");
	    $("#InsertProdPlace").val("台灣");
	    $("#InsertProdComment1").val("外出總是大包小包，根本無法好好照顧毛孩。PETKIT佩奇智能貓背包聽到毛爸媽的心聲啦!太空艙等級的寵物外出包，不僅體積輕巧、重量輕，減壓背帶設計，長途旅行再也不怕肩頸痠痛。");
	    $("#InsertProdComment2").val("此款適合8KG以下的貓咪，小型犬也適用唷!");
	    flag1=true;flag2=true;flag3=true;flag4=true;flag5=true;
	    $("#InsertProdName").removeClass("is-invalid");
	    $("#InsertProdBrandName").removeClass("is-invalid");
	    $("#InsertProdType").removeClass("is-invalid");
	    $("#InsertProdSubType").removeClass("is-invalid");
	    $("#InsertProdPlace").removeClass("is-invalid");
	    $("#InsertProdName").addClass("is-valid");
	    $("#InsertProdBrandName").addClass("is-valid");
	    $("#InsertProdType").addClass("is-valid");
	    $("#InsertProdSubType").addClass("is-valid");
	    $("#InsertProdPlace").addClass("is-valid");
	}
	
</script>
</body>
</html>