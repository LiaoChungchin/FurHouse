<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="form-register" method="post" action="member.register"
	enctype="multipart/form-data">
	<div class="form-row">
		<h2 class="font-weight-bold">會員註冊</h2>
	</div>
	<div class="form-row">
		<div class="form-group col-md-6">
			<label for="accountid">帳號名稱</label> <input type="text"
				class="form-control" id="accountid" name="account"
				placeholder="帳號名稱" required>
			<div class=""></div>
		</div>
		<div class="form-group col-md-6">
			<label for="accountpwd">帳號密碼</label> <input type="password"
				class="form-control" id="accountpwd" name="accountpwd"
				placeholder="帳號密碼" required>
			<div class=""></div>
		</div>
	</div>
	<div class="form-group">
		<label for="accountmail">E-Mail</label> <input type="text"
			class="form-control" id="accountmail" name="accountmail"
			placeholder="電子信箱" required>
	</div>
	<div class="form-row">
		<div class="form-group col-md-6">
			<label for="accountname">姓名</label> <input type="text"
				class="form-control" id="accountname" name="accountname" required>
		</div>
		<div class="form-group col-md-6">
			<label for="accountphone">電話</label> <input type="text"
				class="form-control" id="accountphone" name="accountphone" required>
		</div>
	</div>
	<div class="form-row">
		<div class="form-group col-md-1">
			<label>性別</label>
		</div>
		<div class="form-group col-md-3">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="gender"
					id="radio1" value="male"> <label class="form-check-label"
					for="radio1">男</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="gender"
					id="radio2" value="female"> <label class="form-check-label"
					for="radio2">女</label>
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="form-group col-md-1">
			<label>照片</label>
		</div>
		<div class="form-group col-md-11 custom-file">
			<label for="file1">選擇照片</label> <input type="file"
				name="accountphoto" id="file1">
		</div>
	</div>
	<div class="form-row">
		<div class="form-group col-md-2">
			<label for="select1">城市</label> <select name="accountcity"
				id="select1" class="form-control">
				<option selected>城市</option>
				<option value="基隆市">基隆市</option>
				<option value="新北市">新北市</option>
				<option value="台北市">台北市</option>
			</select>
		</div>
		<div class="form-group col-md-10">
			<label for="accountaddr">地址</label> <input type="text"
				class="form-control" id="accountaddr" name="accountaddr">
		</div>
	</div>
	<div class="form-group">
		<div class="form-check">
			<input class="form-check-input" type="checkbox" id="agreecheck"
				name="agreecheck" value="1"> <label class="form-check-label"
				for="agreecheck">您同意接受服務條款及隱私權保護政策</label>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-2 offset-md-5">
			<button type="submit" class="btn btn-primary btn-lg btn-block">註冊</button>
		</div>
	</div>
</form>