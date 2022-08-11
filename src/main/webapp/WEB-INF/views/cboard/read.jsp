<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<%
// 줄바꿈     
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%> 

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
<!-- Content Header (Page header) -->


       <!-- <div class="page-head">
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">시공사례 </h1>
                    </div>
                </div>
            </div>
        </div>  -->
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area single-property" style="background-color: #FCFCFC;">&nbsp;
	<div class="container">

		<div class="clearfix padding-top-10">

			<div class="col-md-12 single-property-content prp-style-2">
				<div class="">
					<div class="row">
						<div class="light-slide-item">
							<div class="clearfix">
								<div class="favorite-and-print">
									<a class="add-to-fav" href="#login-modal" data-toggle="modal">
										<i class="fa fa-star-o"></i>
									</a> <a class="printer-icon " href="javascript:window.print()">
										<i class="fa fa-print"></i>
									</a>
								</div>

								<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
									<li data-thumb="/resources/assets/img/property-1/property1.jpg">
										<img src="/resources/assets/img/property-1/property1.jpg" />
									</li>
									<li data-thumb="/resources/assets/img/property-1/property2.jpg">
										<img src="/resources/assets/img/property-1/property3.jpg" />
									</li>
									<li data-thumb="/resources/assets/img/property-1/property3.jpg">
										<img src="/resources/assets/img/property-1/property3.jpg" />
									</li>
									<li data-thumb="/resources/assets/img/property-1/property4.jpg">
										<img src="/resources/assets/img/property-1/property4.jpg" />
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="single-property-wrapper">

						<div class="section">
							<h2 class="t-property-title">${cboard.title}</h2>
							&nbsp;
							<%-- <h2 class="property-title"> ${cboard.title} </h2> --%>
							<div class="s-property-content">
								<p>${fn:replace(cboard.content, cn, br)}</p>
							</div>
						</div>
						<!-- End description area  -->

						<div class="section additional-details">

							<h4 class="s-property-title">시공 정보</h4>

							<ul class="additional-details-list clearfix">
								<li><span class="col-xs-6 col-sm-2 col-md-2 add-d-title">유형</span>
									<span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${cboard.cnstType}</span>
								</li>

								<li><span class="col-xs-6 col-sm-2 col-md-2 add-d-title">공간</span>
									<span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${cboard.space}</span>
								</li>
								<li><span class="col-xs-6 col-sm-2 col-md-2 add-d-title">평수</span>
									<span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${cboard.area}평</span>
								</li>

								<li><span class="col-xs-6 col-sm-2 col-md-2 add-d-title">기간</span>
									<span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${cboard.period}</span>
								</li>

								<li><span class="col-xs-6 col-sm-2 col-md-2 add-d-title">금액</span>
									<span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${cboard.cost}</span>
								</li>

								<!-- <li>
                                            <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Waterfront Description:</span>
                                            <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Intracoastal Front,Ocean Access</span>
                                        </li>  -->

							</ul>
						</div>
						<!-- End additional-details area  -->

						<!-- <div class="section property-features">

                                    <h4 class="s-property-title">Features</h4>
                                    <ul>
                                        <li><a href="properties.html">Swimming Pool</a></li>
                                        <li><a href="properties.html">3 Stories</a></li>
                                        <li><a href="properties.html">Central Cooling</a></li>
                                        <li><a href="properties.html">Jog Path 2</a></li>
                                        <li><a href="properties.html">2 Lawn</a></li>
                                        <li><a href="properties.html">Bike Path</a></li>
                                    </ul>

                                </div>
                                End features area

                                <div class="section property-video">
                                    <h4 class="s-property-title">Property Video</h4>
                                    <div class="video-thumb">
                                        <a class="video-popup" href="yout" title="Virtual Tour">
                                            <img src="/resources/assets/img/property-video.jpg" class="img-responsive wp-post-image" alt="Exterior">
                                        </a>
                                    </div>
                                </div>
                                End video area  -->

						<div class="section property-share">
							<h4 class="s-property-title">업체 정보</h4>
						</div>
						<div class="clear">
							<div class="col-xs-6 col-sm-2 col-md-2 add-d-title">
								<a href=""> <img
									src="/resources/assets/img/client-face1.png" class="img-circle">
								</a>
							</div>
							<div class="col-xs-8 col-sm-8 ">
								<h3 class="dealer-name">
									<a href="">(주)디자인</a><!-- <span>(주)디자인</span> -->
								</h3>
								<div class="dealer-social-media">
									<a class="twitter" target="_blank" href=""> <i
										class="fa fa-twitter"></i>
									</a> <a class="facebook" target="_blank" href=""> <i
										class="fa fa-facebook"></i>
									</a> <a class="gplus" target="_blank" href=""> <i
										class="fa fa-google-plus"></i>
									</a> <a class="linkedin" target="_blank" href=""> <i
										class="fa fa-linkedin"></i>
									</a> <a class="instagram" target="_blank" href=""> <i
										class="fa fa-instagram"></i>
									</a>
								</div>

							</div>
						</div>

						<div class="clear">
							<ul class="dealer-contacts">
								<li><i class="pe-7s-map-marker strong"> </i> 9089 your
									adress her</li>
								<li><i class="pe-7s-mail strong"> </i>
									email@yourcompany.com</li>
								<li><i class="pe-7s-call strong"> </i> +1 908 967 5906</li>
							</ul>
							<p>제공 서비스 | 직영시공, 설계도면, 3D 디자인, 전문감리, 공정표, 세금계산서, 현금영수증, 하자이행증권, 계약이행증권, 마감청소</p>
							<p>경력 | 5~10년</p>
							<p>AS | 1년</p>
						</div>

					</div>
				</div>

				<div class="section property-share">
					<h4 class="s-property-title">Share width your friends</h4>
					<div class="roperty-social">
						<ul>
							<li><a title="Share this on dribbble " href="#"><img
									src="/resources/assets/img/social_big/dribbble_grey.png"></a></li>
							<li><a title="Share this on facebok " href="#"><img
									src="/resources/assets/img/social_big/facebook_grey.png"></a></li>
							<li><a title="Share this on delicious " href="#"><img
									src="/resources/assets/img/social_big/delicious_grey.png"></a></li>
							<li><a title="Share this on tumblr " href="#"><img
									src="/resources/assets/img/social_big/tumblr_grey.png"></a></li>
							<li><a title="Share this on digg " href="#"><img
									src="/resources/assets/img/social_big/digg_grey.png"></a></li>
							<li><a title="Share this on twitter " href="#"><img
									src="/resources/assets/img/social_big/twitter_grey.png"></a></li>
							<li><a title="Share this on linkedin " href="#"><img
									src="/resources/assets/img/social_big/linkedin_grey.png"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="margin-space" style="text-align: right">
			<c:set var="pageNo"
				value="${empty param.pageNo ? '1' : param.pageNo}" />

			<a href="list?pageNo=${pageNo}" class="btn btn-primary ">목록</a>
			<a href="modify?cbno=${cboard.cbno}" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')"	href="delete?cbno=${cboard.cbno}" class="btn btn-primary">삭제</a>
		</div>
	</div>
