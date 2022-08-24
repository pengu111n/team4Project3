<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../include/header.jspf" %>
<%@ include file="../../include/myPageHeader.jsp" %>

<style>
    .margin-space {
        margin-top: 40px;
        margin-left: 15px;
        margin-bottom: 40px;
    }

    .text-center {
        text-align: center;
    }
</style>

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
                    <th width="190" class="text-center">시공분야</th>
                    <th class="text-center">제목</th>
                    <th width="170" class="text-center">지역</th>
                    <th width="230" class="text-center">등록일</th>
                    <th width="60" class="text-center">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="item">
                    <tr>
                        <td>${item.boardNo}</td>
                        <td>${item.nickname}</td>
                        <td>${item.part}</td>
                        <td>
                            <a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&boardNo=${item.boardNo}'>${item.title}
                        </td>
                        <td>${item.address}</td>
                        <fmt:parseDate var='regDate' pattern="yyyy-MM-dd HH:mm"
                                       value="${item.regDate}" scope="page"/>
                        <td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm"
                                            value="${regDate}"/></td>
                        <td>${item.view_count}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- /.box-body -->
        </div>
    </div>
</section>
<!-- /.content -->

<%@ include file="../../include/footer.jspf" %>