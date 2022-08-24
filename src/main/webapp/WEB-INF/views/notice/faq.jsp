<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/infoBoard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/FAQ.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/QNAForm.css">
<div class="page-head">
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">FAQ PAge</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->
        

        <!-- property area -->
        <div class="container">
    <br />
    <br />
    <br />
    <div class="panel-group" id="accordion">
        <div class="faqHeader"> <b>FAQ</b></div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">인프는 어떤 서비스를 제공하나요?</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                    인테리어가 필요한 고객이 견적을 신청하면 검증된 업체 회원의 답변 등록을 통해서 믿을 수 있고 실력있는 업체를 중개해주는 서비스를 제공합니다.<br> 
                    고객과 업체 사이의 중개서비스를 통해서 부실공사나 대금문제에 대한 걱정 없이 책임지고 보수해 드리고 있습니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">회원가입은 어떻게 하나요?</a>
                </h4>
            </div>
            <div id="collapseTen" class="panel-collapse collapse">
                <div class="panel-body">
                   일반회원 / 기업회원을 선택하여 가입하실 수 있습니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">계약은 어떻게 진행해야 하나요 ?</a>
                </h4>
            </div>
            <div id="collapseEleven" class="panel-collapse collapse">
                <div class="panel-body">
                   업체측의 답변을 통해 견적을 받아보시고 계약을 진행하시면 됩니다.<br>
                   대금이나 부실공사에 대한 부분은 철저히 인프에서 중개하고 있지만 인적서비스상품이므로 계약을 진행하실 때 양자의 책임 하에 이루어지는 것임을 상기하시어 <br>
                   업체의 신뢰성 및 계약서 등을 꼼꼼히 체크하시기 바랍니다. 
                   업체 측에서 제공하기로 했던 서비스를 계약서 부분에 명시하는 것도 하나의 방법으로 볼 수 있겠습니다. <br>
                   다만, 대금의 선입금을 유도하는 업체는 계약 진행을 멈추고 신고 하시기 바랍니다.
                   
                </div>
            </div>
        </div>

        
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">온라인견적서 상의 견적금액과 방문견적시 금액이 차이가 있습니다.</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                      온라인상담 후 업체에서 현장방문을 하고 실측을 하게 됩니다. <br>
                   이유는 현장상황에 따라 견적금액이 상이하게 달라지기 때문에 평수만을 가지고 내는 견적에는 오차가 생겨
                   추후 공사 계약시, 공사 중에 마찰이 일어날 수 있기 때문에 현장상황을 고려한 견적을 받아보셔야 문제없이 만족스러운 결과물을 받아보실 수 있습니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">같은 공사인데 업체마다 견적이 다른 이유가 있나요?</a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                   금액은 같지만 마감재 등의 자재의 내용이 다른경우나 시공방식으로 인한 차이, A/S 기간이 짧은 경우 등 여러가지 상황이 있을 수 있습니다.                  
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">공사를 담당한 업체와 연락이 되지 않아요.</a>
                </h4>
            </div>
            <div id="collapseFive" class="panel-collapse collapse">
                <div class="panel-body">
                  고객센터로 연락하여 문제상황을 알려주시면 담당자가 신속하게 해결해드릴 수 있도록 노력하겠습니다.
                    <br />
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">신청서를 수정/ 취소 하고 싶어요.</a>
                </h4>
            </div>
            <div id="collapseSix" class="panel-collapse collapse">
                <div class="panel-body">
                      로그인 - 마이페이지- 나의 신청내역 보기- 신청서 수정 / 삭제 
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">신청한 견적은 어디서 확인할 수 있나요 ?</a>
                </h4>
            </div>
            <div id="collapseEight" class="panel-collapse collapse">
                <div class="panel-body">
                     로그인 - 마이페이지 - 나의 신청 내역 에서 확인하실 수 있습니다. <br>
                   문의사항이 필요하시면 고객센터로 문의바랍니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">신고를 하려면 어떻게 해야 하나요?</a>
                </h4>
            </div>
            <div id="collapseNine" class="panel-collapse collapse">
                <div class="panel-body">
                 로그인 후 문의 게시판을 통해 신고내용을 등록하시면 관리자 검토 후에 차단되어집니다.
                </div>
            </div>
        </div>

            </div>
        </div>
    </div>
</div>


     
<%@ include file="../include/footer.jspf" %>
