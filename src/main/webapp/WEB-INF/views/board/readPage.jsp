<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../include/header.jspf" %>
<script src="${pageContext.request.contextPath}/resources/Board/js/readPage.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/resources/Board/js/upload.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Board/css/readPage.css">

<%
    // 줄바꿈
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%>

<style type="text/css">
    .popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front {
        z-index:1110; opacity:1; boarder:1px; margin: auto;
    }
    .show{
        position:relative;
        max-width: 1200px;
        max-height: 800px;
        overflow: auto;
    }

</style>
<div class='popup back' style="display:none;"></div>
<div id="popup_front" class='popup front' style="display:none;">
    <img id="popup_img">
</div>
<div class="page-head">
    <div class="container">
        <div class="row">
            <div class="page-head-content">
                <h1 class="page-title">인테리어 견적</h1>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <form role="form" action="modifyPage" method="post">

            <input type='hidden' name='boardNo' value="${boardVO.boardNo}">
            <input type='hidden' name='page' value="${cri.page}">
            <input type='hidden' name='perPageNum' value="${cri.perPageNum}">

        </form>
        <table class="table table-bordered margin-space"
               style="border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="3" class="text-center">시공 의뢰 게시글</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th width="90" class="text-center">번호</th>
                <td>${boardVO.boardNo}</td>
            </tr>
            <tr>
                <th class="text-center">제목</th>
                <td><c:out value='${boardVO.title}'/></td>
            </tr>
            <tr>
                <th class="text-center">작성자</th>
                <td>${boardVO.nickname}</td>
            </tr>
            <tr>
                <th class="text-center">시공분야</th>
                <td><u:pre value='${boardVO.part}'/></td>
            </tr>
            <tr>
                <th class="text-center">주거유형</th>
                <td><u:pre value='${boardVO.category}'/></td>
            </tr>
            <tr>
                <th class="text-center">주소</th>
                <td><u:pre value='${boardVO.address}'/></td>
            </tr>
            <tr>
                <th class="text-center">평수(면적)</th>
                <td><c:out value='${boardVO.area}'/></td>
            </tr>
            <tr>
                <th width="140" class="text-center">시공 시작일</th>

                <fmt:parseDate var='startDate' pattern="yyyy-MM-dd"
                               value="${boardVO.startDate}" scope="page"/>

                <c:choose>
                    <c:when test="${startDate eq 'Sat Jan 01 00:00:00 KST 1'}">
                        <td><c:out value='미정'/></td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatDate value="${startDate}"
                                            pattern="yyyy년 MM월 dd일"/></td>
                    </c:otherwise>
                </c:choose>

            </tr>
            <tr>
                <th class="text-center">시공 마감일</th>
                <fmt:parseDate var='endDate' pattern="yyyy-MM-dd"
                               value="${boardVO.endDate}" scope="page"/>
                <c:choose>
                    <c:when test="${endDate eq 'Sat Jan 01 00:00:00 KST 1'}">
                        <td><c:out value='미정'/></td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatDate value="${endDate}"
                                            pattern="yyyy년 MM월 dd일"/></td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <th class="text-center">예산</th>
                <c:choose>
                    <c:when test="${boardVO.budget eq '-1'}">
                        <td><c:out value='업체 협의'/></td>
                    </c:when>
                    <c:otherwise>
                        <td><u:pre value='${boardVO.budget}'/></td>
                    </c:otherwise>
                </c:choose>

            </tr>
            <tr>
                <th class="text-center">이미지</th>
                <td>

                <ul class="mailbox-attachments clearfix uploadedList"></ul>
                </td>

            </tr>
            <tr>
                <th class="text-center">요청사항</th>
                <%-- 					<td><c:out value='${boardData.board.require}' /></td> --%>
                <td>${fn:replace(boardVO.require, cn, br)}</td>
            </tr>
            </tbody>
        </table>


        <div class="margin-space" style="text-align: right">
            <c:set var="pageNo"
                   value="${empty param.pageNo ? '1' : param.pageNo}"/>

            <%--<a href="list.do?pageNo=${pageNo}" class="btn btn-primary ">목록</a>
            <a href="modify.do?no=${boardData.board.boardNo}" class="btn btn-warning">수정</a>
            <a onclick="return confirm('정말로 삭제하시겠습니까?')"	href="delete.do?no=${boardData.board.boardNo}" class="btn btn-danger">삭제</a>
            --%>
            <div class="box-footer">
                <button type="submit" class="btn btn-warning">Modify</button>
                <button type="submit" class="btn btn-danger">REMOVE</button>
                <button type="submit" class="btn btn-primary">LIST ALL</button>
            </div>


        </div><!-- /.box -->
    </div><!--/.col (left) -->


<!-- /.row -->
<div class="row">
    <div class="col-md-12">

        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">ADD NEW REPLY</h3>
            </div>
            
            <div class="box-body">
                <label>Writer</label> 
                <input class="form-control" type="text" placeholder="USER ID"
                       id="newReplyWriter"> 
                <label>Reply Text</label> 
                <input class="form-control" type="text"
                       placeholder="REPLY TEXT" id="newreplyContent">
            </div>
            
            <!-- /.box-body -->
            <div class="box-footer">
                <button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
            </div>
        </div>

        <!-- The time line -->
        <ul class="timeline">
            <!-- timeline time label -->
            <li class="time-label" id="repliesDiv">
                <span class="bg-green">	Replies List </span>
            </li>
        </ul>

        <div class='text-center'>
            <ul id="pagination" class="pagination pagination-sm no-margin ">
            </ul>
        </div>

    </div>
    <!-- /.col -->
