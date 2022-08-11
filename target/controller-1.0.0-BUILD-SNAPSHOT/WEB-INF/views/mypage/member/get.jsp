<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/header.jspf" %>
<%@ include file="../../include/myPageHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>회원정보 조회</title>
</head>
<body>

<form role="form" method="post">
    <input type='hidden' name='memno' value="${memberVO.memno}">
</form>

<div class="register-area" style="background-color: rgb(249, 249, 249);">
    <div class="container">
        <div class="col-md-6">
            <div class="box-for overflow">
                <div class="col-md-12 col-xs-12 register-blocks">
                    <h2>회원정보 조회 :</h2>
                    <div class="form-group">
                        <label for="rank">회원분류</label>
                        <input type="text" class="form-control" id="rank" name="rank" value="${memberVO.rank}"
                               readonly="readonly">
                    </div>
                    <c:if test="${memberVO.rank == 2}">
                        <div class="form-group">
                            <label for="companyno">사업자번호</label>
                            <input type="text" class="form-control" id="companyno" name="companyno"
                                   value="${memberVO.companyno}" readonly="readonly">
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id"
                               value="${memberVO.id}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="nickname">닉네임</label>
                        <input type="text" class="form-control" id="nickname" name="nickname"
                               value="${memberVO.nickname}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="pw">비밀번호</label>
                        <input type="password" class="form-control" id="pw" name="pw"
                               value="${memberVO.pw}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name"
                               value="${memberVO.name}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="birth">생년월일</label>
                        <input type="text" class="form-control" id="birth" name="birth"
                               value="${memberVO.birth}" readonly="readonly"
                               onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    </div>
                    <div class="form-group">
                        <label for="address">주소</label>
                        <input type="text" class="form-control" id="address" name="address"
                               value="${memberVO.address}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="phonenum">전화번호</label>
                        <input type="text" class="form-control" id="phonenum" name="phonenum"
                               value="${memberVO.phonenum}" readonly="readonly"
                               onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="text" class="form-control" id="email" name="email"
                               value="${memberVO.email}" readonly="readonly">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-warning" style="float: left;">회원정보 수정</button>
                        <button type="submit" class="btn btn-danger" style="float: right;">회원 탈퇴</button>
<%--                        <a onclick="return confirm('정말로 탈퇴 하시겠습니까?')"--%>
<%--                           href="${pageContext.request.contextPath}/member/delete.do?no=${authUser.id}"--%>
<%--                           class="btn btn-default" style="float: right;">회원탈퇴</a>--%>
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
            formObj.attr("action", "/mypage/member/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });
        $(".btn-danger").on("click", function() {
            formObj.attr("action", "/mypage/member/remove");
            formObj.submit();
        });
    });
</script>

</body>
</html>

<%@ include file="../../include/footer.jspf" %>