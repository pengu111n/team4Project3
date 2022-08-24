<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf"%>

 <!-- iCheck -->
    <link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>




<!-- <!DOCTYPE html>
<html>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {
			fn_reg();    	
	    }
	}

	function fn_reg(){
		var form = document.loginForm;
		var email = form.email.value;
		var password = form.password.value;
		
		if(email == ""){
			alert("이메일 정보를 입력하십시오.");
			$("#email").focus();
			return false;
		}else if(password == ""){
			alert("패스워드를  입력하세요");
			$("#password").focus();
			return false;
		}else{
			form.submit();
		}
	}

</script>-->


	<!-- register-area -->
	<div class="register-area"
		style="background-color: rgb(249, 249, 249);">
		<div class="container">
<!-- 
			<div class="col-md-6">
				<div class="box-for overflow">
					<div class="col-md-12 col-xs-12 register-blocks">
						<h2>New account :</h2>
						<form action="" method="post">
							<div class="form-group">
								<label for="name">Name</label> <input type="text"
									class="form-control" id="name">
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input type="text"
									class="form-control" id="email">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-default">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
 -->
			<div class="col-md-6">
				<div class="box-for overflow">
					<div class="col-md-12 col-xs-12 login-blocks">
						<h2>로그인 :</h2>
						<form action="/member/login" method="post">
							<div class="form-group">
								<label for=" id">아이디</label> <input type="text" class="form-control" id="id" name= "id" >
							</div>
							<div class="form-group">
								<label for="pw">비밀번호</label> <input type="password" class="form-control" id="pw" name="pw">
							</div>
						<!-- 자동 로그인 체크박스  -->
				<div class="row">
					<div class="col-md-12 col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox" name="useCookie">
								자동로그인
							</label>
						</div>
					</div>
							<div class="text-center">
								<button type="submit" class="btn btn-default"><h5>로그인</h5></button>
							</div>

					<!-- /.col -->
					
					<!-- /.col -->
				</div>
			</form>
					<script>
				$(function() {
					$('input').iCheck({
						checkboxClass : 'icheckbox_square-blue',
						radioClass : 'iradio_square-blue',
						increaseArea : '20%' // optional
					});
				});
			</script>
		</div>
	</div>
			
						<br>

						<!--  ><h2>Social login :</h2>-->

						<!--<p>
							<a class="login-social" href="#"><i class="fa fa-google-plus"></i>&nbsp;Gmail</a>
						</p>-->
					</div>

				</div>
			</div>


</html>

<%@ include file="../include/footer.jspf"%>


