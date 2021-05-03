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
    	.tb1 img{
			max-width:150px;
			max-height:150px
		}
    </style>
    <script>
    	
        $(document).ready(function () {
            // 匯入include所有語句
            w3.includeHTML();
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
                <h1 class="h2">Products</h1>
                
                <!--Button trigger modal -->
                <div class="btn-toolbar mb-2 mb-md-0">
                    
                </div>
            </div>
            
            <!--main content start-->
            <div class="row">
                <div class="col-md-12">
                    <article>
                    	<h2>修改資料</h2>
                    	<jsp:useBean id="prod" scope="request" class="org.iiiEDU.model.Product" />
                    	<form method="POST" action="UpdateProduct_Root" enctype="multipart/form-data">
		            		<table class="tb1">
		            			<tr><td>產品編號</td><td><input type="text" name="id" value="${prod.id}" readonly></td></tr>
					            <tr><td>分類</td><td><input type="text" name="type" value="${prod.type}"></td></tr>
					            <tr><td>子分類</td><td><input type="text" name="subType" value="${prod.subType}"></td></tr>
								<tr><td>品牌名稱</td><td><input type="text" name="brandName" value="${prod.brandName}"></td></tr>
								<tr><td>產品名稱</td><td><input type="text" name="productName" value="${prod.productName}"></td></tr>
								<tr><td>售價</td><td><input type="text" name="price" value="${prod.price}"></td></tr>
								<tr><td>數量</td><td><input type="text" name="quantity" value="${prod.quantity}"></td></tr>
								<tr><td>庫存</td><td><input type="text" name="stock" value="${prod.stock}"></td></tr>
								<tr><td>產地</td><td><input type="text" name="place" value="${prod.place}"></td></tr>
								<tr><td>描述1</td><td><textarea name="comment1" rows="5" cols="60">${prod.comment1}</textarea></td></tr>
					            <tr><td>描述2</td><td><textarea name="comment2" rows="5" cols="60">${prod.comment2}</textarea></td></tr>
									
								<tr><td><br><td></tr>
								
					            <tr><td>圖片1</td>
					            	<td><input type="file" class="form-control-file" id="SetCatfile1" name="file1"></td>
					            	<td><img id="photo1" src="${prod.photo1}" onerror="imgchange()"></td>
					            </tr>
								<tr><td>圖片2</td>
									<td><input type="file" class="form-control-file" id="SetCatfile2" name="file2"></td>
									<td><img id="photo2" src="${prod.photo2}" onerror="imgchange()"></td>
								</tr>
					            <tr><td>圖片3</td>
					            	<td><input type="file" class="form-control-file" id="SetCatfile3" name="file3"></td>
					            	<td><img id="photo3" src="${prod.photo3}" onerror="imgchange()"></td>
					            </tr>
					            <tr><td colspan="3">
					            	<input type="submit" value="更新">
					            	<input type="button" value="取消" onclick="window.location.href='SelectAllProduct_Root'">
					            </td></tr>
				            </table>    
	    				</form>
					</article>
                </div>
            </div>
        </main>
    </div>
</div>
<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top" w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
<script>
	/*-------------------------圖片預覽-------------------------*/
	$('#SetCatfile1').change(function() {
		var file = $('#SetCatfile1')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo1').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	$('#SetCatfile2').change(function() {
		var file = $('#SetCatfile2')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo2').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	$('#SetCatfile3').change(function() {
		var file = $('#SetCatfile3')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo3').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	/*-------------------------圖片無法讀取顯示預設圖-----------------------------*/
    function imgchange(){
        var img=event.srcElement;
        img.src="assets\\img\\testlogo.jpg";
        img.onerror=null; //控制不要一直觸發錯誤
    }
    /*-------------------------滑鼠移入顯示全文-----------------------------*/
	$(".toolong").on("mouseenter", function() {
  	      if (!this.title) this.title = $(this).text();
 	});
</script>

</body>
</html>