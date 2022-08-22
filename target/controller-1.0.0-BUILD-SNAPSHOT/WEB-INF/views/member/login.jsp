<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>로그인</title>
</head>
<body>


<div class="page-head">
    <div class="container">
        <div class="row">
            <div class="page-head-content">
                <h1 class="page-title">로그인</h1>
            </div>
        </div>
    </div>
</div>
<!-- End page header -->

<script type="text/javascript">
    function enterkey() {
        if (window.event.keyCode == 13) {
            fn_reg();
        }
    }

    function fn_reg() {
        var form = document.loginForm;
        var email = form.email.value;
        var password = form.password.value;

        if (email == "") {
            alert("이메일 정보를 입력하세요.");
            $("#email").focus();
            return false;
        } else if (password == "") {
            alert("패스워드를  입력하세요");
            $("#password").focus();
            return false;
        } else {
            form.submit();
        }
    }
</script>

<!-- register-area -->
<div class="register-area"
     style="background-color: rgb(249, 249, 249);">
    <div class="container">
        <div class="col-md-6">
            <div class="box-for overflow">
                <div class="col-md-12 col-xs-12 login-blocks">
                    <h2>로그인 :</h2>
                    <form action="/member/loginPost" method="post" id="loginForm" name="loginForm">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" name="id">
                        </div>
                        <div class="form-group">
                            <label for="pw">비밀번호</label>
                            <input type="password" class="form-control" id="pw" name="pw">
                        </div>
                        <div class="row">
                            <div class="col-xs-8">
                                <div class="checkbox icheck">
                                    <label>
                                        <input type="checkbox" name="useCookie"> Remember Me
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-default">로그인</button>
                        </div>
                    </form>
                    <br>
<%--
                    <h2>Social login :</h2>

                    <p>
                        <a class="login-social" href="#"><i class="fa fa-facebook"></i>&nbsp;Facebook</a>
                        <a class="login-social" href="#"><i class="fa fa-google-plus"></i>&nbsp;Gmail</a>
                        <a class="login-social" href="#"><i class="fa fa-twitter"></i>&nbsp;Twitter</a>
                    </p>
--%>
                </div>

            </div>
        </div>

    </div>
</div>


</body>
</html>

<%@ include file="../include/footer.jspf" %>