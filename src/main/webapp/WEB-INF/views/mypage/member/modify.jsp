<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/header.jspf" %>
<%@ include file="../../include/myPageHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>회원정보 수정</title>
</head>
<body>

<form role="form" method="post">

<div class="register-area" style="background-color: rgb(249, 249, 249);">
    <div class="container">
        <div class="col-md-6">
            <div class="box-for overflow">
                <div class="col-md-12 col-xs-12 register-blocks">
                    <h2>회원정보 수정 :</h2>
                    <c:if test="${memberVO.rank == 2}">
                        <div class="form-group">
                            <label for="companyno">사업자번호</label>
                            <input type="text" class="form-control" id="companyno" name="companyno"
                                   value="${memberVO.companyno}">
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label for="nickname">닉네임</label>
                        <input type="text" class="form-control" id="nickname" name="nickname"
                               value="${memberVO.nickname}">
                    </div>
                    <div class="form-group">
                        <label for="pw">비밀번호</label>
                        <input type="password" class="form-control" id="pw" name="pw"
                               value="${memberVO.pw}">
                    </div>
                    <div class="form-group">
                        <label for="address">주소</label>
                        <input type="text" class="form-control" id="address" name="address"
                               value="${memberVO.address}">
                    </div>
                    <div class="form-group">
                        <label for="phonenum">전화번호</label>
                        <input type="text" class="form-control" id="phonenum" name="phonenum"
                               value="${memberVO.phonenum}"
                               onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="text" class="form-control" id="email" name="email"
                               value="${memberVO.email}">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary" style="float: left;">저장</button>
                        <button type="submit" class="btn btn-warning" style="float: right;">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        var formObj = $("form[role='form']");
        console.log(formObj);
        $(".btn-warning").on("click", function() {
            formObj.attr("action", "/mypage/member/get");
            formObj.attr("method", "get");
            formObj.submit();
        });
        $(".btn-danger").on("click", function() {
            formObj.attr("action", "/mypage/member/get");
            formObj.submit();
        });
    });
</script>

</body>
</html>

<%@ include file="../../include/footer.jspf" %>