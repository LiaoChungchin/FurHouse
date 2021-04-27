<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<link href="assets/css/croppie.css" rel="stylesheet">
	
	<style>
		.allCattb{
			table-layout:fixed;
		}
		.allCattb img{
			max-width:100px;
			max-height:100px
		}
		.allCattb .odd{
			background-color:#f9f9f9;
		}
		.allCattb td{
			border-right: 1px solid #E0E0E0;
		}
		.allCattb td:last-child{
			border-right: 0px solid #E0E0E0;
		}
		.toolong{
		    width: 120px;
			white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		}
	</style>
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	
	<!-- User Define JS -->
	<script src="assets/js/datatables.min.js"></script>
	<script src="assets/js/croppie.min.js"></script>
	
	<script>
	    $(document).ready(function () {
	        // 匯入include所有語句
	        w3.includeHTML();
	        
			$('.nav-item').children().attr("class","nav-link");
	        $('.nav-item').eq(5).children().attr("class","nav-link active");
	        
	        $('#allCattb').removeAttr('width').DataTable({
	        	"ordering": false,
	        	"columnDefs": [
	        		{ "width": "6%",className: 'dt-body-left', "targets": 0 },
	        		{ "width": "6%",className: 'dt-body-left', "targets": 1 },
	        		{ "width": "6%",className: 'dt-body-left', "targets": 2 },
	        		{ "width": "6%",className: 'dt-body-left', "targets": 3 },
	        		{ "width": "6%",className: 'dt-body-left', "targets": 4 },
	        		{ "width": "6%",className: 'dt-body-left', "targets": 5 },
	        		{ "width": "9%",className: 'dt-body-left', "targets": 6 },
	        		{ "width": "9%",className: 'dt-body-left', "targets": 7 },
	        		{ "width": "7%",className: 'dt-body-left', "targets": 8 },
	        		{ "width": "7%",className: 'dt-body-left', "targets": 9 },
	        		{ "width": "10%",className: 'dt-body-left', "targets": 10 },
	        		{ "width": "10%",className: 'dt-body-left', "targets": 11 },
	        		{ "width": "12%",className: 'dt-body-left', "targets": 12 },
	        	]
	        }); 
	    });
	</script>
	
	<title>*ROOT*</title>
	
