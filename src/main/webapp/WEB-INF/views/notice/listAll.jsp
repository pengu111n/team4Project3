<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jspf"%>


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




<!-- board search area -->
<div id="board-search">
	<div class="container">
		<div class="search-window">
			<form action="">
				<div class="search-wrap">
					<label for="search" class="blind">공지사항 내용 검색</label> <input
						id="search" type="search" name="" placeholder="검색어를 입력해주세요."
						value="">
					<button type="submit" class="btn btn-dark">검색</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- board list area -->
<div id="board-list">
	<div class="container">
		<table class="board-table">
			<thead>
				<tr>
					<th scope="col" class="th-num">번호</th>
					<th scope="col" class="th-title">제목</th>
					<th scope="col" class="th-date">등록일</th>



					<!-- 관지자 아니면 공지 작성 버튼 안뜨게 해야하는데 memberVO.rank == 3으로 하면 되려나? -->
					<%--	<c:if test="${authUser.rank == 3}">	--%>
						<div class="collapse navbar-collapse yamm" id="navigation">
							<div class="button navbar-right">
								<a href="/notice/register"
									class="navbar-btn nav-button wow fadeInRight"
									data-wow-delay="0.48s">공지사항 작성</a>
							</div>
						</div>
					<%--	</c:if>	--%>



				</tr>
			</thead>


			<tbody>



			<c:forEach items="${list}" var="item" >

				<tr>
					<td>${item.noticeNo}</td>
					<%--<td><a href='/notice/read${pageMaker.makeQuery(pageMaker.cri.page)}&noticeNo=${item.noticeNo}'>${item.noticeTitle}</td>--%>
						<td><a href='/notice/read?noticeNo=${item.noticeNo}'>${item.noticeTitle}</td>
					<td><fmt:formatDate pattern ="yyyy-MM-dd" value="${item.regDate}"></fmt:formatDate></td>

				<%--    <td>${item.noticeTitle}</td>   --%>
				<%--<td>${item.regDate}</td>
              <fmt:parseDate var='regDate' pattern="yyyy-MM-dd"
                    value="${item.regDate}" scope="page" />
             <td><fmt:formatDate pattern="yyyy-MM-dd"
                         value="${regDate}" /></td>--%>

 </tr>
</c:forEach>




<c:if test="${noticePage.hasArticles()}">
 <tr>
     <td colspan="4"><c:if test="${noticePage.startPage > 5}">
             <a href="notice.do?pageNo=${noticePage.startPage - 5}">[이전]</a>
         </c:if> <c:forEach var="pNo" begin="${noticePage.startPage}"
             end="${noticePage.endPage}">
             <a href="notice.do?pageNo=${pNo}">[${pNo}]</a>
         </c:forEach> <c:if test="${noticePage.endPage < noticePage.totalPages}">
             <a href="notice.do?pageNo=${noticePage.startPage + 5}">[다음]</a>
         </c:if></td>
 </tr>
</c:if>

</tbody>

</table>
</div>
</div>




<%@ include file="../include/footer.jspf"%>
