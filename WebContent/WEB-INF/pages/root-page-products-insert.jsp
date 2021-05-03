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
	.tb1 img{
		max-width:150px;
		max-height:150px
	}

</style>
<script>
	$(document).ready(function() {
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
							<h2>新增資料</h2>
							<form method="POST" action="InsertProduct_Root" class="InsertProdForm"
								enctype="multipart/form-data">
								<table class="tb1">
									<tr>
										<td>分類</td>
										<td><input type="text" id="InsertProdType" name="type"></td>
									</tr>
									<tr>
										<td>子分類</td>
										<td><input type="text" id="InsertProdSubType" name="subType"></td>
									</tr>
									<tr>
										<td>品牌名稱</td>
										<td><input type="text" id="InsertProdBrandName" name="brandName"></td>
									</tr>
									<tr>
										<td>產品名稱</td>
										<td><input type="text" id="InsertProdName" name="productName"></td>
									</tr>
									<tr>
										<td>售價</td>
										<td><input type="text" id="InsertProdPrice" name="price"></td>
									</tr>
									<tr>
										<td>數量</td>
										<td><input type="text" id="InsertProdQuantity" name="quantity"></td>
									</tr>
									<tr>
										<td>庫存</td>
										<td><input type="text" id="InsertProdStock" name="stock"></td>
									</tr>
									<tr>
										<td>產地</td>
										<td><input type="text" id="InsertProdPlace" name="place"></td>
									</tr>
									<tr>
										<td>描述1</td>
										<td><textarea id="InsertProdComment1" name="comment1" rows="5" cols="60"></textarea></td>
									</tr>
									<tr>
										<td>描述2</td>
										<td><textarea id="InsertProdComment2" name="comment2" rows="5" cols="60"></textarea></td>
									</tr>
									<!-- 照片1 -->
									<tr>
										<td>圖片1</td>
										<td><input type="file" id="InsertProdFile1" class="form-control-file" name="file1"></td> 
										<td><img id="photo1" onerror="imgchange()"></td>
									</tr>
									
									<!-- 照片2 -->
									<tr>
										<td>圖片2</td>
										<td><input type="file" id="InsertProdFile2" class="form-control-file" name="file2"></td>
										<td><img id="photo2" onerror="imgchange()"></td>
									</tr>
									<!-- 照片3 -->
									<tr>
										<td>圖片3</td>
										<td><input type="file" id="InsertProdFile3" class="form-control-file" name="file3"></td>
										<td><img id="photo3" onerror="imgchange()"></td>	
									</tr>
									<tr>
										<td colspan="2">
											<input type="submit" value="新增">
											<input type="reset" value="重置">
											<input type="button" value="取消" onclick="window.location.href='SelectAllProduct_Root'">
											<input type="button" value="一鍵新增"  onclick="Newdata()">
										</td>
									</tr>
								</table>
							</form>
						</article>
					</div>
				</div>
			</main>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>		
<script>
	/*-------------------------圖片預覽-------------------------*/
	$('#InsertProdFile1').change(function() {
		var file = $('#InsertProdFile1')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo1').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	$('#InsertProdFile2').change(function() {
		var file = $('#InsertProdFile2')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo2').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	$('#InsertProdFile3').change(function() {
		var file = $('#InsertProdFile3')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#photo3').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
	/*-------------------------圖片無法讀取顯示預設圖---------------------------*/
	function imgchange(){
	    var img=event.srcElement;
	    img.src="assets\\img\\testlogo.jpg";
	    img.onerror=null; //控制不要一直觸發錯誤
	}
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
	}
</script>
</body>
</html>