</div>
<!-- /.row -->

</div>

<!-- /.content -->

<script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{fullName}}'>
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
            </span>
        </div>
    </li>
</script>

<script id="template" type="text/x-handlebars-template">
    {{#each .}}
    <li class="replyLi" data-replyNo={{replyNo}}>
        <i class="fa fa-comments bg-blue"></i>
        <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regDate}}
  </span>
            <h3 class="timeline-header"><strong>{{replyNo}}</strong> -{{nickname}}</h3>
            <div class="timeline-body">{{replyContent}} </div>
            <div class="timeline-footer">
                <a class="btn btn-primary btn-xs"
                   data-toggle="modal" data-target="#modifyModal">Modify</a>
            </div>
        </div>
    </li>
    {{/each}}
</script>


<script>
    Handlebars.registerHelper("prettifyDate", function(timeValue) {
        var dateObj = new Date(timeValue);
        var year = dateObj.getFullYear();
        var month = dateObj.getMonth() + 1;
        var date = dateObj.getDate();
        return year + "/" + month + "/" + date;
    });

    var printData = function(replyArr, target, templateObject) {

        var template = Handlebars.compile(templateObject.html());

        var html = template(replyArr);
        $(".replyLi").remove();
        target.after(html);

    }

    var boardNo = ${boardVO.boardNo};

    var replyPage = 1;

    function getPage(pageInfo) {

        $.getJSON(pageInfo, function(data) {
            printData(data.list, $("#repliesDiv"), $('#template'));
            printPaging(data.pageMaker, $(".pagination"));

            $("#modifyModal").modal('hide');

        });
    }

    var printPaging = function(pageMaker, target) {

        var str = "";

        if (pageMaker.prev) {
            str += "<li><a href='" + (pageMaker.startPage - 1)
                + "'> << </a></li>";
        }

        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
            var strClass = pageMaker.cri.page == i ? 'class=active' : '';
            str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
        }

        if (pageMaker.next) {
            str += "<li><a href='" + (pageMaker.endPage + 1)
                + "'> >> </a></li>";
        }

        target.html(str);
    };

    $("#repliesDiv").on("click", function() {

        if ($(".timeline li").size() > 1) {
            return;
        }
        getPage("/replies/" + boardNo + "/1");

    });


    $(".pagination").on("click", "li a", function(event){

        event.preventDefault();

        replyPage = $(this).attr("href");

        getPage("/replies/"+boardNo+"/"+replyPage);

    });

    $("#replyAddBtn").on("click",function(){

        var replyerObj = $("#newReplyWriter");
        var replytextObj = $("#newReplyText");
        var nickname = replyerObj.val();
        var replyContent = replytextObj.val();

        $.ajax({
            type:'post',
            url:'/replies/',
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST" },
            dataType:'text',
            data: JSON.stringify({boardNo:boardNo, nickname:nickname, replyContent:replyContent}),
            success:function(result){
                console.log("result: " + result);
                if(result == 'SUCCESS'){
                    alert("등록 되었습니다.");
                    replyPage = 1;
                    getPage("/replies/"+boardNo+"/"+replyPage );
                    replyerObj.val("");
                    replytextObj.val("");
                }
            }
        });
    });
</script>




<script>
    $(document).ready(function(){

        var formObj = $("form[role='form']");

        console.log(formObj);

        $("#modifyBtn").on("click", function(){
            formObj.attr("action", "/board/modifyPage");
            formObj.attr("method", "get");
            formObj.submit();
        });

        $("#removeBtn").on("click", function(){
            formObj.attr("action", "/board/removePage");
            formObj.submit();
        });

        $("#goListBtn ").on("click", function(){
            formObj.attr("method", "get");
            formObj.attr("action", "/board/list");
            formObj.submit();
        });

    });
</script>

<script>
    $(document).ready(function(){

        var formObj = $("form[role='form']");

        console.log(formObj);

        $("#modifyBtn").on("click", function(){
            formObj.attr("action", "/board/modifyPage");
            formObj.attr("method", "get");
            formObj.submit();
        });

        /* 	$("#removeBtn").on("click", function(){
                formObj.attr("action", "/sboard/removePage");
                formObj.submit();
            }); */


        $("#removeBtn").on("click", function(){

            var replyCnt =  $("#replycntSmall").html();

            if(replyCnt > 0 ){
                alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
                return;
            }

            var arr = [];
            $(".uploadedList li").each(function(index){
                arr.push($(this).attr("data-src"));
            });

            if(arr.length > 0){
                $.post("/deleteAllFiles",{files:arr}, function(){

                });
            }

            formObj.attr("action", "/board/removePage");
            formObj.submit();
        });

        $("#goListBtn ").on("click", function(){
            formObj.attr("method", "get");
            formObj.attr("action", "/board/list");
            formObj.submit();
        });

        var boardNo = ${boardVO.boardNo};
        var template = Handlebars.compile($("#templateAttach").html());

        $.getJSON("/board/getAttach/"+boardNo,function(list){
            $(list).each(function(){

                var fileInfo = getFileInfo(this);

                var html = template(fileInfo);

                $(".uploadedList").append(html);

            });
        });



        $(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){

            var fileLink = $(this).attr("href");

            if(checkImageType(fileLink)){

                event.preventDefault();

                var imgTag = $("#popup_img");
                imgTag.attr("src", fileLink);

                console.log(imgTag.attr("src"));

                $(".popup").show('slow');
                imgTag.addClass("show");
            }
        });

        $("#popup_img").on("click", function(){

            $(".popup").hide('slow');

        });



    });
</script>

<%@include file="../include/footer.jspf" %>
  