<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jspf"%>



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
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="page-head">
		<div class="container">
			<div class="row">
				<div class="page-head-content">
					<h1 class="page-title">인테리어 견적 신청 목록</h1>
				</div>
			</div>
		</div>
	</div>


	<!-- Main content -->
	<section class="content">

		<!-- Default box -->

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
						<th width="170" class="text-center">지역</th>
						<th width="230" class="text-center">등록일</th>
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
							<td><a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&boardNo=${item.boardNo}'>${item.title}</td>
							<td>${item.address}</td>
							<fmt:parseDate var='regDate' pattern="yyyy-MM-dd HH:mm"
										   value="${item.regDate}" scope="page" />


							<td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm"
												value="${regDate}" /></td>

							<td>${item.view_count}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<!-- /.box-body -->


				<div class="text-center">
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
								   end="${pageMaker.endPage }" var="idx">
							<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="${idx}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
									href="${pageMaker.endPage +1}">&raquo;</a></li>
						</c:if>

					</ul>
				</div>
			<!-- /.box-footer-->
		</div>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<form id="jobForm">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}

	$(".pagination li a").on("click", function(event) {

		event.preventDefault();

		var targetPage = $(this).attr("href");

		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/board/listPage").attr("method", "get");
		jobForm.submit();
	});
</script>

<%@include file="../include/footer.jspf"%>