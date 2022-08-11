<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>

 <style>
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
                        <h1 class="page-title">시공사례 등록</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">
                <div class="clearfix" >
                    <div class="wizard-container">

                        <div class="wizard-card ct-wizard-orange" id="wizardProperty">
                            <form action="write" method="post" >
                                <ul>
                                    <li><a href="#step1" data-toggle="tab">Step 1 </a></li>
                                    <li><a href="#step2" data-toggle="tab">Step 2 </a></li>
                                    <!-- <li><a href="#step3" data-toggle="tab">Step 3 </a></li> -->
                                    <li><a href="#step3" data-toggle="tab">Finished </a></li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane" id="step1">
                                         <h4 class="info-text">  </h4>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label>제목 :</label>
                                                        <textarea class="form-control" id="title" name="title"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label>평수 (숫자만 입력가능합니다) :</label>
                                                        <textarea id="area" name="area" class="form-control" ></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label>시공 비용 :</label>
                                                        <textarea id="cost" name="cost"  class="form-control" ></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label>시공 기간 :</label>
                                                        <textarea id="period" name="period"  class="form-control" ></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-12">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>시공 공간  :</label>
                                                        <select id="space" name="space" class="selectpicker show-tick form-control">
                                                            <option> -Status- </option>
   														<option value="" disabled selected> -Status- </option>
														<option value="아파트">아파트</option>
														<option value="빌라">빌라</option>
														<option value="카페/식당">카페/식당</option>
														<option value="사무/오피스">사무/오피스</option>
														<option value="매장/상업">매장/상업</option>
														<option value="병원/의료">병원/의료</option>
														<option value="기타">기타</option>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>시공 분야  :</label>
                                                        <select id="cnstType" name="cnstType" class="selectpicker show-tick form-control">
															<option value="" disabled selected> -Status- </option>
															<option value="종합">종합</option>
															<option value="도배">도배</option>
															<option value="마루">마루</option>
															<option value="욕실">욕실</option>
															<option value="필름">필름</option>
															<option value="타일">타일</option>
															<option value="도어">도어</option>
															<option value="주방">주방</option>
															<option value="기타">기타</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                        </div>
                                    </div>
                                    <!-- End step 1 -->

                                    <div class="tab-pane" id="step2">
                                        <h4 class="info-text">시공사진을 첨부하고 내용을 입력하세요. </h4>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="property-images">이미지 첨부 :</label>
                                                    <input class="form-control" type="file" id="property-images">
                                                    <p class="help-block">Select multipel images for your property .</p>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="property-video">내용 :</label>
                                                    <textarea class="form-control" name="content"
													id="content" rows="12"></textarea>
                                            	</div>
                                        	</div>
                                    	</div>
                                    </div>
                                    <!--  End step 2 -->


                                    <div class="tab-pane" id="step3">
                                        <h4 class="info-text"> 이용 약관 </h4>
                                        <div class="row" align="center">
                                            <div class="col-sm-12">
                                                <div class="">
                                                    <p>당사 웹사이트에 귀하의 개인 정보가 포함된 업체 광고를 게시하는 등 INTERIOR FRIEND 서비스에 액세스하거나</p>
                                                    <p>사용함으로써 귀하는 법적 적절한 방식으로 귀하의 개인 정보를 수집, 사용 및 공개하는 데 동의하는 것입니다.</p>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="agree"/> <strong>동의합니다.</strong>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--  End step 3 -->

                                </div>

                                <div class="wizard-footer">
                                    <div class="pull-right">
                                        <input type='button' class='btn-next btn-primary' name='next' value='다음' />
                                        <input type='submit' class='btn-finish btn-primary ' name='finish' value='등록하기' />
                                    </div>

                                    <div class="pull-left">
                                        <input type='button' class='btn-previous btn-default' name='previous' value='이전' />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </form>
                        </div>
                        <!-- End submit form -->
                    </div>
                </div>
            </div>
        </div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

 $(document).ready(
			function() {
				$("form")
						.submit(
								function() {
									if ($("#title").val() == "") {
										alert("제목을 간략히 작성해주세요");
										return false;
									}
									if (!$.isNumeric($("#area").val())) {
										alert("면적을 입력해주세요(면적은 숫자만 입력 가능합니다)");
										return false;
									}
									if ($("#cost").val() == "") {
										alert("시공 비용을 입력해주세요");
										return false;
									}
									if ($("#period").val() == "") {
										alert("시공 기간을 입력해주세요");
										return false;
									}
									if ($("#space").val() == null) {
										alert("시공 공간을 선택해주세요");
										return false;
									}
									if ($("#cnstType").val() == null) {
										alert("시공 분야를 선택해주세요");
										return false;
									}
									if ($("#content").val() == "") {
										alert("내용을 입력해주세요");
										return false;
									}
									if (!$("input:checked[Name='agree']").is(":checked")){
                                        alert("이용약관에 동의해주세요");
                                        return false;
                                    }
								}); // submit() end
			}); // ready() end
</script>



<%@ include file="../include/footer.jspf"%>