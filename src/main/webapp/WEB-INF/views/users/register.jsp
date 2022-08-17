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
                          <ul class="mailbox-attachments clearfix uploadedList">
                          </ul>
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

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}"
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>
</script>


<!-- End page header -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

var template = Handlebars.compile($("#template").html());



$(document).ready(function(){
            $(".fileDrop").on("dragenter dragover", function(event){
                event.preventDefault(); // 기본효과를 막음
            });
            // event : jQuery의 이벤트
            // originalEvent : javascript의 이벤트
            $(".fileDrop").on("drop", function(event){
                event.preventDefault(); // 기본효과를 막음
                // 드래그된 파일의 정보
                var files = event.originalEvent.dataTransfer.files;
                // 첫번째 파일
                var file = files[0];
                // 콘솔에서 파일정보 확인
                console.log(file);

                // ajax로 전달할 폼 객체
                var formData = new FormData();
                // 폼 객체에 파일추가, append("변수명", 값)
                formData.append("file", file);


                $.ajax({
                    type: "post",
                    url: "/users/register/uploadAjax",
                    data: formData,
                    processData: false,
                    dataType: "text",
                    contentType: false,
                    success: function(data){
                        var fileInfo = getFileInfo(data);

                        var html = template(fileInfo);

                        $(".uploadedList").append(html);
                    }
                });
            });
        });

        $(".uploadedList").on("click", ".delbtn", function (event) {
            event.preventDefault();
            var that = $(this);
            $.ajax({
                url: "/users/register/deleteFile",
                type: "post",
                data: {fileName:$(this).attr("href")},
                dataType: "text",
                success: function (result) {
                    if (result == "deleted") {
                        alert("삭제되었습니다.");
                        that.parents("li").remove();
                    }
                }
            });
        });

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
     }



</script>


<%@ include file="../include/footer.jspf"%>
