<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jspf" %>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Board/css/register.css">
<script src="${pageContext.request.contextPath}/resources/Board/js/register.js"></script>
<script src="${pageContext.request.contextPath}/resources/Board/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style>
    .fileDrop {
        width: 80%;
        height: 100px;
        border: 1px dotted gray;
        background-color: #a2a098;
        margin: auto;

    }
</style>

<div class="page-head">
    <div class="container">
        <div class="row">
            <div class="page-head-content">
                <h1 class="page-title">인테리어 견적 신청</h1>
            </div>
        </div>
    </div>
</div>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <div class="register-area"
         style="background-color: rgb(249, 249, 249);">

        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">신청서 작성</h3>
            </div>
            <div class="box-body">

                <form id='registerForm' role="form" method="post">

                    <div class="form-row">

                        <div class="form-group">
                            <label>제목</label>
                            <input type="text" class="form-control" name="title" id="title"
                                   placeholder="시공내용을 간략하게 적어주세요 (20자이내)">
                        </div>

                        <div class="form-group">
                            <label>주거유형</label> <select
                                class="form-control" name="category" id="category">
                            <option value="" disabled selected>주거유형</option>
                            <option value="아파트">아파트</option>
                            <option value="빌라">빌라</option>
                            <option value="카페/식당">카페/식당</option>
                            <option value="사무/오피스">사무/오피스</option>
                            <option value="매장/상업">매장/상업</option>
                            <option value="병원/의료">병원/의료</option>
                            <option value="기타">기타</option>
                        </select>
                        </div>

                        <div class="form-group" style="width: 400px;">
                            <label>주소</label> <br> <select
                                class="form-control" name="address_1" id="address_1"
                                style="width: 160px; display: inline-block;"></select> <select
                                class="form-control" name="address_2" id="address_2"
                                style="width: 160px; display: inline-block;"></select>
                            <input type="hidden" id="address" name="address" value="">
                        </div>

                        <div class="form-group">
                            <label>면적</label>
                            <div class="input-group"
                                 style="width: 320px; margin-top: 0px; margin-bottom: 0px;">
                                <div class="input-group-addon">평수</div>
                                <input type="number" class="form-control" name="area"/>
                                <div class="input-group-addon">평</div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label>시공 시작일</label>
                            <input type="date"
                                   class="form-control" name="startDate" id="startDate">
                        </div>
                        <div class="form-group">
                            <label>시공 종료일</label>
                            <input type="date"
                                   class="form-control" name="endDate" id="endDate">
                        </div>

                        <label>시공 시작일 미정</label>
                        <input type="checkbox" id="undefined_start" name="undefined_start"
                               style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">
                        <label>시공 종료일 미정</label>
                        <input type="checkbox" id="undefined_end"
                               name="undefined_end"
                               style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">


                        <div class="form-group">
                            <div class="form-row">
                                희망 예산
                                <div class="input-group"
                                     style="width: 320px; margin-top: 0px; margin-bottom: 0px;">
                                    <input type="number" class="form-control" name="budget_defined"/>
                                    <div class="input-group-addon">만원</div>
                                </div>
                            </div>
                        </div>


                        <label>업체 협의</label>
                        <input type="checkbox" id="budget_undefined"
                               name="budget_undefined"
                               style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">

                        <input type="hidden" id="budget" name="budget" value="">


                        <div class="form-group">
                            <label>인테리어 분야</label>
                            <select class="form-control" name="part" id="part">
                                <option value="" disabled selected>인테리어 분야</option>
                                <option value="종합">종합</option>
                                <option value="도배">도배</option>
                                <option value="마루">마루</option>
                                <option value="욕실">욕실</option>
                                <option value="타일">타일</option>
                                <option value="도어">도어</option>
                                <option value="주방">주방</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>


                        <div class="form-group">
                            상세 요청사항
                            <textarea class="form-control" name="require"
                                      id="exampleFormControlTextarea1" rows="7"></textarea>
                        </div>

                        <!--
                        <div class="form-group">
                            이미지
                            <input type="text" class="form-control"
                                   name="image" id="image">
                        </div>-->
                        <div class="form-group">
                            <label>File DROP Here</label>
                            <div class="fileDrop" name="image" id="image"></div>


                        <div>
                            <hr>
                        </div>

                        <ul class="mailbox-attachments clearfix uploadedList" style=" list-style: none; padding-left: 0px;">
                        </ul>
                        </div>

                        <div class="col-md-offset-2"
                             style="margin-left: 0px; margin-top: 50px;">
                            <input type="button" class="cancel_btn" name="cancel" value="취소"
                                   onClick="location.href='/main/index'"
                                   style="display: inline-block;">
                            <button type="submit" class="btn btn-primary" style="width: 150px;
                                    height: 60px;">신청</button>
                        </div>
                    </div>

                </form>


            </div>
        </div>

        <!-- /.box-body -->
    </div>
</div>


<script id="template" type="text/x-handlebars-template">
    <li>
        <div class="mailbox-attachment-info">
            <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
            <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
            <a href="{{fullName}}"
               class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
            </span>
        </div>
    </li>
</script>

<script>

    var template = Handlebars.compile($("#template").html());

    $(".fileDrop").on("dragenter dragover", function (event) {
        event.preventDefault();
    });


    $(".fileDrop").on("drop", function (event) {
        event.preventDefault();

        var image = event.originalEvent.dataTransfer.files;

        var file = image[0];

        var formData = new FormData();

        formData.append("file", file);


        $.ajax({
            url: '/uploadAjax',
            data: formData,
            dataType: 'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (data) {

                var fileInfo = getFileInfo(data);

                var html = template(fileInfo);

                $(".uploadedList").append(html);
            }
        });
    });


    $("#registerForm").submit(function (event) {
        event.preventDefault();

        var that = $(this);

        var str = "";
        $(".uploadedList .delbtn").each(function (index) {
            str += "<input type='hidden' name='image[" + index + "]' value='" + $(this).attr("href") + "'> ";
        });

        that.append(str);

        budget_check();
        startDate_check();
        endDate_check();

        if (input_check()) {
            that.get(0).submit();
        }

    });

    $(".uploadedList").on("click", ".delbtn", function (event) {
        var that = $(this);

        $.ajax({
            url: "/deleteFile",
            type: "post",
            data: {fileName: $(this).attr("href") },
            dataType:"text",
            success: function (result) {
                if (result == 'deleted') {
                    that.parent("div").remove();
                }
            }
        });
        return false;
    });


</script>

<%@ include file="../include/footer.jspf" %>