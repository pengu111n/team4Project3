<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf" %>

<style>
	.margin-space {
		margin-top: 40px;
		margin-left: 15px;
		margin-bottom: 40px;
	}

	.text-center {
		text-align: center;
	}

	.btn-primary {
		color: #fff;
		background-color: #fdc600;
		border-color: #fdc600;
		border-radius: 1px;
		padding: 10px 20px;
		font-weight: 600;
	}
</style>


<div class="page-head">
	<div class="container">
		<div class="row">
			<div class="page-head-content">
				<h1 class="page-title">인테리어 견적 신청 목록</h1>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<table class="table table-bordered margin-space" style="text-align: center; border: 1px solid #dddddd">

		<thead>
		<tr>
			<th width="60" class="text-center">번호</th>
			<th width="130" class="text-center">닉네임</th>
			<th width="90"><select name="sch_category_2"
								   id="category2_submit">
				<option value="">시공분야</option>
				<option value="A">종합</option>
				<option value="A1">도배</option>
				<option value="A2">장판</option>
				<option value="A3">마루</option>
				<option value="A4">욕실</option>
				<option value="A5">주방</option>
				<option value="A6">필름</option>
				<option value="A7">타일</option>
				<option value="A8">도어</option>
			</select></th>
			<th class="text-center">제목</th>
			<th width="140" class="text-center">지역</th>
			<th width="140" class="text-center">등록일</th>
			<!-- <th width="140" class="text-center">수정일</th> -->
			<th width="60" class="text-center">조회수</th>
		</tr>
	</thead>
	<tbody>

            <c:forEach items="${list}" var="item" >
            <tr>
                <td>${item.boardNo}</td>
                	<td>${item.nickname}</td>
                    <td>${item.part}</td>
                    <td><a href='/board/read?boardNo=${item.boardNo}'>${item.title}</td>
                    <td>${item.address}</td>
					<td>${item.regDate}</td>
					<fmt:parseDate var='regDate' pattern="yyyy-MM-dd"
							   value="${item.regDate}" scope="page" />
					<td><fmt:formatDate value="${regDate}"
									pattern="yyyy년 MM월 dd일" /></td>
				<td>${item.view_count}</td>
                </tr>
                </c:forEach>

	</tbody>
	</table>

		<div class="margin-space" style="text-align: right">
			게시글 작성
		</div>


<%@ include file="../include/footer.jspf" %>