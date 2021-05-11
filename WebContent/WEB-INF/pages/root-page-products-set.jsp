<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,org.iiiEDU.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="assets/css/index-root.css" rel="stylesheet">
    <link href="assets/css/datatables.min.css" rel="stylesheet" />
    <link href="assets/css/root-page-typeBrown.css" rel="stylesheet">
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="assets/js/w3.js"></script>
    <script src="assets/js/jQuery-3.6.0.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/datatables.min.js"></script>
	
    <title>*ROOT*</title>
    <style type="text/css">
    	.card:hover{
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
    	
        $(document).ready(function () {
            // 匯入include所有語句
            w3.includeHTML();
            
         	//aside active
            $('.nav-item').children().attr("class","nav-link");
			$('.nav-item').eq(3).children().attr("class","nav-link active");
			
			//數字欄位輸入值為負值的處理
			$("body").on("blur","#SetProdPrice,#SetProdQuantity,#SetProdStock",function(){
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
                    	<h2 style="color: #A80000;">修改資料</h2>
                    	<div class="mt-4 bd-example">
                    	
	    				<jsp:useBean id="prod" scope="request" class="org.iiiEDU.model.Product" />
	    				<form class="needs-validation" method="POST" action="UpdateProduct_Root" enctype="multipart/form-data">
							<div class="form-group row">
								<label class="col-1 form-label" for="SetProdId">產品編號</label>
								<div class="col-2">
									<input type="text" class="form-control-plaintext" id="SetProdId" name="id" value="${prod.id}" readonly/>
								</div>
							</div>
							<div class="row mb-4">
								<div class="col">
									<label class="form-label" for="SetProdName">產品名稱</label>
									<input type="text" class="form-control" id="SetProdName" name="productName" value="${prod.productName}"/>
									<div class="invalid-feedback" id="prodName-feedback"></div>
								</div>
								<div class="col">
									<label class="form-label" for="SetProdBrandName">品牌</label>
									
									<input type="text" class="form-control" id="SetProdBrandName" name="brandName" value="${prod.brandName}"/>
									<div class="invalid-feedback" id="prodBrandName-feedback"></div>
								</div>
							</div>
							<div class="row mb-4">
								<div class="col">
									<label class="form-label" for="SetProdType">分類</label>
									<input type="text" class="form-control" id="SetProdType" name="type" value="${prod.type}"/>
									<div class="invalid-feedback" id="prodType-feedback"></div>
								</div>
								<div class="col">
									<label class="form-label" for="SetProdSubType">子分類</label>
									<input type="text" class="form-control" id="SetProdSubType" name="subType" value="${prod.subType}"/>
									<div class="invalid-feedback" id="prodSubType-feedback"></div>
								</div>
								<div class="col">
									<label class="form-label" for="SetProdPlace">產地</label>
							    	<input type="text" class="form-control" id="SetProdPlace" name="place" value="${prod.place}"/>
									<div class="invalid-feedback" id="prodPlace-feedback"></div>
								</div>
							</div>
							<!-- Number input -->
							<div class="row mb-4">
								<div class="col">
									<label class="form-label" for="SetProdPrice">售價</label>
									
									<input type="number" class="form-control" id="SetProdPrice" name="price" value="${prod.price}"/>
									
							  	</div>
							  	<div class="col">
							  		<label class="form-label" for="SetProdQuantity">數量</label>
								  	
									<input type="number" class="form-control" id="SetProdQuantity" name="quantity" value="${prod.quantity}"/>
									
							  	</div>
							  	<div class="col">
							  		<label class="form-label" for="SetProdStock">庫存</label>
								  	
									<input type="number" class="form-control" id="SetProdStock" name="stock" value="${prod.stock}"/>
									
							  	</div>
							</div>
							
							<!-- Message input -->
							<div class="form-outline mb-4">
								<label class="form-label" for="SetProdComment1">描述1</label>
							    <textarea class="form-control" id="SetProdComment1" name="comment1" rows="4">${prod.comment1}</textarea>
							</div>
							<div class="form-outline mb-4">
								<label class="form-label" for="SetProdComment2">描述2</label>
							    <textarea class="form-control" id="SetProdComment2" name="comment2" rows="4">${prod.comment2}</textarea>
							</div>
							<!-- Picture Input -->
							<div class="row mb-5">	
								<div class="col">
									<label class="form-label" for="SetProdFile1">圖片1</label>&nbsp;&nbsp;
									<label class="btn btn-primary">
										<input type="file" accept="image/*" class="form-control-file" id="SetProdFile1" name="file1" style="display:none;">
										<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
									</label>
									<img id="photo1" src="prodImageToByte?path=${prod.photo1}" onerror="imgchange()">
								</div>
								<div class="col">
									<label class="form-label" for="SetProdFile2">圖片2</label>&nbsp;&nbsp;
									<label class="btn btn-primary">
										<input type="file" accept="image/*" class="form-control-file" id="SetProdFile2" name="file2" style="display:none;">
						            	<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
					            	</label>
					            	
					            	<c:choose>
										<c:when test="${prod.photo2!=null}">
						            		<img id="photo2" src="prodImageToByte?path=${prod.photo2}">
						            	</c:when>
										<c:otherwise>
											<img id="photo2">
										</c:otherwise>
					            	</c:choose>
					       		</div>
									<c:choose>
									<c:when test="${prod.photo2!=null}">
									<div class="col">
										<label class="form-label" for="SetProdFile3">圖片3</label>
										<label class="btn btn-primary">
											<input type="file" accept="image/*" class="form-control-file" id="SetProdFile3" name="file3" style="display:none;">
							            	<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
						            	</label>
						            	<c:choose>
										<c:when test="${prod.photo3!=null}">
						            		<img id="photo3" src="prodImageToByte?path=${prod.photo3}">
						            	</c:when>
										<c:otherwise>
											<img id="photo3">
										</c:otherwise>
					            	</c:choose>
					            	</div>
									</c:when>
									<c:otherwise>
									<div class="col invisible" id="ShowFile3">
										<label class="form-label" for="SetProdFile3">圖片3</label>
										<label class="btn btn-primary">
											<input type="file" accept="image/*" class="form-control-file" id="SetProdFile3" name="file3" style="display:none;">
							            	<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
						            	</label>
						            	<img id="photo3">
					            	</div>
									</c:otherwise>
					          	  </c:choose>
								</div>
							</div>
							<!-- Submit button -->
							<div class="row justify-content-center">
								<div class="col-2">
									<button type="submit" class="btn btn-primary btn-block mb-4" id="checkSubmit">更新</button>
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
<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top" w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
<script>
	/*-------------------------圖片預覽-------------------------*/
	$('#SetProdFile1').change(function() {
		var file = $('#SetProdFile1')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo1').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	$('#SetProdFile2').change(function() {
		var file = $('#SetProdFile2')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo2').attr('src', e.target.result);
			$("#ShowFile3").removeClass("invisible");
		};
		reader.readAsDataURL(file);
	});
	
	$('#SetProdFile3').change(function() {
		var file = $('#SetProdFile3')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo3').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
    /*-------------------------滑鼠移入顯示全文-----------------------------*/
	$(".toolong").on("mouseenter", function() {
  	      if (!this.title) this.title = $(this).text();
 	});
	
    //---------------------表單驗證---------------------
    let flag1=true,flag2=true,flag3=true,flag4=true,flag5=true;
	$("#SetProdName").addClass("is-valid");
	$("#SetProdBrandName").addClass("is-valid");
	$("#SetProdType").addClass("is-valid");
	$("#SetProdSubType").addClass("is-valid");
	$("#SetProdPlace").addClass("is-valid");
	//---------------------驗證ProdName---------------------
	$("body").on("blur","#SetProdName",function(){
		let setProdName = document.getElementById("SetProdName");
		let feedback = document.getElementById("prodName-feedback");
		setProdName.classList.remove("is-valid");
		setProdName.classList.remove("is-invalid");
		//不能为空
	    if(setProdName.value==""){
	    	feedback.innerHTML ="請輸入產品名稱";
	    	setProdName.classList.remove("is-valid");//清除合法狀態
	        setProdName.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag1 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(setProdName.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	setProdName.classList.remove("is-valid");
		        setProdName.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag1 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		    	setProdName.classList.remove("is-invalid");
		        setProdName.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag1 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	
	//---------------------驗證ProdBrandName---------------------
	$("body").on("blur","#SetProdBrandName",function(){
		let setProdBrandName = document.getElementById("SetProdBrandName");
		let feedback = document.getElementById("prodBrandName-feedback");
		setProdBrandName.classList.remove("is-valid");
		setProdBrandName.classList.remove("is-invalid");
		//不能为空
	    if(setProdBrandName.value==""){
	    	feedback.innerHTML ="請輸入品牌名稱";
	    	setProdBrandName.classList.remove("is-valid");//清除合法狀態
	    	setProdBrandName.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag2 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(setProdBrandName.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	setProdBrandName.classList.remove("is-valid");
		    	setProdBrandName.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag2 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        setProdBrandName.classList.remove("is-invalid");
		        setProdBrandName.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag2 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	//---------------------驗證ProdType---------------------
	$("body").on("blur","#SetProdType",function(){
		let setProdType = document.getElementById("SetProdType");
		let feedback = document.getElementById("prodType-feedback");
		setProdType.classList.remove("is-valid");
		setProdType.classList.remove("is-invalid");
		//不能为空
	    if(setProdType.value==""){
	    	feedback.innerHTML ="請輸入產品分類";
	    	setProdType.classList.remove("is-valid");//清除合法狀態
	    	setProdType.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag3 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(setProdType.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	setProdType.classList.remove("is-valid");
		    	setProdType.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag3 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        setProdType.classList.remove("is-invalid");
		        setProdType.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag3 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	//---------------------驗證ProdSubType---------------------
	$("body").on("blur","#SetProdSubType",function(){
		let setProdSubType = document.getElementById("SetProdSubType");
		let feedback = document.getElementById("prodSubType-feedback");
		setProdSubType.classList.remove("is-valid");
		setProdSubType.classList.remove("is-invalid");
		//不能为空
	    if(setProdSubType.value==""){
	    	feedback.innerHTML ="請輸入產品子分類";
	    	setProdSubType.classList.remove("is-valid");//清除合法狀態
	    	setProdSubType.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag4 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(setProdSubType.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	setProdSubType.classList.remove("is-valid");
		    	setProdSubType.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag4 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        setProdSubType.classList.remove("is-invalid");
		        setProdSubType.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag4 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};
	});
	//---------------------驗證ProdPlace---------------------
	$("body").on("blur","#SetProdPlace",function(){
		let setProdPlace = document.getElementById("SetProdPlace");
		let feedback = document.getElementById("prodPlace-feedback");
		setProdPlace.classList.remove("is-valid");
		setProdPlace.classList.remove("is-invalid");
		//不能为空
	    if(setProdPlace.value==""){
	    	feedback.innerHTML ="請輸入產地名";
	    	setProdPlace.classList.remove("is-valid");//清除合法狀態
	    	setProdPlace.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag5 = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(setProdPlace.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	setProdPlace.classList.remove("is-valid");
		    	setProdPlace.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag5 = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        setProdPlace.classList.remove("is-invalid");
		        setProdPlace.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag5 = true;
		    }
	    }if(flag1&&flag2&&flag3&&flag4&&flag5==true){
		$("#checkSubmit").removeAttr("disabled"); 
		};		
	});
	
	function Valdation(ID,feedbackID,flag){
		let setProd = document.getElementById(ID);
		let feedback = document.getElementById(feedbackID);
		setProd.classList.remove("is-valid");
		setProd.classList.remove("is-invalid");
		//不能为空
	    if(setProd.value==""){
	    	feedback.innerHTML ="請輸入產地名";
	    	setProd.classList.remove("is-valid");//清除合法狀態
	    	setProd.classList.add("is-invalid");//添加非法狀態
	        $("#checkSubmit").attr("disabled",true);//添加禁用
	        flag = false;
	    }else{
	    	//不能有特殊符号
		    let patrn = /[@#\$%\^&\*]+/g;//正則表達式
		    if(patrn.exec(setProd.value)){
		    	feedback.innerHTML ="請勿輸入特殊符號";
		    	setProd.classList.remove("is-valid");
		    	setProd.classList.add("is-invalid");
		        $("#checkSubmit").attr("disabled",true);
		        flag = false;
		    }else{
		    	//清除错误提示，改成成功提示
		        $("#checkSubmit").attr("disabled",true);
		        setProd.classList.remove("is-invalid");
		        setProd.classList.add("is-valid");
		        feedback.innerHTML="";
			    flag = true;
		    }
	    }
		if(flag1&&flag2&&flag3&&flag4&&flag5==true){
			$("#checkSubmit").removeAttr("disabled"); 
		};		
	}
</script>
</body>
</html>