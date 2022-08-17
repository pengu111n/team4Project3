<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="page-head">
    <div class="container">
        <div class="row">
            <div class="page-head-content">
                <h1 class="page-title">공지사항</h1>
            </div>
        </div>
    </div>
</div>
<!-- End page header -->

<div class="ArticleContentBox">
    <div class="container read__container">
        <div class="header">
            <div class="header__title">

                <span><h2><c:out value="${noticeVO.noticeTitle}"/></h2></span>
            </div>
            <div class="header__nickname">
                <span>${noticeVO.nickname}</span>
            </div>
            <div class="header__date">
                <%--	<span><h6><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" value="${noticeVO.regdate}"/></h6></span>--%>
                <span>
          	<%--        <c:if test="${noticeData.notice.writer.memNo == authUser.memno || authUser.rank == 3}">     --%>


                    <!-- 관지자 아니면 공지 수정 삭제 버튼 안뜨게 해야하는데 memberVO.rank == 3으로 하면 되려나? -->
					<%--	<c:if test="${authUser.rank == 3}">	--%>

                    <!-- /remove는 해당 페이지에서 바로 처리하니까 별도로 필요 없지?   -->


 <!--
  http://localhost:8081/notice/read?noticeNo=5
  http://localhost:8081/remove?noticeNo=5

  -->

          		<a href="/notice/remove?noticeNo=${noticeVO.noticeNo}"
                   onclick="confirm('삭제하시겠습니까?')">삭제</a>



          	    <a href="/notice/modify?noticeNo=${noticeVO.noticeNo}">수정</a>
          <%--	    </c:if>     --%>





          	<input id="minus" type="button" value="-">
          	<input id="plus" type="button" value="+"></span>
            </div>
        </div>
        <div class="content">
            ${noticeVO.noticeContent}
        </div>
    </div>
</div>


<script>
    const minus = document.getElementById("minus");
    const plus = document.getElementById("plus");


    let fontsize = 16;


    function onMinusClick() {
        if (fontsize > 4) {
            fontsize -= 2;
            document.querySelector(".content").style.fontSize = fontsize + "px";
        }
    }

    function onPlusClick() {
        if (fontsize < 50) {
            fontsize += 2;
            document.querySelector(".content").style.fontSize = fontsize + "px";
        }
    }

    minus.addEventListener("click", onMinusClick);
    plus.addEventListener("click", onPlusClick);




</script>
<%@ include file="../include/footer.jspf" %>
        