</div>


<!--                         <div class="similar-post-section padding-top-40">
                            <div id="prop-smlr-slide_0">
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="property-1.html" ><img src="/resources/assets/img/similar/property-1.jpg"></a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h5><a href="property-1.html"> Super nice villa </a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left"><b> Area :</b> 120m </span>
                                        <span class="proerty-price pull-right"> $ 300,000</span>
                                    </div>
                                </div>
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="property-1.html" ><img src="/resources/assets/img/similar/property-2.jpg"></a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h5><a href="property-1.html"> Super nice villa </a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left"><b> Area :</b> 120m </span>
                                        <span class="proerty-price pull-right"> $ 300,000</span>
                                    </div>
                                </div>
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="property-1.html" ><img src="/resources/assets/img/similar/property-3.jpg"></a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h5><a href="property-1.html"> Super nice villa </a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left"><b> Area :</b> 120m </span>
                                        <span class="proerty-price pull-right"> $ 300,000</span>
                                    </div>
                                </div>
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="property-1.html" ><img src="/resources/assets/img/similar/property-1.jpg"></a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h5><a href="property-1.html"> Super nice villa </a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left"><b> Area :</b> 120m </span>
                                        <span class="proerty-price pull-right"> $ 300,000</span>
                                    </div>
                                </div>
                            </div>
                        </div> -->

                    <%-- <div class="col-md-4 p0">
                        <aside class="sidebar sidebar-property blog-asside-right property-style2">
                            <div class="dealer-widget">
                                <div class="dealer-content">
                                    <div class="inner-wrapper">
                                        <div class="single-property-header">
                                            <h1 class="property-title"> ${cboard.title} </h1>
                                            <span class="property-price">$ ${cboard.cost} </span>
                                        </div>

                                        <div class="property-meta entry-meta clearfix ">

                                            <div class="col-xs-4 col-sm-4 col-md-4 p-b-15">
                                                <span class="property-info-icon icon-tag">
                                                    <img src="/resources/assets/img/icon/sale-orange.png">
                                                </span>
                                                <span class="property-info-entry">
                                                    <span class="property-info-label">Status</span>
                                                    <span class="property-info-value">For Sale</span>
                                                </span>
                                            </div>

                                            <div class="col-xs-4 col-sm-4 col-md-4 p-b-15">
                                                <span class="property-info icon-area">
                                                    <img src="/resources/assets/img/icon/room-orange.png">
                                                </span>
                                                <span class="property-info-entry">
                                                    <span class="property-info-label">Area</span>
                                                    <span class="property-info-value">3500<b class="property-info-unit">Sq Ft</b></span>
                                                </span>
                                            </div>

                                            <div class="col-xs-4 col-sm-4 col-md-4 p-b-15">
                                                <span class="property-info-icon icon-bed">
                                                    <img src="/resources/assets/img/icon/bed-orange.png">
                                                </span>
                                                <span class="property-info-entry">
                                                    <span class="property-info-label">Bedrooms</span>
                                                    <span class="property-info-value">3</span>
                                                </span>
                                            </div>

                                            <div class="col-xs-4 col-sm-4 col-md-4 p-b-15">
                                                <span class="property-info-icon icon-bath">
                                                    <img src="/resources/assets/img/icon/cars-orange.png">
                                                </span>
                                                <span class="property-info-entry">
                                                    <span class="property-info-label">Bathrooms</span>
                                                    <span class="property-info-value">3.5</span>
                                                </span>
                                            </div>
                                            <div class="col-xs-4 col-sm-4 col-md-4 p-b-15">
                                                <span class="property-info-icon icon-bath">
                                                    <img src="/resources/assets/img/icon/os-orange.png">
                                                </span>
                                                <span class="property-info-entry">
                                                    <span class="property-info-label">Bathrooms</span>
                                                    <span class="property-info-value">3.5</span>
                                                </span>
                                            </div>

                                            <div class="col-xs-4 col-sm-4 col-md-4 p-b-15">
                                                <span class="property-info-icon icon-garage">
                                                    <img src="/resources/assets/img/icon/room-orange.png">
                                                </span>
                                                <span class="property-info-entry">
                                                    <span class="property-info-label">Garages</span>
                                                    <span class="property-info-value">2</span>
                                                </span>
                                            </div>

                                            <div class="col-xs-4 col-sm-4 col-md-4 p-b-15">
                                                <span class="property-info-icon icon-garage">
                                                    <img src="/resources/assets/img/icon/shawer-orange.png">
                                                </span>
                                                <span class="property-info-entry">
                                                    <span class="property-info-label">Garages</span>
                                                    <span class="property-info-value">2</span>
                                                </span>
                                            </div>


                                        </div>
                                        <div class="dealer-section-space">
                                            <span>Dealer information</span>
                                        </div>
                                        <div class="clear">
                                            <div class="col-xs-4 col-sm-4 dealer-face">
                                                <a href="">
                                                    <img src="/resources/assets/img/client-face1.png" class="img-circle">
                                                </a>
                                            </div>
                                            <div class="col-xs-8 col-sm-8 ">
                                                <h3 class="dealer-name">
                                                    <a href="">Nathan James</a>
                                                    <span>Real Estate Agent</span>
                                                </h3>
                                                <div class="dealer-social-media">
                                                    <a class="twitter" target="_blank" href="">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                    <a class="facebook" target="_blank" href="">
                                                        <i class="fa fa-facebook"></i>
                                                    </a>
                                                    <a class="gplus" target="_blank" href="">
                                                        <i class="fa fa-google-plus"></i>
                                                    </a>
                                                    <a class="linkedin" target="_blank" href="">
                                                        <i class="fa fa-linkedin"></i>
                                                    </a>
                                                    <a class="instagram" target="_blank" href="">
                                                        <i class="fa fa-instagram"></i>
                                                    </a>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="clear">
                                            <ul class="dealer-contacts">
                                                <li><i class="pe-7s-map-marker strong"> </i> 9089 your adress her</li>
                                                <li><i class="pe-7s-mail strong"> </i> email@yourcompany.com</li>
                                                <li><i class="pe-7s-call strong"> </i> +1 908 967 5906</li>
                                            </ul>
                                            <p>Duis mollis  blandit tempus porttitor curabiturDuis mollis  blandit tempus porttitor curabitur , est non…</p>
                                        </div>

                                    </div>
                                </div>
                            </div>

							<div class="margin-space" style="text-align: right">
								<c:set var="pageNo"
									value="${empty param.pageNo ? '1' : param.pageNo}" />

								<a href="list?pageNo=${pageNo}" class="btn btn-primary ">목록</a>
								<a href="modify?cbno=${cboard.cbno}" class="btn btn-primary">수정</a>
								<a onclick="return confirm('정말로 삭제하시겠습니까?')"	href="delete?cbno=${cboard.cbno}" class="btn btn-primary">삭제</a>
							</div>


                            <!-- <div class="panel panel-default sidebar-menu wow fadeInRight animated">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Ads her  </h3>
                                </div>
                                <div class="panel-body recent-property-widget">
                                    <img src="/resources/assets/img/ads.jpg">
                                </div>
                            </div> -->

                            <!-- <div class="panel panel-default sidebar-menu wow fadeInRight animated" >
                                <div class="panel-heading">
                                    <h3 class="panel-title">Smart search</h3>
                                </div>
                                <div class="panel-body search-widget">
                                    <form action="" class=" form-inline">
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <input type="text" class="form-control" placeholder="Key word">
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="row">
                                                <div class="col-xs-6">

                                                    <select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select Your City">

                                                        <option>New york, CA</option>
                                                        <option>Paris</option>
                                                        <option>Casablanca</option>
                                                        <option>Tokyo</option>
                                                        <option>Marraekch</option>
                                                        <option>kyoto , shibua</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-6">

                                                    <select id="basic" class="selectpicker show-tick form-control">
                                                        <option> -Status- </option>
                                                        <option>Rent </option>
                                                        <option>Boy</option>
                                                        <option>used</option>

                                                    </select>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <label for="price-range">Price range ($):</label>
                                                    <input type="text" class="span2" value="" data-slider-min="0"
                                                           data-slider-max="600" data-slider-step="5"
                                                           data-slider-value="[0,450]" id="price-range" ><br />
                                                    <b class="pull-left color">2000$</b>
                                                    <b class="pull-right color">100000$</b>
                                                </div>
                                                <div class="col-xs-6">
                                                    <label for="property-geo">Property geo (m2) :</label>
                                                    <input type="text" class="span2" value="" data-slider-min="0"
                                                           data-slider-max="600" data-slider-step="5"
                                                           data-slider-value="[50,450]" id="property-geo" ><br />
                                                    <b class="pull-left color">40m</b>
                                                    <b class="pull-right color">12000m</b>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <label for="price-range">Min baths :</label>
                                                    <input type="text" class="span2" value="" data-slider-min="0"
                                                           data-slider-max="600" data-slider-step="5"
                                                           data-slider-value="[250,450]" id="min-baths" ><br />
                                                    <b class="pull-left color">1</b>
                                                    <b class="pull-right color">120</b>
                                                </div>

                                                <div class="col-xs-6">
                                                    <label for="property-geo">Min bed :</label>
                                                    <input type="text" class="span2" value="" data-slider-min="0"
                                                           data-slider-max="600" data-slider-step="5"
                                                           data-slider-value="[250,450]" id="min-bed" ><br />
                                                    <b class="pull-left color">1</b>
                                                    <b class="pull-right color">120</b>

                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox" checked> Fire Place</label>
                                                    </div>
                                                </div>

                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox"> Dual Sinks</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox" checked> Swimming Pool</label>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox" checked> 2 Stories </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label><input type="checkbox"> Laundry Room </label>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label> <input type="checkbox"> Emergency Exit</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label>  <input type="checkbox" checked> Jog Path </label>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="checkbox">
                                                        <label>  <input type="checkbox"> 26' Ceilings </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="padding-5">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div class="checkbox">
                                                        <label>  <input type="checkbox"> Hurricane Shutters </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset >
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <input class="button btn largesearch-btn" value="Search" type="submit">
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div> -->

                        </aside>
                    </div> --%>




<%@ include file="../include/footer.jspf"%>
