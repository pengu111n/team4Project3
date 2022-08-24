<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf"%>

<link rel="stylesheet" href="/resources/css/member.css">



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
                    <form name="insForm" action="register" method="post" onsubmit="fnSubmit(); SUMaddress();">
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
                            <input type="text" class="form-control" id="id" name="id" placeholder="ID" onblur="idCheck()" maxlength="20">
                            <span id="dupId">중복된 아이디 입니다.</span>
                            <span class="regexId">6-20자의 영문 소문자와 숫자만 사용가능합니다.</span>
                            <span class="successId">멋진 아이디군요!</span>
                            <span class="empty emptyID">필수 정보입니다.</span>
                            <input type="hidden" id="idCheck_YN" name="idCheck_YN" value="N" />
                        </div>
                        <div class="form-group">
                            <label for="nickName">닉네임</label>
                            <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임" onblur="nickNameCheck()">
                            <span class="nickNameCK">중복된 닉네임 입니다.</span>
                            <span class="empty emptyNickName">필수 정보입니다.</span>
                        </div>
                        <div class="form-group">
                            <label for="pw">비밀번호</label>
                            <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" onblur="regexPW()">
                            <span class= regexPW>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
                            <span class="empty emptyPW">필수 정보입니다.</span>
                        </div>
                        <div class="form-group">
                            <label for="pw">비밀번호 확인</label>
                            <input type="password" class="form-control" id="confirmPw" name="confirmPw" placeholder="비밀번호 확인" onblur="confirmPW()">
                            <span class="samePW">비밀번호가 일치하지 않습니다.</span>
                            <span class="empty emptyPW1">필수 정보입니다.</span>
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="이름" onblur="emptyName()">
                            <span class="empty emptyName">필수 정보입니다.</span>
                        </div>
                        <div class="form-group">
                            <label for="birth">생년월일</label>
                            <!-- <input type="text" class="form-control" id="birth" name="birth" onkeydown="return checkNumber(event);" placeholder="생년월일"> -->
                            <span id="birth">
                            <input type="text" class="form-control" name="yy" id="yy" placeholder="생년월일" onblur="emptyBirth()">
                            <input type="number" class="form-control" name="yy" id="yy" placeholder="생년월일" onblur="emptyBirth()" maxlength="4">
                            <select name="mm" id="mm" class="month form-control"></select>
                            <input type="text" name="dd" id="dd" class="form-control">
                            <input type="number" name="dd" id="dd" class="form-control" maxlength="2" onblur="emptyDay()">
                            </span>
                            <span class="empty emptyBirth">필수 정보입니다.</span>
                            <span class="lengthCK">태어난 년도 4자리를 정확하게 입력하세요.</span>
                        </div>
                        <div class="form-group">
                            <label for="address">주소</label>
                            <input type="hidden" class="form-control" id="address" name="address" placeholder="주소">
                            <span class="half">
                            <input type="text" id="sample4_postcode" class="form-control address_40%" placeholder="우편번호" readonly>
                            <input type="button" onclick="sample4_execDaumPostcode()" class="form-control address_40%" value="우편번호 찾기">
                            </span>
                            <input type="text" id="sample4_roadAddress" class="form-control address_40%" placeholder="도로명주소" readonly>
                            <input type="text" id="sample4_jibunAddress" class="form-control address_40%" placeholder="지번주소" readonly>
                            <span id="guide" style="color:#999;display:none"></span>
                            <input type="text" id="sample4_detailAddress" placeholder="상세주소" class="form-control address_40%" oninput="SUMaddress()">
                            <input type="text" id="sample4_detailAddress" placeholder="상세주소" class="form-control address_40%" onchange="SUMaddress()">
                            <input type="text" id="sample4_extraAddress" class="form-control address_40%" placeholder="참고항목" readonly>
                        </div>
                        <div class="form-group">
                            <label for="phoneNum">전화번호</label>
                            <!-- <input type="text" class="form-control" id="phoneNum" name="phoneNum" onkeydown="return checkNumber(event);" placeholder="전화번호"> -->
                            <input type="text" class="form-control" id="phoneNum" name="phoneNum" placeholder="전화번호" onblur="emptyPhone()">
                            <input type="text" class="form-control" id="phoneNum" name="phoneNum" placeholder="전화번호" onblur="regexPhone()" maxlength="11">
                            <span class="regPhone">형식에 맞지 않는 번호입니다</span>
                            <span class="empty emptyPhone">필수 정보입니다.</span>
                        </div>
                        <div class="form-group email-form">
                            <label for="email">이메일</label>
                            <span>
                            <input type="text" class="form-control form-control_half" id="email" name="email" placeholder="이메일" onblur="emptyMail()">
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
                            <b class="empty emptyMail">필수 정보입니다.</b>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/address.js"></script>

<script type="text/javascript" src="/resources/js/memberUpload.js"></script>
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

<script src="/resources/js/member.js"></script>


<%@ include file="../include/footer.jspf"%>