</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow" w3-include-html="<c:url value='/addFrame.controller/rootheader' />"></nav>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" w3-include-html="<c:url value='/addFrame.controller/rootaside' />"></nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				
				<!-- ###置入本頁資訊### -->
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">CatPage</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<!--Button trigger modal -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							id="InsertCatDiologBtn" data-target="#InsertCatModalCenter">新增資料</button>
					</div>
				</div>
				<!--main content start-->
				<section id="main-content">
					<section class="wrapper">
						<div class="row">
							<div class="col-md-12">
								<article class="allCat">
									<!---------------------------------------------------------------------新增頁面-------------------------------------------------->
									<!-- Modal -->
									<div class="modal fade" id="InsertCatModalCenter" tabindex="-1"
										role="dialog" aria-labelledby="InsertCatModalCenterTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered modal-lg"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="InsertCatModalCenterTitle" onclick="Newdata()">新增資料</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form method="POST" action="insertCat.controller" class="InsertCatForm"
														id="InsertCatForm" enctype="multipart/form-data">
														<!-- 名字 -->
														<div class="form-group row">
															<label for="InsertCatInputName"
																class="col-sm-2 col-form-label">名字</label>
															<div class="col-sm-10">
																<input type="text" class="form-control"
																	id="InsertCatInputName" placeholder="Enter Name"
																	name="nickname"> <small id="nameHelp"
																	class="form-text text-muted"></small>
															</div>
														</div>
														<!-- 樣式 --><!-- 性別 -->
														<div class="form-group row">
															<label for="InsertCatInputType"
																class="col-sm-2 col-form-label">樣式</label>
															<div class="col-sm-4">
																<input type="text" class="form-control"
																	id="InsertCatInputType" placeholder="Enter Type"
																	name="type"> <small id="typeHelp"
																	class="form-text text-muted"></small>
															</div>
															<label class="col-form-label col-sm-2">性別</label>
															<div class="col-sm-4">
																<div class="form-check form-check-inline col-form-label" >
																	<input class="form-check-input" type="radio"
																		name="gender" id="InsertCatgender1" value="男" checked>
																	<label class="form-check-label" for="InsertCatgender1">男</label>
																</div>
																<div class="form-check form-check-inline col-form-label">
																	<input class="form-check-input" type="radio"
																		name="gender" id="InsertCatgender2" value="女">
																	<label class="form-check-label" for="InsertCatgender2">女</label>
																</div>
															</div>
														</div>
														<!-- 結紮 --><!-- 接種 -->
														<div class="form-group row">
															<label class="col-form-label col-sm-2">結紮</label>
															<div class="col-sm-4">
																<div class="form-check form-check-inline col-form-label">
																	<input class="form-check-input" type="radio"
																		name="ligation" id="InsertCatisLigation1" value="1">
																	<label class="form-check-label"
																		for="InsertCatisLigation1">是</label>
																</div>
																<div class="form-check form-check-inline col-form-label">
																	<input class="form-check-input" type="radio"
																		name="ligation" id="InsertCatisLigation2" value="0"
																		checked> <label class="form-check-label"
																		for="InsertCatisLigation2">否</label>
																</div>
															</div>
															<label class="col-form-label col-sm-2">接種</label>
															<div class="col-sm-4">
																<div class="form-check form-check-inline col-form-label">
																	<input class="form-check-input" type="radio"
																		name="vaccination" id="InsertCatisVaccination1"
																		value="1"> <label class="form-check-label"
																		for="InsertCatisVaccination1">是</label>
																</div>
																<div class="form-check form-check-inline col-form-label">
																	<input class="form-check-input" type="radio"
																		name="vaccination" id="InsertCatisVaccination2"
																		value="0" checked> <label
																		class="form-check-label" for="InsertCatisVaccination2">否</label>
																</div>
															</div>
														</div>
														<!-- 狀態 -->
														<div class="form-group row">
															<label class="col-form-label col-sm-2">狀態</label>
															<div class="col-sm-10">
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio"
																		name="adoptStatus" id="InsertCatadoptStatus1"
																		value="0" checked> <label
																		class="form-check-label" for="InsertCatadoptStatus1">尚未領養</label>
																</div>
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio"
																		name="adoptStatus" id="InsertCatadoptStatus2"
																		value="1"> <label class="form-check-label"
																		for="InsertCatadoptStatus2">生病中</label>
																</div>
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio"
																		name="adoptStatus" id="InsertCatadoptStatus3"
																		value="2"> <label class="form-check-label"
																		for="InsertCatadoptStatus3">領養接洽中</label>
																</div>
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio"
																		name="adoptStatus" id="InsertCatadoptStatus4"
																		value="3"> <label class="form-check-label"
																		for="InsertCatadoptStatus4">領養完畢</label>
																</div>
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio"
																		name="adoptStatus" id="InsertCatadoptStatus5"
																		value="4"> <label class="form-check-label"
																		for="InsertCatadoptStatus5">死亡</label>
																</div>
															</div>
														</div>
														<!-- 接養日期 -->
														<div class="form-group row">
															<label for="InsertCatcreateDate"
																class="col-sm-2 col-form-label">接養日期</label>
															<div class="col-sm-10">
																<input type="text" class="form-control "
																	id="InsertCatcreateDate" maxlength="19"
																	placeholder="yyyy-mm-dd HH:mm:ss" name="createDate">
																<small id="createDateHelp" class="form-text text-muted"></small>
															</div>
														</div>
														<!-- 評論1 -->
														<div class="form-group row">
															<label for="InsertCatcomment1"
																class="col-sm-2 col-form-label">評論1</label>
															<div class="col-sm-10">
																<textarea class="form-control" id="InsertCatcomment1"
																	rows="2" name="comment1" maxlength="150"></textarea>
															</div>
														</div>
														<!-- 評論2 -->
														<div class="form-group row">
															<label for="InsertCatcomment2"
																class="col-sm-2 col-form-label">評論2</label>
															<div class="col-sm-10">
																<textarea class="form-control" id="InsertCatcomment2"
																	rows="2" name="comment2" maxlength="150"></textarea>
															</div>
														</div>
														<!-- 照片 -->
														<div class="form-group row">
															<!-- 照片1 -->
															<label for="InsCatfile1"
																class="col-sm-2 col-form-label">照片1</label>
															<div class="col-sm-4">
																<label class="btn btn-primary">
																	<input type="file" accept="image/*" class="form-control-file uploadImage"
																		id="InsCatfile1" name="file1" style="display:none;"></input>
																	<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳													
																</label>
																<c:choose>
																<c:when test="${InsCatfile1 == null}">
																&nbsp;&nbsp;<div id="test1" style="color:red">至少上傳一張圖</div>
																</c:when>
																</c:choose>
																<input type="hidden" name="base64photo1" id="base64photo1">			
															</div>
															<!-- 照片2 -->
															<label for="InsCatfile2"
																	class="col-sm-2 col-form-label InsertCatfile1After" style="display: none;">照片2</label>
															<div class="col-sm-4">																
																<label class="btn btn-primary InsertCatfile1After" style="display: none;">
																	<input type="file" accept="image/*" class="form-control-file uploadImage"
																		id="InsCatfile2" name="file2" style="display:none;"></input>
																	<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳													
																</label>
																<input type="hidden" name="base64photo2" id="base64photo2">
															</div>
														</div>
														<!-- 預覽 -->											
														<div class="form-group row">
															<!-- 預覽1 -->
															<label class="col-sm-2 col-form-label InsertCatfilepreview1"  style="display: none;" id="spantext1"></label>
															<div class="col-sm-4">
																<figure class="figure InsertCatfilepreview1" style="display: none;">
																	<img class="figure-img img-fluid rounded" id="img1">
																	<figcaption class="figure-caption text-right"
																		id="size1"></figcaption>
																</figure>
															</div>
															<!-- 預覽2 -->
															<label class="col-sm-2 col-form-label InsertCatfilepreview2"  style="display: none;" id="spantext2"></label>
															<div class="col-sm-4">
																<figure class="figure InsertCatfilepreview2"  style="display: none;">
																	<img class="figure-img img-fluid rounded" id="img2">
																	<figcaption class="figure-caption text-right"
																		id="size2"></figcaption>
																</figure>
															</div>
														</div>
													
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary   "
																data-dismiss="modal">取消</button>&nbsp;
															<button type="button" class="btn btn-primary  "
																id="InsertCatReset">重置</button>&nbsp;																
															<button type="button" class="btn btn-primary   "
																id="InsertCatSubmit" disabled>新增</button>&nbsp;
														</div>
														<small id="submitHelp" class="form-text text-muted"></small>
													</form>
												</div>

											</div>
										</div>
									</div>
									<!------------------------------------------------------------更新頁面--------------------------------------------------------------------------------->
									<!-- Modal -->
								    <div class="modal fade" id="SetCatModalCenter" tabindex="-1" role="dialog"
								        aria-labelledby="SetCatModalCenterTitle" aria-hidden="true">
								        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
								            <div class="modal-content">
								                <div class="modal-header">
								                    <h5 class="modal-title" id="SetCatModalCenterTitle">修改資料</h5>
								                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                        <span aria-hidden="true">&times;</span>
								                    </button>
								                </div>
								                <div class="modal-body">
								                    <form method="POST" action="updateCat.controller" class="SetCatForm" id="SetCatForm" enctype="multipart/form-data">
								                    	<!-- 隱藏ID -->
								                    	 <input type="hidden" id="SetCatId" name="id" value="">
								                        <!-- 名字 -->
								                        <div class="form-group row">
								                            <label for="SetCatInputName" class="col-sm-2 col-form-label">名字</label>
								                            <div class="col-sm-10">
								                                <input type="text" class="form-control" id="SetCatInputName" placeholder="Enter Name"
								                                    name="nickname"> <small id="SetnameHelp" class="form-text text-muted"></small>
								                            </div>
								                        </div>
								                        <!-- 樣式 --><!-- 性別 -->
								                        <div class="form-group row">
								                            <label for="SetCatInputType" class="col-sm-2 col-form-label">樣式</label>
								                            <div class="col-sm-4">
								                                <input type="text" class="form-control" id="SetCatInputType" placeholder="Enter Type"
								                                    name="type"> <small id="SettypeHelp" class="form-text text-muted"></small>
								                            </div>
								                            
								                            <label class="col-form-label col-sm-2">性別</label>
								                            <div class="col-sm-4">
								                                <div class="form-check form-check-inline col-form-label">
								                                    <input class="form-check-input" type="radio" name="gender" id="SetCatgender1"
								                                        value="男">
								                                    <label class="form-check-label" for="SetCatgender1">男</label>
								                                </div>
								                                <div class="form-check form-check-inline col-form-label">
								                                    <input class="form-check-input" type="radio" name="gender" id="SetCatgender2"
								                                        value="女">
								                                    <label class="form-check-label" for="SetCatgender2">女</label>
								                                </div>
								                            </div>
								                        </div>
								                        <!-- 結紮 --><!-- 接種 -->
								                        <div class="form-group row">
								                            <label class="col-form-label col-sm-2">結紮</label>
								                            <div class="col-sm-4">
								                                <div class="form-check form-check-inline col-form-label">
								                                    <input class="form-check-input" type="radio" name="ligation"
								                                        id="SetCatisLigation1" value="1">
								                                    <label class="form-check-label" for="SetCatisLigation1">是</label>
								                                </div>
								                                <div class="form-check form-check-inline col-form-label">
								                                    <input class="form-check-input" type="radio" name="ligation"
								                                        id="SetCatisLigation2" value="0"> <label class="form-check-label"
								                                        for="SetCatisLigation2">否</label>
								                                </div>
								                            </div>
								                            
								                            <label class="col-form-label col-sm-2">接種</label>
								                            <div class="col-sm-4">
								                                <div class="form-check form-check-inline col-form-label">
								                                    <input class="form-check-input" type="radio" name="vaccination"
								                                        id="SetCatisVaccination1" value="1"> <label class="form-check-label"
								                                        for="SetCatisVaccination1">是</label>
								                                </div>
								                                <div class="form-check form-check-inline col-form-label">
								                                    <input class="form-check-input" type="radio" name="vaccination"
								                                        id="SetCatisVaccination2" value="0"> <label class="form-check-label"
								                                        for="SetCatisVaccination2">否</label>
								                                </div>
								                            </div>
								                        </div>
								                        <!-- 狀態 -->
								                        <div class="form-group row">
								                            <label class="col-form-label col-sm-2">狀態</label>
								                            <div class="col-sm-10">
								                                <div class="form-check form-check-inline">
								                                    <input class="form-check-input" type="radio" name="adoptStatus"
								                                        id="SetCatadoptStatus1" value="0"> <label class="form-check-label"
								                                        for="SetCatadoptStatus1">尚未領養</label>
								                                </div>
								                                <div class="form-check form-check-inline">
								                                    <input class="form-check-input" type="radio" name="adoptStatus"
								                                        id="SetCatadoptStatus2" value="1"> <label class="form-check-label"
								                                        for="SetCatadoptStatus2">生病中</label>
								                                </div>
								                                <div class="form-check form-check-inline">
								                                    <input class="form-check-input" type="radio" name="adoptStatus"
								                                        id="SetCatadoptStatus3" value="2"> <label class="form-check-label"
								                                        for="SetCatadoptStatus3">領養接洽中</label>
								                                </div>
								                                <div class="form-check form-check-inline">
								                                    <input class="form-check-input" type="radio" name="adoptStatus"
								                                        id="SetCatadoptStatus4" value="3"> <label class="form-check-label"
								                                        for="SetCatadoptStatus4">領養完畢</label>
								                                </div>
								                                <div class="form-check form-check-inline">
								                                    <input class="form-check-input" type="radio" name="adoptStatus"
								                                        id="SetCatadoptStatus5" value="4"> <label class="form-check-label"
								                                        for="SetCatadoptStatus5">死亡</label>
								                                </div>
								                            </div>
								                        </div>
								                        <!-- 接養日期 -->
								                        <div class="form-group row">
								                            <label for="SetCatcreateDate" class="col-sm-2 col-form-label">接養日期</label>
								                            <div class="col-sm-10">
								                                <input type="text" class="form-control" id="SetCatcreateDate"
								                                    placeholder="yyyy-mm-dd HH:mm:ss" name="createDate">
								                                <small id="SetcreateDateHelp" class="form-text text-muted"></small>
								                            </div>
								                        </div>
								                        <!-- 評論1 -->
								                        <div class="form-group row">
								                            <label for="SetCatcomment1" class="col-sm-2 col-form-label">評論1</label>
								                            <div class="col-sm-10">
								                                <textarea class="form-control" id="SetCatcomment1" rows="2" name="comment1"
								                                    maxlength="150"></textarea>
								                            </div>
								                        </div>
								                        <!-- 評論2 -->
								                        <div class="form-group row">
								                            <label for="SetCatcomment2" class="col-sm-2 col-form-label">評論2</label>
								                            <div class="col-sm-10">
								                                <textarea class="form-control" id="SetCatcomment2" rows="2" name="comment2"
								                                    maxlength="150"></textarea>
								                            </div>
								                        </div>
								                        <!-- 照片 -->
								                        <div class="form-group row">
								                        	<!-- 照片1 -->
								                            <label for="SetCatfile3" class="col-sm-2 col-form-label">圖片1</label>
								                            <div class="col-sm-3">
								                            	<label class="btn btn-primary">
									                                <input type="file" accept="image/*" class="form-control-file uploadImage"
									                                    id="SetCatfile3" name="file1" style="display:none;">
									                           		<i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
									                            </label>
									                            <input type="hidden" value="0" name="photo1IO" id="photo1IO">
									                            <input type="hidden" name="base64photo3" id="base64photo3">
								                            </div>
								                            <div class="col-sm-1">
								                            	<button type="button" class="btn btn-secondary" id="ResetCatfile1"><i class="bi bi-cloud-slash"></i></button>								                            
								                            </div>
								                            <!-- 照片2 -->
								                            <label for="SetCatfile4" class="col-sm-2 col-form-label">圖片2</label>
								                            <div class="col-sm-3">
								                           		<label class="btn btn-primary">
									                                <input type="file" accept="image/*" class="form-control-file uploadImage"
									                                    id="SetCatfile4" name="file2" style="display:none;">
									                                <i class="bi bi-cloud-arrow-up"></i>&nbsp;上傳
								                                </label>							                               
								                                <input type="hidden" value="0" name="photo2IO" id="photo2IO">
								                                <input type="hidden" name="base64photo4" id="base64photo4">
								                            </div>								                            
								                            <div class="col-sm-1">
								                            	 <button type="button" class="btn btn-secondary" id="ResetCatfile2"><i class="bi bi-cloud-slash"></i></button>						                            
								                            </div>
								                            
								                        </div>
								                        
								                        <!-- 圖片1區 -->
								                        <div class="form-group row">
								                            <!-- 預覽1 -->
								                            <div class="col-sm-6">
								                            <label>更新前圖片1</label>
								                                <figure class="figure" id="SetCatphoto1">
								                                </figure>
								                                <input type="hidden" name="photo1" id="SetCatphoto1src">
								                            </div>
								                             <!-- 更新預覽1 -->
								                            <div class="col-sm-6">
								                            	<label id="spantext3"></label>
								                                <figure class="figure">
								                                    <img class="figure-img img-fluid rounded" id="img3">
								                                    <figcaption class="figure-caption text-right" id="size3"></figcaption>
								                                    
								                                </figure>
								                            </div>
								                        </div>
								                        <!-- 圖片2區 -->
								                        <div class="form-group row">
								                            <!-- 預覽2 -->
								                            <div class="col-sm-6">
								                            <label>更新前圖片2</label>
								                                <figure class="figure" id="SetCatphoto2">
								                                </figure>
								                                <input type="hidden" name="photo2" id="SetCatphoto2src">
								                            </div>
								                            <!-- 更新預覽2 -->
								                            <div class="col-sm-6">
								                            	<label id="spantext4"></label>
								                                <figure class="figure">
								                                    <img class="figure-img img-fluid rounded" id="img4">
								                                    <figcaption class="figure-caption text-right" id="size4"></figcaption>
								                                </figure>
								                            </div>
								                        </div>
														<!-- 按鈕區 -->
								                        <div class="modal-footer">
								                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
								                            <button type="button" class="btn btn-primary" id="SetCatSubmit">更新</button>
								                        </div>
								                        <small id="SetCatsubmitHelp" class="form-text text-muted"></small>
								                    </form>
								                </div>
								            </div>
								        </div>
								    </div>
								    <!-- SetCatForm--END -->
									<!------------------------------------------------------------刪除提示--------------------------------------------------------------------------------->
									<!-- Modal -->
									<div class="modal fade" id="DeleteCatModal" tabindex="-1"
										role="dialog" aria-labelledby="DeleteCatModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="DeleteCatModalLabel">刪除提示</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">確定要刪除嗎?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">取消</button>
													<button type="button" class="btn btn-primary"
														id="confirmDel">確定</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 切割圖片Dialog -->
								    <div id="uploadimageModal" class="modal" role="dialog">
								        <div class="modal-dialog">
								            <div class="modal-content">
								                <div class="modal-header">
								                    <h4 class="modal-title">確認圖片大小</h4>
								                    <button type="button" class="close" data-dismiss="modal">&times;</button>
								                </div>
								                <div class="modal-body">
								                    <div class="row">
								                        <div class="col-md-12 text-center">
								                            <div id="image_demo" style="width:350px; margin-top: 30px; margin-left: 35px;"></div>
								                        </div>
								                    </div>
								                </div>
								                <div class="modal-footer">
								                    <button type="button" class="btn btn-default" data-dismiss="modal" id="uploadimageModalCancel">原尺寸</button>
								                    <button class="btn btn-primary crop_image">確認</button>
								                </div>
								            </div>
								        </div>
								    </div>
									
									<!-- 貓咪表格 -->
									<table class="allCattb table-hover" id="allCattb" style="width:100%">
										<thead>
											<tr style="color:#5A5AAD;font-size:20px;background:#F0F0F0;">
												<th>編號</th>
												<th>名字</th>
												<th>樣式</th>
												<th>性別</th>
												<th>結紮</th>
												<th>接種</th>
												<th>狀態</th>
												<th>接養日期</th>
												<th>評論1</th>
												<th>評論2</th>
												<th>照片1</th>
												<th>照片2</th>
												<th>功能</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cats}" var="cat" varStatus="s">
												<tr id="${cat.id}" style="color:#842B00" >
													<td>${cat.id}</td>
													<td>${cat.nickname}</td>
													<td>${cat.type}</td>
													<td>${cat.gender}</td>
													<td><c:choose><c:when test="${cat.ligation == true}">Ｏ</c:when><c:otherwise>Ｘ</c:otherwise></c:choose></td>
													<td><c:choose><c:when test="${cat.vaccination == true}">Ｏ</c:when><c:otherwise>Ｘ</c:otherwise></c:choose></td>
													<td>${cat.adoptStatus.description}</td>
													<td class="dateymdHms">${cat.createDate}</td>
													<td class="toolong">${cat.comment1}</td>
													<td class="toolong">${cat.comment2}</td>
													<td><img class="figure-img img-fluid rounded" src="catImageToByte?path=${cat.photo1}" alt="喵~" onerror="imgchange()"></td>
													<td><img class="figure-img img-fluid rounded" src="catImageToByte?path=${cat.photo2}" alt="喵~" onerror="imgchange()"></td>
													<td>
														<div class="btn-group" role="group">
															<button type="button" class="btn btn-primary" data-toggle="modal" id="update${cat.id}" 
	                     									data-target="#SetCatModalCenter" onclick="SetCat(this)">修改</button>
															<button type="button" id="del${cat.id}"
															class="btn btn-primary" data-toggle="modal"
															data-target="#DeleteCatModal" onclick="getDeleteCatId(this)">刪除</button>
														</div>	
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</article>
							</div>
						</div>
					</section>
				</section>
				<!--main content end-->
				
			</main>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
		
	<script>
		/*-------------------------更新刪除取ID-----------------------------*/
		var UpdateNo="";
		var deletecatNo = "";
	
		function goSelectAllCat() {
			window.location.href="SelectAllCat";
		}
		
		function getDeleteCatId(myObj) {
			deletecatNo = myObj.id.substr(3);
		}
		
		document.getElementById("confirmDel").addEventListener(
				"click",
				function() {
					window.location.href = "deleteCat.controller?deletecatid="
							+ deletecatNo;
				});
	  
		/*-------------------------滑鼠移入顯示全文-----------------------------*/
		$(".toolong").on("mouseenter", function() {
	  	      if (!this.title) this.title = $(this).text();
	 	});
		/*-------------------------圖片無法讀取顯示預設圖-----------------------------*/
	    function imgchange(){
	        var img=event.srcElement;
	        img.src="<c:url value='/assets/img/testlogo.jpg' />";
	        img.onerror=null; //控制不要一直觸發錯誤
	    }
		/*-------------------------更新頁面-----------------------------*/
		let resetflag1=true,resetflag2=true;
		
		function SetCat(myObj) {
			let catNo = myObj.id.substr(6);
	        let cat = document.getElementById(catNo);
	        console.log(cat);
	        let catresource = cat.children;
	        let tempstr = new Array();
	        for (let i = 0; i < catresource.length; i++) {
	            tempstr.push(catresource[i].innerHTML)
	        }
	
	        $("#SetCatId").val(tempstr[0]);
	        $("#SetCatInputName").val(tempstr[1]);
	        $("#SetCatInputType").val(tempstr[2]);
	        if(tempstr[3]=="男"){
	            $("#SetCatgender1").prop("checked",true);
	        }else{
	            $("#SetCatgender2").prop("checked",true);
	        }
	        if(tempstr[4]=="Ｏ"){
	            $("#SetCatisLigation1").prop("checked",true);
	        }else{
	            $("#SetCatisLigation2").prop("checked",true);
	        }
	        if(tempstr[5]=="Ｏ"){
	            $("#SetCatisVaccination1").prop("checked",true);
	        }else{
	            $("#SetCatisVaccination2").prop("checked",true);
	        }
	        switch (tempstr[6]) {
	            case "尚未領養":
	                $("#SetCatadoptStatus1").prop("checked",true);
	                break;
	            case "生病中":
	                $("#SetCatadoptStatus2").prop("checked",true);
	                break;
	            case "領養接洽中":
	                $("#SetCatadoptStatus3").prop("checked",true);
	                break;
	            case "領養完畢":
	                $("#SetCatadoptStatus4").prop("checked",true);
	                break;
	            case "死亡":
	                $("#SetCatadoptStatus5").prop("checked",true);
	                break;
	            default:
	                $("#SetCatadoptStatus1").prop("checked",true);
	        }
	        $("#SetCatcreateDate").val(tempstr[7].substr(0,19));
	        $("#SetCatcomment1").text(tempstr[8]);
	        $("#SetCatcomment2").text(tempstr[9]);
	        $("#SetCatphoto1").html(tempstr[10]);
	        $("#SetCatphoto1src").val($("#SetCatphoto1").children().attr("src").substr($("#SetCatphoto1").children().attr("src").indexOf("=")+1)); 
	        $("#SetCatphoto2").html(tempstr[11]);
	        if($("#SetCatphoto2").children().attr("src").substr($("#SetCatphoto2").children().attr("src").indexOf("testlogo"),12)=="testlogo.jpg"){
	        	$("#SetCatphoto2src").val("");
	        }else{
	        	$("#SetCatphoto2src").val($("#SetCatphoto2").children().attr("src").substr($("#SetCatphoto2").children().attr("src").indexOf("=")+1));
	        }
	        
	        /*取消上傳的boolean*/
	        resetflag1=true,resetflag2=true;
	        
	        /*清空預覽*/
	        $("#SetCatfile3").val("");
	        $("#spantext3").text("");
			$("#img3").attr('src',"");
			$("#size3").text("");
			$("#SetCatfile4").val("");
			$("#spantext4").text("");
			$("#img4").attr('src',"");
			$("#size4").text("");
			
			/*清空隱藏內容*/
			$("#base64photo3").val("");
			$("#base64photo4").val("");
			
			/*清空小字*/
			$("#SetnameHelp").html("");
			$("#SettypeHelp").html("");
			$("#SetcreateDateHelp").html("");
			$("#SetsubmitHelp").html("");	
		};
		/*-------------------------取消上傳的圖片-----------------------------*/
		
		
		$("#ResetCatfile1").on("click",function(){	
			if(resetflag1==true){
				$("#SetCatfile3").val("");
				$("#photo1IO").val("0");
				
				$("#spantext3").text("");
				$("#img3").attr('src',"");
				$("#size3").text("");
				if($("#SetCatphoto2src").val()!=""){
					$("#SetCatphoto1").children().attr("src",$("#SetCatphoto2").children().attr("src"));
					$("#SetCatphoto1src").val($("#SetCatphoto2").children().attr("src").substr($("#SetCatphoto2").children().attr("src").indexOf("=")+1));
					$("#SetCatphoto2").children().attr("src","assets/img/testlogo.jpg");
					$("#SetCatphoto2src").val("");
				}
				resetflag1=false;
			}		
		})
		
		$("#ResetCatfile2").on("click",function(){
			if(resetflag2==true){
				$("#file4").val("");
				$("#photo2IO").val("0");
				
				$("#spantext4").text("");
				$("#img4").attr('src',"");
				$("#size4").text("");
				
				$("#SetCatphoto2").children().attr("src","assets/img/testlogo.jpg");
				$("#SetCatphoto2src").val("");
				resetflag2=false;
			}
		})
		/*-------------------------新增檢驗input------------------------------*/
		let flag1=false,flag2=false,flag3=false,flag4=false;
		let namein=document.getElementById("InsertCatInputName");
	    let typein=document.getElementById("InsertCatInputType");
	    let datein=document.getElementById("InsertCatcreateDate");
	       
	    namein.addEventListener("change",namevalIO);
	    typein.addEventListener("change",typevalIO);
	    datein.addEventListener("change",datevalIO);
	    $("#InsCatfile1").on("change", function() {
	// 		preview(this);
			$(".InsertCatfilepreview1").removeAttr("style");
			$(".InsertCatfile1After").removeAttr("style");
// 			$("#test1").attr("style","color:#FFFFFF");
            $("#test1").html("");
	        flag4=true;	        
	        if(flag1&&flag2&&flag3&&flag4==true){
	        	$("#InsertCatSubmit").attr("disabled",false);      	
	        }
	        console.log("1"+flag1+"2"+flag2+"3"+flag3+"4"+flag4);
	  	})
	   	$("#InsCatfile2").on("change", function() {
	   		$(".InsertCatfilepreview2").removeAttr("style");
	// 		preview2(this);
		})
	    $("#InsertCatSubmit").on("click",function(){
	       	if(flag1&&flag2&&flag3&&flag4){
	        	$("#InsertCatForm").submit();
	        }else if(!flag4){
	     		document.getElementById("submitHelp").innerHTML=`<img src="assets/img/prompt/NO.png" style="width:12px; padding-bottom:3px;"><em style="color:red">需上傳一張圖片</em>`;
	
	        }else{
	        	document.getElementById("submitHelp").innerHTML=`<img src="assets/img/prompt/NO.png" style="width:12px; padding-bottom:3px;"><em style="color:red">資料有誤</em>`;
	        }
	    })
	    $("#InsertCatReset").on("click",function(){
	       	document.getElementById("nameHelp").innerHTML="";
	       	document.getElementById("typeHelp").innerHTML="";
	       	document.getElementById("createDateHelp").innerHTML="";
	       	document.getElementById("submitHelp").innerHTML="";
	       	$(".InsertCatfile1After").attr("style","display:none");
	       	$(".InsertCatfilepreview1").attr("style","display:none");
	       	$(".InsertCatfilepreview2").attr("style","display:none");
	       	$("#spantext1").text("");
			$("#img1").attr('src',"");
			$("#size1").text("");
		   	$("#spantext2").text("");
			$("#img2").attr('src',"");
			$("#size2").text("");
			$("#InsertCatSubmit").attr("disabled",true);
			$("#InsertCatInputName").removeClass("is-valid");
			$("#InsertCatInputName").removeClass("is-invalid");
		        nameHelp.innerHTML = `<span style="color:rgb(0, 170, 0)"><span>`;	 
		    $("#InsertCatInputType").removeClass("is-invalid");
		    $("#InsertCatInputType").removeClass("is-valid");
		        typeHelp.innerHTML = `<span style="color:rgb(0, 170, 0)"><span>`;
		        $("#InsertCatcreateDate").removeClass("is-invalid");
		        $("#InsertCatcreateDate").removeClass("is-valid");
		        createDateHelp.innerHTML = `<span style="color:rgb(0, 170, 0)"><span>`;
		    $("#test1").html("至少上傳一張圖 ")
			
	       	document.getElementById("InsertCatForm").reset();
		})
	
		function namevalIO(){
	    	let nameval = namein.value;
	        let namech = /^[\u4E00-\u9FFFa-zA-Z\d]+$/;
	        let namesp = document.getElementById("nameHelp")
	        if(nameval==""){	
	        	$("#InsertCatInputName").removeClass("is-valid");
	        	$("#InsertCatInputName").addClass("is-invalid");
	     	   namesp.innerHTML = `<em style="color:red">名字不可空白</em>`;
	        }else{
	        	if(namech.test(nameval)){
	        		$("#InsertCatInputName").removeClass("is-invalid");
		        	$("#InsertCatInputName").addClass("is-valid");
	                namesp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;
	                flag1=true;
	            }else{
	            	$("#InsertCatInputName").removeClass("is-valid");
	            	$("#InsertCatInputName").addClass("is-invalid");
	            	namesp.innerHTML = `<em style="color:red">不能包含特殊字元</em>`;
	            }
	        } 
		}
	
	    function typevalIO(){
	        let typeval = typein.value;
	        let typech = /^[\u4E00-\u9FFFa-zA-Z]+$/;
	        let typesp = document.getElementById("typeHelp") 
	        if(typeval==""){
	        	$("#InsertCatInputType").removeClass("is-valid");
	        	$("#InsertCatInputType").addClass("is-invalid");
	            typesp.innerHTML = `<em style="color:red">樣式不可空白</em>`;
	        }else{
	            if(typech.test(typeval)){
	            	$("#InsertCatInputType").removeClass("is-invalid");
		        	$("#InsertCatInputType").addClass("is-valid");
	                typesp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;
	                flag2=true;
	            }else{
	            	$("#InsertCatInputType").removeClass("is-valid");
	            	$("#InsertCatInputType").addClass("is-invalid");
	                typesp.innerHTML = `<em style="color:red">不能包含數字、特殊字元</em>`;
	            }
	        } 
	    }
	    function datevalIO(){
	        let dateval = datein.value.substr(0,19);
	        let datesp = document.getElementById("createDateHelp");
	        let datearr = dateval.split(" ");
	        let dateymd = datearr[0].split("-");
	        let dateHms = datearr[1].split(":");
	        if(dateval!=""){
		        if(dateval.length!=19 || datearr.length!=2 || dateval.length==0 ){
		        	$("#InsertCatcreateDate").removeClass("is-valid");
		        	$("#InsertCatcreateDate").addClass("is-invalid");
	    	        datesp.innerHTML = `<em style="color:red">日期格式不正確喔</em>`;
	            } else {
	        	    let d = new Date(dateymd[0],dateymd[1]-1,dateymd[2]);         
	                if(dateymd[0]!=d.getFullYear() || dateymd[1]-1!=d.getMonth() || dateymd[2]!=d.getDate()){	                	
	                	$("#InsertCatcreateDate").removeClass("is-valid");
	                	$("#InsertCatcreateDate").addClass("is-invalid");
	                    datesp.innerHTML = `<em style="color:red">日期不正確</em>`;
	                }else if(dateHms[0]>=0 && dateHms[0]<24 && dateHms[1]>=0 && dateHms[1]<60 && dateHms[2]>=0 && dateHms[2]<60){
	                	$("#InsertCatcreateDate").removeClass("is-invalid");
			        	$("#InsertCatcreateDate").addClass("is-valid");
	                    datesp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;
	                    flag3=true;
	                }else{
	                	$("#InsertCatcreateDate").removeClass("is-valid");
	                	$("#InsertCatcreateDate").addClass("is-invalid");
	                    datesp.innerHTML = `<em style="color:red">時間不正確</em>`;
	                }
	            }
	        }else{
	        	$("#InsertCatcreateDate").removeClass("is-valid");
	        	$("#InsertCatcreateDate").addClass("is-invalid");
	            datesp.innerHTML = `<em style="color:red">接養日期不可空白</em>`;
	        }
	    }
	    
	    /*-------------------------更新檢驗input------------------------------*/
	    let Setflag1=true,Setflag2=true,Setflag3=true;
		let Setnamein=document.getElementById("SetCatInputName");
	    let Settypein=document.getElementById("SetCatInputType");
	    let Setdatein=document.getElementById("SetCatcreateDate");
	    
	    Setnamein.addEventListener("change",setnamevalIO);
	    Settypein.addEventListener("change",settypevalIO);
	    Setdatein.addEventListener("change",setdatevalIO);
	    $("#SetCatfile3").on("change", function() {
	//     	Setpreview(this);
	    	resetflag1=true;
			$("#photo1IO").val("1");
		})
		$("#SetCatfile4").on("change", function() {
	// 		Setpreview2(this);
			resetflag2=true;
			$("#photo2IO").val("1");
		})
	    $("#SetCatSubmit").on("click",function(){
			if(Setflag1&&Setflag2&&Setflag3){
	            $("#SetCatForm").submit();
	        }else{
	            document.getElementById("SetCatsubmitHelp").innerHTML=`<img src="FurHouse/assets/img/prompt/NO.png" style="width:12px; padding-bottom:3px;"><em style="color:red">資料有誤</em>`;
	        }
	    })
	
	    function setnamevalIO(){
			Setflag1=false;
	        let nameval = Setnamein.value;
	        let namech = /^[\u4E00-\u9FFFa-zA-Z\d]+$/;
	        let namesp = document.getElementById("SetnameHelp")
	        if(nameval==""){
	        	$("#SetCatInputName").addClass("is-invalid");
	            namesp.innerHTML = `<em style="color:red">名字不可空白</em>`;
	        }else{
	            if(namech.test(nameval)){
	            	$("#SetCatInputName").removeClass("is-invalid");
		        	$("#SetCatInputName").addClass("is-valid");
	                namesp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;
	                Setflag1=true;
	            } else {
		        	$("#SetCatInputName").addClass("is-invalid");
	                namesp.innerHTML = `<em style="color:red">不能包含特殊字元</em>`;
	            }
	        } 
		}
	
	    function settypevalIO(){
	    	Setflag2=false;
	        let typeval = Settypein.value;
	        let typech = /^[\u4E00-\u9FFFa-zA-Z]+$/;
	        let typesp = document.getElementById("SettypeHelp")
	        if(typeval==""){
            	$("#SetCatInputType").removeClass("is-valid");
	        	 $("#SetCatInputType").addClass("is-invalid");
	            typesp.innerHTML = `<em style="color:red">樣式不可空白</em>`;
	        }else{
	            if(typech.test(typeval)){
	            	$("#SetCatInputType").removeClass("is-invalid");
		        	$("#SetCatInputType").addClass("is-valid");
	                typesp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;
	                Setflag2=true;
	            } else {
	            	$("#SetCatInputType").removeClass("is-valid");
	            	$("#SetCatInputType").addClass("is-invalid");
	                typesp.innerHTML = `<em style="color:red">不能包含數字、特殊字元</em>`;
	            }
	        } 
	    }
	    
	    function setdatevalIO(){
	    	Setflag3=false;
	        let dateval = Setdatein.value;
	        let datesp = document.getElementById("SetcreateDateHelp");
	        let datearr = dateval.split(" ");
	        let dateymd = datearr[0].split("-");
	        let dateHms = datearr[1].split(":");
	
	        if(dateval!=""){
	            if(dateval.length!=19 || datearr.length!=2){
	            	$("#SetCatcreateDate").removeClass("is-valid");
		        	$("#SetCatcreateDate").addClass("is-invalid");
	                datesp.innerHTML = `<em style="color:red">日期格式不正確喔</em>`;
	            }else{
		            let d = new Date(dateymd[0],dateymd[1]-1,dateymd[2]);          
	                if(dateymd[0]!=d.getFullYear() || dateymd[1]-1!=d.getMonth() || dateymd[2]!=d.getDate()){
	                	$("#SetCatcreateDate").removeClass("is-valid");
	                	$("#SetCatcreateDate").addClass("is-invalid");
	                    datesp.innerHTML = `<em style="color:red">日期不正確</em>`;
	                }else if(dateHms[0]>=0 && dateHms[0]<24 && dateHms[1]>=0 && dateHms[1]<60 && dateHms[2]>=0 && dateHms[2]<60){
	                	$("#SetCatcreateDate").removeClass("is-invalid");
			        	$("#SetCatcreateDate").addClass("is-valid");
	                    datesp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;
	                    Setflag3=true;
	                }else{
	                	$("#SetCatcreateDate").removeClass("is-valid");
	                	$("#SetCatcreateDate").addClass("is-invalid");
	                    datesp.innerHTML = `<em style="color:red">時間不正確</em>`;
	                }
	            }
	        } else {
	        	$("#SetCatcreateDate").removeClass("is-valid");
	        	$("#SetCatcreateDate").addClass("is-invalid");
	            datesp.innerHTML = `<em style="color:red">接養日期不可空白</em>`;
	    	}
		}
	    
	    /*圖片切割*/
		let image_crop = $('#image_demo').croppie({
		    enableExif: true,
		    viewport: {
		        width: 300,
		        height: 200,
		        type: 'square' //circle
		    },
		    boundary: {
		        width: 400,
		        height: 400
		    }
		});
		
		let changImgId;
	// 	$('.uploadImage').on('click',function(){
	// 		$("#InsCatfile1").val("");
	// 		$("#InsCatfile2").val("");
	// 		$("#SetCatfile3").val("");
	// 		$("#SetCatfile4").val("");
	// 	})
		
		$('.uploadImage').on('change', function () {
		    let reader = new FileReader();
		    changImgId = this.id.substr(10);
		    console.log(changImgId);
		    reader.onload = function (event) {
		        image_crop.croppie('bind', {
		            url: event.target.result
		        }).then(function () {
		            console.log('jQuery bind complete');
		        });
		        $("#img"+changImgId).attr('src', event.target.result);
		        $("#spantext"+changImgId).text("圖片預覽");
		        let KB = format_float(event.total / 1024, 2);
		        $("#size"+changImgId).text("檔案大小：" + KB + " KB");
		    }
		    reader.readAsDataURL(this.files[0]);
		    if(changImgId<=2){
	        	$('#uploadimageModal').modal('show');
	 	        $('#InsertCatModalCenter').modal('hide');
	        }else{
	        	$('#uploadimageModal').modal('show');
	 	        $('#SetCatModalCenter').modal('hide');
	        }
		});
		
		$('.crop_image').click(function (event) {
		    image_crop.croppie('result', {
		        type: 'canvas',
		        size: 'viewport',
		        format: 'jpeg'
		    }).then(function (data) {
		    	$("#spantext"+changImgId).text("圖片預覽");
		        $("#img"+changImgId).attr("src", data);
		        $("#base64photo"+changImgId).val(data);
		        let KB = showSize(data);
		        $("#size"+changImgId).text("檔案大小：" + KB + " KB");
		        if(changImgId<=2){
		        	$('#uploadimageModal').modal('hide');
		 	        $('#InsertCatModalCenter').modal('show');
		        }else{
		        	$('#uploadimageModal').modal('hide');
		 	        $('#SetCatModalCenter').modal('show');
		        }
		        
		       
		    });
		});
		
		$("#uploadimageModalCancel").on("click",function(){
			if(changImgId<=2){
	        	$('#uploadimageModal').modal('hide');
	 	        $('#InsertCatModalCenter').modal('show');
	        }else{
	        	$('#uploadimageModal').modal('hide');
	 	        $('#SetCatModalCenter').modal('show');
	        }
	    })
		
	    //取得本地端圖片大小
	    function format_float(num, pos) {
			let size = Math.pow(10, pos);
			return Math.round(num * size) / size;
		}
	    
		//獲取base64圖片大小，返回kb數字
		function showSize(base64url) {
		    //把頭部去掉
		    let str = base64url.replace('data:image/jpeg;base64,', '');
		    // 找到等號，把等號也去掉
		    let equalIndex = str.indexOf('=');
		    if (str.indexOf('=') > 0) {
		        str = str.substring(0, equalIndex);
		    }
		    // 原來的字符流大小，單位為字節
		    let strLength = str.length;
		    // 計算後得到的文件流大小，單位為字節   
		    let fileLength = parseInt(strLength - (strLength / 8) * 2);
		    // 由字節轉換為kb
		    let size = "";
		    size = (fileLength / 1024).toFixed(2);
		    let sizeStr = size + ""; //轉成字符串
		    let index = sizeStr.indexOf("."); //獲取小數點處的索引
		    let dou = sizeStr.substr(index + 1, 2) //獲取小數點後兩位的值
		    if (dou == "00") { //判斷後兩位是否為00，如果是則刪除00          
		        return sizeStr.substring(0, index) + sizeStr.substr(index + 3, 2)
		    }
		    return size;
		}
		
		 /*-------------------------一鍵新增input------------------------------*/ 
	    function Newdata(){
	    	console.log("123");	    	
	        $("#InsertCatInputName").val("灰咪");
	        $("#InsertCatInputName").addClass("is-valid");
	        nameHelp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;	        
	        $("#InsertCatInputType").val("花貓");
	        $("#InsertCatInputType").addClass("is-valid");
            typeHelp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;	        
	        $("#InsertCatgender2").prop("checked",true);
	        $("#InsertCatisLigation2").prop("checked",true);
	        $("#InsertCatisVaccination1").prop("checked",true);
	        $("#InsertCatadoptStatus1").prop("checked",true);
	        $("#InsertCatcreateDate").val("2021-05-14 10:10:00");
	        $("#InsertCatcreateDate").addClass("is-valid");
	        createDateHelp.innerHTML = `<span style="color:rgb(0, 170, 0)">正確<span>`;	        
	        $("#InsertCatcomment1").val("贊助灰咪");
	        $("#InsertCatcomment2").val("常常端著高冷表情的灰咪，其實才六個月大有著淡淡的灰色毛髮加上臉蛋清秀是個非常漂亮的小美女");
	        
	       flag1=true;
	       flag2=true;
	       flag3=true;
	        
	 
		
	    }
		
    </script>
		
</body>
</html>