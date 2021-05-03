<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="assets/css/index.css" rel="stylesheet">
<script src="assets/js/index.js"></script>

<form id="form-register" method="post" action="member.register"
	enctype="multipart/form-data">
	<div class="form-row" >
		<h2  id = "inputdemo" class="myMOUSE" >會員註冊</h2>
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
		<div class=""></div>	
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
				
				<option value="新北市">新北市</option>
				<option value="基隆市">基隆市</option>
				<option value="台北市">台北市</option>
				<option value="桃園市">桃園市</option>
				<option value="新竹市">新竹市</option>
				<option value="新竹縣">新竹縣</option>
				<option value="嘉義市">嘉義市</option>
				<option value="嘉義縣">嘉義縣</option>
				<option value="苗栗縣">苗栗縣</option>
				<option value="南投縣">南投縣</option>
				<option value="彰化縣">彰化縣</option>
				<option value="臺中市">臺中市</option>
				<option value="雲林縣">雲林縣</option>
				<option value="臺南市">臺南市</option>
				<option value="高雄市">高雄市</option>
				<option value="屏東縣">屏東縣</option>
				<option value="宜蘭縣">宜蘭縣</option>
				<option value="花蓮縣">花蓮縣</option>
				<option value="臺東縣">臺東縣</option>
				<option value="澎湖縣">澎湖縣</option>
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
		<div class="col-md-4 offset-md-4">
			<button type="submit" class="btn btn-primary" id="checkSubmit" disabled>註冊</button>
		
			<button type="reset" class="btn btn-primary" style="margin-left:40px;" id="removeattr">重置</button>
		</div>
	</div>
</form>
<script type="text/javascript">	
</script>






