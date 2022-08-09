<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jspf"%>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Blank page <small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">Blank page</li>
		</ol>
	</section>



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
							<fmt:parseDate var='regDate' pattern="yyyy-MM-dd"
										   value="${item.regDate}" scope="page" />
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${regDate}" /></td>
							<td>${item.view_count}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<!-- /.box-body -->


			<div class="box-footer">
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
							<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
						</c:if>

					</ul>
				</div>
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