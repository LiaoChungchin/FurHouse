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
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!-- User Define JS -->
	
	<title>*ROOT*</title>
	
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
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
					<h2>Members</h2>
					<small>update : 2021/04/03</small>
				</div>
				
				<!-- ###置入本頁資訊### -->
				<div class="row">
					<!-- ------------------------------------------主頁面起始位置------------------------------------------ -->
					<div class="col-lg-12">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th scope="col">編號</th>
									<th scope="col">會員名稱</th>
									<th scope="col">會員密碼</th>
									<th scope="col">姓名</th>
									<th scope="col">手機號碼</th>
									<th scope="col">電子信箱</th>
									<th scope="col">會員創建日期</th>
									<th scope="col">會員圖片</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">${requestScope.Members[0].memberId}</th>
									<td>${requestScope.Members[0].account}</td>
									<td>${requestScope.Members[0].password}</td>
									<td>${requestScope.Members[0].name}</td>
									<td>${requestScope.Members[0].phone}</td>
									<td>${requestScope.Members[0].email}</td>
									<td>${requestScope.Members[0].createDate}</td>
									<c:if test="${requestScope.Members[0].photo == null}">
										<td><a href="#"
											onclick="window.open('<c:url value='member.getPhoto/0' />', 'photo', config='height=200,width=200,toolbar=no,scrollbars=no,location=no,menubar=no,status=no,screenX=1220,screenY=190');">photo</a>
											<a class="btn btn-sm btn-primary bi bi-brush" href="#"
											role="button" data-toggle="modal"
											data-target="#PhotoModal${requestScope.Members[0].memberId}"></a></td>
									</c:if>
									<c:if test="${requestScope.Members[0].photo != null}">
										<td><a href="#"
											onclick="window.open('<c:url value='member.getPhoto/${requestScope.Members[0].memberId}' />', 'photo', config='height=200,width=200,toolbar=no,scrollbars=no,location=no,menubar=no,status=no,screenX=1220,screenY=190');">photo</a>
											<a class="btn btn-sm btn-primary bi bi-brush" href="#"
											role="button" data-toggle="modal"
											data-target="#PhotoModal${requestScope.Members[0].memberId}"></a></td>
									</c:if>
									<td>
										<div class="btn-group btn-group-sm" role="group">
											<button type="button" class="btn btn-light"
												name="btn_i${requestScope.Members[0].memberId}" disabled>禁用</button>
											<button type="button" class="btn btn-secondary"
												name="btn_m${requestScope.Members[0].memberId}"
												data-toggle="modal"
												data-target="#modal${requestScope.Members[0].memberId}ToUpdate">修改</button>
											<button type="button" class="btn btn-light"
												name="btn_d${requestScope.Members[0].memberId}"
												data-toggle="modal"
												data-target="#modal${requestScope.Members[0].memberId}ToDel"
												disabled>刪除</button>
										</div>
									</td>
								</tr>
								<c:forEach items="${requestScope.Members}" var="member"
									begin="1" varStatus="s">
									<tr>
										<th scope="row">${member.memberId}</th>
										<td>${member.account}</td>
										<td>${member.password}</td>
										<td>${member.name}</td>
										<td>${member.phone}</td>
										<td>${member.email}</td>
										<td>${member.createDate}</td>
										<c:if test="${member.photo == null}">
											<td><a href="#"
												onclick="window.open('<c:url value='member.getPhoto/0' />', 'photo', config='height=200,width=200,toolbar=no,scrollbars=no,location=no,menubar=no,status=no,screenX=1220,screenY=190');">photo</a>
												<a class="btn btn-sm btn-primary bi bi-brush" href="#"
												role="button" data-toggle="modal"
												data-target="#PhotoModal${member.memberId}"></a></td>
										</c:if>
										<c:if test="${member.photo != null}">
											<td><a href="#"
												onclick="window.open('<c:url value='member.getPhoto/${member.memberId}' />', 'photo', config='height=200,width=200,toolbar=no,scrollbars=no,location=no,menubar=no,status=no,screenX=1220,screenY=190');">photo</a>
												<a class="btn btn-sm btn-primary bi bi-brush" href="#"
												role="button" data-toggle="modal"
												data-target="#PhotoModal${member.memberId}"></a></td>
										</c:if>
										<td>
											<div class="btn-group btn-group-sm" role="group">
												<button type="button" class="btn btn-secondary"
													name="btn_i${member.memberId}">禁用</button>
												<button type="button" class="btn btn-secondary"
													name="btn_m${member.memberId}" data-toggle="modal"
													data-target="#modal${member.memberId}ToUpdate">修改</button>
												<button type="button" class="btn btn-secondary"
													name="btn_d${member.memberId}" data-toggle="modal"
													data-target="#modal${member.memberId}ToDel">刪除</button>
											</div>
										</td>
									</tr>
									<!-- Modal start 刪除時會彈出的視窗-->
									<div class="modal fade" id="modal${member.memberId}ToDel"
										tabindex="-1" role="dialog" aria-labelledby="modalToDelLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="modalToDelLabel">確定刪除?</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													您將刪除[會員編號 : ${member.memberId}]的所有資料!<br /> 確定後將無法回復，請再次確認是否刪除?
												</div>
												<div class="modal-footer">
													<form method="post" action="member.delete">
														<input type="hidden" name="memberWhoToDelete"
															value="${member.memberId}" />
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<input type="submit" class="btn btn-primary"
															value="Confrim" />
													</form>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal end -->
									<!-- Modal 修改時會彈出的視窗-->
									<div class="modal fade" id="modal${member.memberId}ToUpdate"
										tabindex="-1" role="dialog"
										aria-labelledby="modal${member.memberId}ToUpdateLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="modal${member.memberId}ToUpdateLabel">修改會員資訊</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form method="post" action="member.update">
														<div class="form-group row">
															<label for="updatePwd" class="col-sm-3 col-form-label">會員密碼</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="update${member.memberId}Pwd" name="updatePwd"
																	value="${member.password}">
															</div>
														</div>
														<div class="form-group row">
															<label for="updateName" class="col-sm-3 col-form-label">姓名</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="update${member.memberId}Name" name="updateName"
																	value="${member.name}">
															</div>
														</div>
														<div class="form-group row">
															<label for="updatePhone" class="col-sm-3 col-form-label">手機號碼</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="update${member.memberId}Phone" name="updatePhone"
																	value="${member.phone}">
															</div>
														</div>
														<div class="form-group row">
															<label for="updateMail" class="col-sm-3 col-form-label">電子信箱</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="update${member.memberId}Mail" name="updateMail"
																	value="${member.email}">
															</div>
														</div>
														<div class="form-group row">
															<div class="col-sm-10">
																<input type="hidden" name="updateNo"
																	value="${member.memberId}">
																<button type="submit" class="btn btn-primary">Confirm</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal end -->
									<!-- Modal photo修改時會彈出的視窗-->
									<div class="modal fade" id="PhotoModal${member.memberId}"
										tabindex="-1" role="dialog" aria-labelledby="PhotoModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="PhotoModalLabel">更新會員圖片</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form method="post" action="member.photoUpdate"
														enctype="multipart/form-data">
														<input type="file" name="photo" /> <input type="hidden"
															name="memberID" value="${member.memberId}" /> <input
															type="submit" id="UpdatePhoto${member.memberId}Submit"
															class="invisible" />
													</form>
												</div>
												<div class="modal-footer">
													<label class="btn btn-secondary" data-dismiss="modal">Close</label>
													<label class="btn btn-primary"
														for="UpdatePhoto${member.memberId}Submit">Save</label>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal end -->
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- Modal 修改時會彈出的視窗-->
					<div class="modal fade"
						id="modal${requestScope.Members[0].memberId}ToUpdate" tabindex="-1"
						role="dialog"
						aria-labelledby="modal${requestScope.Members[0].memberId}ToUpdateLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title"
										id="modal${requestScope.Members[0].memberId}ToUpdateLabel">修改會員資訊</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="post" action="member.update">
										<div class="form-group row">
											<label for="updatePwd" class="col-sm-3 col-form-label">會員密碼</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													id="update${requestScope.Members[0].memberId}Pwd"
													name="updatePwd"
													value="${requestScope.Members[0].password}">
											</div>
										</div>
										<div class="form-group row">
											<label for="updateName" class="col-sm-3 col-form-label">姓名</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													id="update${requestScope.Members[0].memberId}Name"
													name="updateName" value="${requestScope.Members[0].name}">
											</div>
										</div>
										<div class="form-group row">
											<label for="updatePhone" class="col-sm-3 col-form-label">手機號碼</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													id="update${requestScope.Members[0].memberId}Phone"
													name="updatePhone" value="${requestScope.Members[0].phone}">
											</div>
										</div>
										<div class="form-group row">
											<label for="updateMail" class="col-sm-3 col-form-label">電子信箱</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													id="update${requestScope.Members[0].memberId}Mail"
													name="updateMail" value="${requestScope.Members[0].email}">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-10">
												<input type="hidden" name="updateNo"
													value="${requestScope.Members[0].memberId}">
												<button type="submit" class="btn btn-primary">Confirm</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal end -->
					<!-- Modal photo修改時會彈出的視窗-->
					<div class="modal fade"
						id="PhotoModal${requestScope.Members[0].memberId}" tabindex="-1"
						role="dialog" aria-labelledby="PhotoModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="PhotoModalLabel">更新會員圖片</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="post" action="member.photoUpdate"
										enctype="multipart/form-data">
										<input type="file" name="photo" /> <input type="hidden"
											name="memberID" value="${requestScope.Members[0].memberId}" /> <input
											type="submit"
											id="UpdatePhoto${requestScope.Members[0].memberId}Submit"
											class="invisible" />
									</form>
								</div>
								<div class="modal-footer">
									<label class="btn btn-secondary" data-dismiss="modal">Close</label>
									<label class="btn btn-primary"
										for="UpdatePhoto${requestScope.Members[0].memberId}Submit">Save</label>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal end -->
					<!-- ------------------------------------------主頁面結束位置------------------------------------------ -->
				</div>
				
			</main>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 ml-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/rootfooter' />"></footer>
</body>
</html>