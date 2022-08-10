<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

        <div class="page-head">
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">시공사례 목록</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="properties-area recent-property" style="background-color: #FFF;">
            <div class="container">
                <div class="row  pr0 padding-top-20 properties-page">
                    <div class="col-md-12 padding-bottom-40 large-search">
                        <!-- <div class="search-form wow pulse"> -->
                            <!-- <form action="" class=" form-inline">
                                <div class="col-md-12"> -->
                                    <!-- <div class="col-md-4">
                                        <input type="text" class="form-control" placeholder="Key word">
                                    </div>
                                    <div class="col-md-4">
                                        <select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select your city">
                                            <option>New york, CA</option>
                                            <option>Paris</option>
                                            <option>Casablanca</option>
                                            <option>Tokyo</option>
                                            <option>Marraekch</option>
                                            <option>kyoto , shibua</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <select id="basic" class="selectpicker show-tick form-control">
                                            <option> -Status- </option>
                                            <option>Rent </option>
                                            <option>Boy</option>
                                            <option>used</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12 ">
                                    <div class="search-row">

                                        <div class="col-sm-3">
                                            <label for="price-range">Price range ($):</label>
                                            <input type="text" class="span2" value="" data-slider-min="0"
                                                   data-slider-max="600" data-slider-step="5"
                                                   data-slider-value="[0,450]" id="price-range" ><br />
                                            <b class="pull-left color">2000$</b>
                                            <b class="pull-right color">100000$</b>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <label for="property-geo">Property geo (m2) :</label>
                                            <input type="text" class="span2" value="" data-slider-min="0"
                                                   data-slider-max="600" data-slider-step="5"
                                                   data-slider-value="[50,450]" id="property-geo" ><br />
                                            <b class="pull-left color">40m</b>
                                            <b class="pull-right color">12000m</b>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <label for="price-range">Min baths :</label>
                                            <input type="text" class="span2" value="" data-slider-min="0"
                                                   data-slider-max="600" data-slider-step="5"
                                                   data-slider-value="[250,450]" id="min-baths" ><br />
                                            <b class="pull-left color">1</b>
                                            <b class="pull-right color">120</b>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <label for="property-geo">Min bed :</label>
                                            <input type="text" class="span2" value="" data-slider-min="0"
                                                   data-slider-max="600" data-slider-step="5"
                                                   data-slider-value="[250,450]" id="min-bed" ><br />
                                            <b class="pull-left color">1</b>
                                            <b class="pull-right color">120</b>
                                        </div>
                                        End of

                                    </div>

                                    <div class="search-row">

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Fire Place(3100)
                                                </label>
                                            </div>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Dual Sinks(500)
                                                </label>
                                            </div>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Hurricane Shutters(99)
                                                </label>
                                            </div>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Swimming Pool(1190)
                                                </label>
                                            </div>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> 2 Stories(4600)
                                                </label>
                                            </div>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Emergency Exit(200)
                                                </label>
                                            </div>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Laundry Room(10073)
                                                </label>
                                            </div>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Jog Path(1503)
                                                </label>
                                            </div>
                                        </div>
                                        End of

                                        <div class="col-sm-3">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> 26' Ceilings(1200)
                                                </label>
                                            </div>
                                        </div>
                                        End of  -->
                                    <!-- </div>
                                </div>
                            </form> -->
                        </div>
                    </div>

                    <div class="col-md-12  clear">
                        <div class="col-xs-10 page-subheader sorting pl0">
                            <ul class="sort-by-list">
                                <li class="active">
                                    <a href="javascript:void(0);" class="order_by_date" data-orderby="property_date" data-order="ASC">
                                        최신순 <i class="fa fa-sort-amount-asc"></i>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="javascript:void(0);" class="order_by_price" data-orderby="property_price" data-order="DESC">
                                        좋아요순 <i class="fa fa-sort-amount-asc"></i>
                                    </a>			<!-- fa fa-sort-numeric-desc -->
                                </li>
                            </ul><!--/ .sort-by-list-->

                            <!-- <div class="items-per-page">
                                <label for="items_per_page"><b>page :</b></label>
                                <div class="sel">
                                    <select id="items_per_page" name="per_page">
                                        <option value="3">3</option>
                                        <option value="6">6</option>
                                        <option value="9">9</option>
                                        <option selected="selected" value="12">12</option>
                                        <option value="15">15</option>
                                        <option value="30">30</option>
                                        <option value="45">45</option>
                                        <option value="60">60</option>
                                    </select>
                                </div>/ .sel
                            </div>/ .items-per-page -->
                        </div>

                        <div class="col-xs-2 layout-switcher">
                            <a class="layout-list" href="javascript:void(0);"> <i class="fa fa-th-list"></i>  </a>
                            <a class="layout-grid active" href="javascript:void(0);"> <i class="fa fa-th"></i> </a>
                        </div><!--/ .layout-switcher-->
                    </div>

                    <div class="col-md-12 clear ">
                        <div id="list-type" class="proerty-th">
                        	<c:forEach var="cboard" items="${list}">
                            <div class="col-sm-6 col-md-3 p0">
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="read?cbno=${cboard.cbno}"><img src="/resources/assets/img/demo/property-3.jpg"></a>
                                    </div>

                                    <div class="item-entry overflow">
                                        <h5><a href="read?cbno=${cboard.cbno}"> ${cboard.title} </a></h5>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left"><b> (주)디자인 </b></span>
                                        <span class="proerty-price pull-right"> $ ${cboard.cost} </span>
                                        <p style="display: none;">${fn:replace(cboard.content, cn, br)}</p>
                                        <div class="property-icon">
                                            ${cboard.cnstType} |
                                            ${cboard.space} |
                                            ${cboard.area}평
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-12 clear padding-bottom-40">
                        <div class="pull-right">
                            <div class="pagination">
	                             <ul>
		  							<c:if test="${pageMaker.prev}">
										<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a href="list${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
									</c:if>
								</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



<%@ include file="../include/footer.jspf"%>