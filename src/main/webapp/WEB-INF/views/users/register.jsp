<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf"%>


<div class="page-head">
	<div class="container">
		<div class="row">
			<div class="page-head-content">
				<h1 class="page-title">회원가입</h1>
			</div>
		</div>
	</div>
</div>
<!-- End page header -->

<script type="text/javascript">
function changeRank(){
    var r = document.getElementById("rank");
    var innerR = r.options[r.selectedIndex].value;

    if(innerR == 2){
    document.getElementById("compInput").innerHTML = '<label for="companyno">사업자번호</label><input type="text" class="form-control" id="companyno" name="companyno" placeholder="사업자번호">';
    }else{
        document.getElementById("compInput").innerHTML="";
    }
}

function selectEmail(){
    var email = document.getElementById("email2");
    var innerE = email.options[email.selectedIndex].value;

    if(innerE == "other"){
        document.getElementById("otherEmail").removeAttribute("disabled");
        email.options[email.selectedIndex].value = ""
    }else{
        document.getElementById("otherEmail").setAttribute("disabled", "true");
        document.getElementById("otherEmail").value = "";
        if(email.options[5]){
            email.options[5].value = "other"
        }
    }
}

	function enterkey() {
		if (window.event.keyCode == 13) {
			fn_reg();    	
	    }
	}
	
	function checkNumber(event) {
		  if(event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  
		  return false;
	}


		

    var idPass;
    var idRegex = /^[a-zA-Z0-9]{4,12}$/;

    function idCheck(){
        var id = $('#id').val();
        $.ajax({
            url : "/users/idCheck",
            type : "post",
            dataType : "json",
            data : {"id" : id},
            success : function(data){
                if(data == 1){
                    $('#dup').text("중복된 아이디 입니다.");
                    $("#idCheck_YN").val("N");
                    return false;
                }else{
                    $('#dup').text("사용 가능한 아이디 입니다.");
                    $("#idCheck_YN").val("Y");
                }
            }
        })
    }

    function fnSubmit() {
        if ($("#id").val() == null || $("#id").val() == "") {
            alert("아이디를 입력해주세요.");
            $("#id").focus();
            return false;
        }

        if ($("#idCheck_YN").val() != 'Y') {
            alert("아이디 중복체크를 눌러주세요.");
            $("#memberId_yn").focus();

            return false;
            }



        	if ($("#nickname").val() == null || $("#nickname").val() == "") {
                alert("닉네임을 입력해주세요.");
                   	$("#nickname").focus();
                   	return false;
                   	}

        	if ($("#pw").val() == null || $("#pw").val() == "") {
                alert("비밀번호를 입력해주세요.");
                $("#pw").focus();

                return false;
                                }

            if ($("#confirmPw").val() == null || $("#confirmPw").val() == "") {
                alert("비밀번호 확인을 입력해주세요.");
                 $("#confirmPw").focus();

                 return false;
                 }

            if ($("#pw").val() != $("#confirmPw").val()) {
                alert("비밀번호가 일치하지 않습니다.");
                $("#memberPw2").focus();

                return false;
                }

            if ($("#name").val() == null || $("#name").val() == "") {
                alert("이름을 입력해주세요.");
                $("#name").focus();
                return false;
                }

            if ($("#birth").val() == null || $("#birth").val() == "") {
                alert("생년월일을 입력해주세요.");
                 $("#birth").focus();

                  return false;
                  }
            if ($("#address").val() == null || $("#address").val() == "") {
                 alert("주소을 입력해주세요.");
                 $("#address").focus();

                 return false;
                 }
            if ($("#phonenum").val() == null || $("#phonenum").val() == "") {
                alert("전화번호을 입력해주세요.");
                $("#phonenum").focus();

                 return false;
                 }
            if ($("#phonenum").val() == null || $("#phonenum").val() == "") {
                 alert("전화번호을 입력해주세요.");
                 $("#phonenum").focus();

                 return false;
                 }
        	if ($("#email").val() == null || $("#email").val() == "") {
        	    alert("이메일을 입력해주세요.");
        	    $("#email").focus();

        	    return false;
        	    }

        	if (confirm("회원가입하시겠습니까?")) {

        	$("#join").submit();
            }else{
        	return false;
        	}

        function getFileInfo(fullName) {

            var fileName;   // 화면에 출력할 파일명
            var imgsrc;     // 썸네일 or 파일아이콘 이미지 파일 요청 URL
            var getLink;    // 원본파일 요청 URL

            var fileLink;   // 날짜경로를 제외한 나머지 파일명 (UUID_파일명.확장자)
            // 이미지 파일일 경우
            if (checkImageType(fullName)) {
                // 썸네일 파일 이미지 URL
                imgsrc = "/mypage/file/display?fileName=" + fullName;
                // UUID_파일명.확장자 (s_ 제외 : 원본이미지)
                fileLink = fullName.substr(14);
                // 원본파일 요청 URL
                var front = fullName.substr(0, 12); // 날짜 경로
                var end = fullName.substr(14);      // 파일명(s_ 제외)
                getLink = "/mypage/file/display?fileName=" + front + end;

            // 이미지 파일이 아닐 경우
            } else {
                // 파일 아이콘 이미지 URL
            	imgsrc = "/mypage/resources/upload/files/file-icon.png";
                // UUID_파일명.확장자
                fileLink = fullName.substr(12);
                // 파일 요청 url
                getLink = "/mypage/file/display?fileName=" + fullName;
            }
            // 화면에 출력할 파일명
            fileName = fileLink.substr(fileLink.indexOf("_") + 1);

            return {fileName: fileName, imgsrc: imgsrc, getLink: getLink, fullName: fullName};
        }

        // 이미지 파일 유무 확인
        function checkImageType(fileName) {
            // 정규 표현식을 통해 이미지 파일 유무 확인
            var pattern = /jpg$|gif$|png$|jpge$/i;
            return fileName.match(pattern);
        }


        $(document).ready(function () {
                var fileDropDiv = $(".fileDrop");
                var templatePhotoAttach = Handlebars.compile($("#templatePhotoAttach").html());
                var templateFileAttach = Handlebars.compile($("#templateFileAttach").html());
                // 전체 페이지 파일 끌어 놓기 기본 이벤트 방지 : 지정된 영역외에 파일 드래그 드랍시 페이지 이동방지
                $(".content-wrapper").on("dragenter dragover drop", function (event) {
                    event.preventDefault();
                });
                // 파일 끌어 놓기 기본 이벤트 방지
                fileDropDiv.on("dragenter dragover", function (event) {
                    event.preventDefault();
                });
                // 파일 드랍 이벤트 : 파일 전송 처리, 파일 화면 출력
                fileDropDiv.on("drop", function (event) {
                    event.preventDefault();
                    var files = event.originalEvent.dataTransfer.files;
                    var file = files[0];
                    var formData = new FormData();
                    formData.append("file", file);
                    $.ajax({
                        url: "/users/register/upload",
                        data: formData,
                        dataType: "text",
                        processData: false,
                        contentType: false,
                        type: "POST",
                        success: function (data) {
                            // 파일정보 가공
                            var fileInfo = getFileInfo(data);
                            // 이미지 파일일 경우
                            if (data.substr(12, 2) == "s_") {
                            	console.log("This is Image");
                                var html = templatePhotoAttach(fileInfo);
                            // 이미지 파일이 아닐 경우
                            } else {
                                html = templateFileAttach(fileInfo);
                            }
                            $(".uploadedList").append(html);
                        }
                    });
                });
                // 글 저장 버튼 클릭 이벤트 : 파일명 DB 저장 처리
                $("#writeForm").submit(function (event) {
                    event.preventDefault();
                    var that = $(this);
                    var str = "";
                    $(".uploadedList .delBtn").each(function (index) {
                        str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>"
                    });
                    that.append(str);
                    that.get(0).submit();
                });
                // 파일 삭제 버튼 클릭 이벤트 : 파일삭제, 파일명 DB 삭제 처리
                $(document).on("click", ".delBtn", function (event) {
                    event.preventDefault();
                    var that = $(this);
                    $.ajax({
                        url: "/mypage/file/delete",
                        type: "post",
                        data: {fileName:$(this).attr("href")},
                        dataType: "text",
                        success: function (result) {
                            if (result == "DELETED") {
                                alert("삭제되었습니다.");
                                that.parents("li").remove();
                            }
                        }
                    });
                });
            });

    }
</script>
<script id="templatePhotoAttach" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name" data-lightbox="uploadImages"><i class="fas fa-camera"></i> {{fileName}}</a>
            <a href="{{fullName}}" class="btn btn-default btn-xs float-right delBtn"><i class="far fa-trash-alt"></i></a>
        </div>
    </li>
</script>
<%--일반 파일--%>
<script id="templateFileAttach" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> {{fileName}}</a>
            <a href="{{fullName}}" class="btn btn-default btn-xs float-right delBtn"><i class="far fa-trash-alt"></i></a>
        </div>
    </li>
</script>

<!-- register-area -->
<div class="register-area" style="background-color: rgb(249, 249, 249);">
    <div class="container">
        <div class="col-md-6">
            <div class="box-for overflow">
                <div class="col-md-12 col-xs-12 register-blocks">
                    <h2>새 계정 :</h2>
                    <form name="insForm" action="register" method="post" onsubmit="return fnSubmit()">
                        <div class="form-group">
                        	<label for="rank">회원분류</label> 
                        		<select id="rank" name ="rank" class="selectpicker show-tick form-control" onchange="changeRank()">
       								<option value="1">1:일반회원</option> 
       								<option value="2">2:기업회원</option> 
       								<option value="3">3:관리자</option> 
       							</select>
                        </div>
                        <div class="form-group" id="compInput">
                            
                        </div>
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" name="id" placeholder="ID">
                            <button class="btn btn-default idCheckBtn" type="button" onclick="idCheck()">중복확인</button><span id="dup"></span>
                            <input type="hidden" id="idCheck_YN" name="idCheck_YN" value="N" />
                        </div>
                        <div class="form-group">
                            <label for="nickname">닉네임</label>
                            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임">
                        </div>
                        <div class="form-group">
                            <label for="pw">비밀번호</label>
                            <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
                        </div>
                        <div class="form-group">
                            <label for="pw">비밀번호 확인</label>
                            <input type="password" class="form-control" id="confirmPw" name="confirmPw" placeholder="비밀번호 확인">
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="이름">
                        </div>
                        <div class="form-group">
                            <label for="birth">생년월일</label>
                            <!-- <input type="text" class="form-control" id="birth" name="birth" onkeydown="return checkNumber(event);" placeholder="생년월일"> -->
                            <input type="text" class="form-control" id="birth" name="birth" onKeyup="this.value=this.value.replace(/[^0-9]/g,''); placeholder="생년월일">
                        </div>
                        <div class="form-group">
                            <label for="address">주소</label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="주소">
                        </div>
                        <div class="form-group">
                            <label for="phonenum">전화번호</label>
                            <!-- <input type="text" class="form-control" id="phonenum" name="phonenum" onkeydown="return checkNumber(event);" placeholder="전화번호"> -->
                            <input type="text" class="form-control" id="phonenum" name="phonenum" onKeyup="this.value=this.value.replace(/[^0-9]/g,''); placeholder="전화번호">
                        </div>
                        <div class="form-group email-form">
                            <label for="email">이메일</label>
                            <span>
                            <input type="text" class="form-control form-control_half" id="email" name="email" placeholder="이메일">
                            <span>@</span>
                            <select class="form-control" name="email2" id="email2" onchange="selectEmail()">
                                <option value = "" selected>선택</option>
                                <option value = "naver.com">naver.com</option>
                                <option value = "daum.net">daum.net</option>
                                <option value = "gmail.com">gmail.com</option>
                                <option value = "hanmail.com">hanmail.com</option>
                                <option value = "other">기타</option>
                            </select>
                            </span>
                            <input class="form-control" id="otherEmail" disabled type="text" name="email3">
                        </div>
                        <%--첨부파일 영역 추가--%>
                        <div class="form-group">
                          <div class="fileDrop">
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
                          </div>
                        </div>
                        <%--첨부파일 영역 추가--%>
                        <div class="card-footer">
                        	<ul class="mailbox-attachments clearfix uploadedList"></ul>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-default">회원가입</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .fileDrop {
        width: 100%;
        height: 200px;
        border: 2px dotted #0b58a2;
    }
</style>
<%@ include file="../include/footer.jspf"%>
