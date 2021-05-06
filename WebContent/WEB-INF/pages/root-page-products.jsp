<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="assets/css/croppie.css" rel="stylesheet">
    <!-- User Define CSS -->
    <link href="assets/css/index-root.css" rel="stylesheet">
    <link href="assets/css/datatables.min.css" rel="stylesheet" />
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="assets/js/w3.js"></script>
    <script src="assets/js/jQuery-3.6.0.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- User Define JS -->
	<script src="assets/js/datatables.min.js"></script>
	<script src="assets/js/croppie.min.js"></script>
	
    <title>*ROOT*</title>
    
    <style>
    	.allProdtb {
    		text-align:center;
            table-layout: fixed;           
        }
        .allProdtb img{
			max-width:80px;
			max-height:80px
		}
		.allProdtb .even{
			background-color:#F0F0F0;
		}
		.allProdtb td{
			border-right: 1px solid #E0E0E0;
		}
		.allProdtb td:last-child{
			border-right: 0px solid #E0E0E0;
		}
		.allProdtb tbody tr:hover{
			background-color:#D0D0D0;
		}
    	.toolong{
            width:90px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    	
    </style>
    <script>
        $(document).ready(function () {
            // 匯入include所有語句
            w3.includeHTML();
            
            //aside active
            $('.nav-item').children().attr("class","nav-link");
			$('.nav-item').eq(3).children().attr("class","nav-link active");
            
            $('#allProdtb').removeAttr('width').DataTable({
	        	"columnDefs": [
	        		{ "width": "4%",className: 'dt-body-center', "targets": 0 },
	        		{ "width": "7%",className: 'dt-body-center', "targets": 1 },
	        		{ "width": "7%",className: 'dt-body-center', "targets": 2 },
	        		{ "width": "7%",className: 'dt-body-center', "targets": 3 },
	        		{ "width": "8%",className: 'dt-body-center', "targets": 4 },
	        		{ "width": "6%",className: 'dt-body-center', "targets": 5 },
	        		{ "width": "6%",className: 'dt-body-center', "targets": 6 },
	        		{ "width": "7%",className: 'dt-body-center', "targets": 7 },
	        		{ "width": "4%",className: 'dt-body-center', "targets": 8 },
	        		{ "width": "4%",className: 'dt-body-center', "targets": 9 },
	        		{ "width": "4%",className: 'dt-body-center', "targets": 10 },
	        		{ "width": "5%",className: 'dt-body-center', "targets": 11 },
	        		{ "width": "10%",className: 'dt-body-center', "targets": 12 },
	        		{ "width": "8%",className: 'dt-body-center', "targets": 13 },
	        		{ "width": "8%",className: 'dt-body-center', "targets": 14 },
	        		{ "width": "8%",className: 'dt-body-center', "targets": 15 },
	        	]
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
                <h1 class="h2">Products</h1>
                
                <!--Button trigger modal -->
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <input type="button" class="btn btn-primary" id="insertProduct" value="新增資料" />
                    </div>
              
                </div>
            </div>
            
            <!--main content start-->
            <div class="row">
                <div class="col-md-12">
                    <article>
						<table class="allProdtb" id="allProdtb" style="width:121%">
							<thead>
								<tr>
	                                <th>編號</th>
	                                <th>圖片1</th>
	                                <th>圖片2</th>
									<th>圖片3</th>               
	                                <th>產品名稱</th>
	                                <th>分類</th>
	                                <th>子分類</th>
	                                <th>品牌</th>                               
	                                <th>售價</th>
	                                <th>數量</th>
	                                <th>庫存</th>
	                                <th>產地</th>
	                                <th>功能</th>	                                
	                                <th class="toolong">更新時間</th>                           
	                                <th class="toolong">描述1</th>
	                                <th class="toolong">描述2</th>								                             
	                            </tr>
	                        </thead>
	                        <tbody>
								<c:forEach items="${prods}" var="prod" varStatus="s">
									<tr id="${prod.id}">
										<td>${prod.id}</td>
										<td><img class="figure-img img-fluid rounded" src="prodImageToByte?path=${prod.photo1}" alt="喵~" onerror="imgchange()"></td>
										<td><img class="figure-img img-fluid rounded" src="prodImageToByte?path=${prod.photo2}" alt="喵~" onerror="imgchange()"></td>
										<td><img class="figure-img img-fluid rounded" src="prodImageToByte?path=${prod.photo3}" alt="喵~" onerror="imgchange()"></td>					
										<td>${prod.productName}</td>
										<td>${prod.type}</td>
										<td>${prod.subType}</td>
										<td>${prod.brandName}</td>									
										<td>${prod.price}</td>
										<td>${prod.quantity}</td>
										<td>${prod.stock}</td>
										<td>${prod.place}</td>
										<td>
											<div class="btn-group" role="group">
												<button type="button" class="btn btn-primary" id="update${prod.id}" 
	                     						onclick="goSetProduct(this)">修改</button>
												<button type="button" class="btn btn-primary" id="del${prod.id}"
												onclick="delProduct(this)">刪除</button>
											</div>
										</td>
										
										<td>${prod.updateDate}</td>		
										<td class="toolong">${prod.comment1}</td>
										<td class="toolong">${prod.comment2}</td>																	
														
										<c:set var="count" value="${s.count}"></c:set>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<h2 class="allProdCount">共${count}筆</h2>
					</article>
                </div>
            </div>
        </main>
    </div>
</div>
<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top" w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
<script>
	/*------------------------前往新增頁面--------------------------*/
    document.getElementById("insertProduct").addEventListener("click",function(){
    	window.location.href = "goInsertProduct";
    });
	
    /*----------------------指定任一產品做修改-----------------------*/
    function goSetProduct(myObj){
    	let prodNo = myObj.id.substr(6); /* substr(6) : update${prod.id} > ${prod.id}*/
    	window.location.href = "SetProduct_Root?SetProductByID="+ prodNo;
    }
    
    /*----------------------指定任一產品做刪除-----------------------*/
    function delProduct(myObj) {
    	let prodNo = myObj.id.substr(3); /* substr(3) : del${prod.id} > ${prod.id}*/
		if (confirm('確定要刪除嗎?')) {
			window.location.href = "DeleteProduct_Root?DeleteProductByID=" + prodNo;
			return true;
		}
		return false;
	}
    
    /*-------------------------滑鼠移入顯示全文-----------------------------*/
	$(".toolong").on("mouseenter", function() {
  	      if (!this.title) this.title = $(this).text();
 	});
    
    /*-------------------------圖片無法讀取顯示預設圖-----------------------------*/
    function imgchange(){
        var img=event.srcElement;
        img.src="assets/img/Catbow-nobg.png";
        img.onerror=null; //控制不要一直觸發錯誤
    }
    
</script>
</body>
</html>