<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="LoginTitle">登入中</h3>
            <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <form class="form-login" method="get" action="login.autoSelect">
                <img class="mb-4 rounded mx-auto d-block" src="assets/img/Catbow.png" alt="" width="72" height="72">
                <button class="btn btn-lg btn-primary btn-block" type="submit">以此身分繼續?</button>
                <p class="mt-2 mb-3 text-muted text-center">&copy; 2021-2021</p>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary invisible"
                    data-dismiss="modal">離開
            </button>
            <a href="logout" class="try-me btn btn-primary">登出</a>
        </div>
    </div>
</div>