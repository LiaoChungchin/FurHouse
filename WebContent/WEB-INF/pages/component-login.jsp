<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-dialog modal-dialog-centered modal-sm" role="document" style="max-width:335px">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="LoginTitle">會員登入<i class="bi bi-toggle-off" id="master"></i></h3>
            <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <form class="form-login" method="post" action="login.check">
                <img class="mb-4 rounded mx-auto d-block" src="assets/img/Catbow.png" alt="" width="72" height="72">
                <label for="inputAccount" class="sr-only">Account ID</label>
                <input type="text" id="inputAccount" name="inputAccount" class="form-control my-2" placeholder="Account ID" required>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
                <div class="checkbox mt-1 mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <div class="g-recaptcha my-3" id="recaptcha"></div>
                <button class="btn btn-lg btn-info btn-block" id="userLoginButton" type="submit" disabled>登入</button>
                <p class="mt-2 mb-3 text-muted text-center">&copy; 2021-2021</p>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary"
                    data-dismiss="modal">離開
            </button>
            <a href="javascript:;" class="try-me btn btn-info" id="masterMode1" >我要註冊</a>
        </div>
    </div>
</div>