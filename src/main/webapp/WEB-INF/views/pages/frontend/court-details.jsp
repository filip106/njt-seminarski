<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<jsp:useBean id="court" scope="request" type="com.silab.njt.springmvc.model.court.Court"/>

<c:if test = "${logedInUser != 'annon.'}">
    <tiles:insertAttribute name="court-reservation-modal"/>
</c:if>

<section>
    <div class="container">
        <div class="row" style="margin-top: 150px">
            <div class="col-sm-12 padding-right">
                <div class="product-details">
                    <div class="col-sm-5" style="min-height: 375px">
                        <div class="view-product">
                            <img src="${court.baseImage}" alt="" style="height: 290px"/>
                        </div>
                        <div id="similar-product" class="carousel slide" data-ride="carousel">
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <a href=""><img src="assets/images/product-details/similar1.jpg" alt=""></a>
                                    <a href=""><img src="assets/images/product-details/similar2.jpg" alt=""></a>
                                    <a href=""><img src="assets/images/product-details/similar3.jpg" alt=""></a>
                                </div>
                                <div class="item">
                                    <a href=""><img src="assets/images/product-details/similar1.jpg" alt=""></a>
                                    <a href=""><img src="assets/images/product-details/similar2.jpg" alt=""></a>
                                    <a href=""><img src="assets/images/product-details/similar3.jpg" alt=""></a>
                                </div>
                                <div class="item">
                                    <a href=""><img src="assets/images/product-details/similar1.jpg" alt=""></a>
                                    <a href=""><img src="assets/images/product-details/similar2.jpg" alt=""></a>
                                    <a href=""><img src="assets/images/product-details/similar3.jpg" alt=""></a>
                                </div>
                            </div>
                            <!-- Controls -->
                            <a class="left item-control" href="#similar-product" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right item-control" href="#similar-product" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="product-information">
                            <h2>${court.title}</h2>
                            <p><b>Telefoni za Rezervacije:</b> ${court.phoneNumber}</p>
                            <div style="padding-bottom: 10px;"><img src="assets/images/product-details/rating.png" alt=""/></div>
                            <p><b>Cena Termina:</b> ${court.basePrice} RSD</p>
                            <c:choose>
                                <c:when test="${logedInUser == 'annon.'}">
                                    <p>Morate biti ulogovani da biste rezervisali termin</p>
                                    <a type="button" href="<c:url value='/login' />" class="btn btn-fefault cart" style="margin-left: 0">
                                        <i class="fa fa-shopping-cart"></i> Online Rezervacija
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a type="button" data-toggle="modal" href="#placeReservationModal" class="btn btn-fefault cart" style="margin-left: 0">
                                        <i class="fa fa-shopping-cart"></i> Online Rezervacija
                                    </a>
                                </c:otherwise>
                            </c:choose>

                            <p><b>Adresa:</b> ${court.address}</p>
                            <p><b>Radno Vreme:</b> ${court.workingHours}</p>
                            <p><b>Brand:</b> E-SHOPPER</p>
                            <%--<a href=""><img src="assets/images/product-details/share.png" class="share img-responsive" alt="" /></a>--%>
                        </div>
                    </div>
                </div>

                <div class="category-tab shop-details-tab">
                    <!--category-tab-->
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li><a href="#details" data-toggle="tab">Opis Terena</a></li>
                            <li><a href="#companyprofile" data-toggle="tab">Info</a></li>
                            <li><a href="#address-tab" data-toggle="tab">Kako Do Nas</a></li>
                            <li><a href="#tag" data-toggle="tab">Video Prezentacija</a></li>
                            <li class="active"><a href="#reviews" data-toggle="tab">Komentari
                                (5)</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade" id="details">
                            ${court.description}
                        </div>

                        <div class="tab-pane fade" id="companyprofile">
                            ${court.info}
                        </div>

                        <div class="tab-pane fade" id="address-tab">
                            ${court.address}
                        </div>

                        <div class="tab-pane fade" id="tag">
                            ${court.video}
                        </div>

                        <div class="tab-pane fade active in" id="reviews">
                            <div class="col-sm-12">
                                <ul>
                                    <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                    <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                                    <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                    sed do eiusmod tempor incididunt ut labore et dolore magna
                                    aliqua.Ut enim ad minim veniam, quis nostrud exercitation
                                    ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis
                                    aute irure dolor in reprehenderit in voluptate velit esse
                                    cillum dolore eu fugiat nulla pariatur.</p>
                                <p><b>Write Your Review</b></p>
                                <form action="#">
									<span>
                                        <input placeholder="Your Name"/>
                                        <input type="email" placeholder="Email Address"/>
									</span>
                                    <textarea name=""></textarea>
                                    <b>Rating: </b> <img src="assets/images/product-details/rating.png" alt=""/>
                                    <button type="button" class="btn btn-default pull-right">Submit</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
                <!--/category-tab-->

                <div class="recommended_items">
                    <c:forEach items="${court.allCourtRelationship}" var="courtRelationship">
                        <h2 class="title text-center">${courtRelationship.name}</h2>
                        <c:if test="${!courtRelationship.allRelationshipCourts.isEmpty()}">
                            <div class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <c:forEach items="${courtRelationship.allRelationshipCourts}" var="relCourt"
                                               varStatus="loop">
                                        <c:if test="${loop.first}">
                                            <div class="item active">
                                        </c:if>
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="${relCourt.baseImage}" alt=""/>
                                                        <h2>${relCourt.basePrice} RSD</h2>
                                                        <p>${relCourt.title}</p>
                                                        <form action="${relCourt.slug}">
                                                            <button class="btn btn-default">
                                                                <i class="fa fa-shopping-cart"></i> Idi na Stranicu
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${loop.index % 3 == 2 && !loop.last}">
                                            </div><div class="item">
                                        </c:if>
                                        <c:if test="${loop.last}">
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <a class="left recommended-item-control" href="#recommended-item-carousel"
                                   data-slide="prev"> <i
                                        class="fa fa-angle-left"></i></a>
                                <a class="right recommended-item-control" href="#recommended-item-carousel"
                                   data-slide="next">
                                    <i class="fa fa-angle-right"></i></a>
                            </div>
                        </c:if>
                        <c:if test="${courtRelationship.allRelationshipCourts.isEmpty()}">
                            <p style="text-align: center">Nijedan teren nije pronadjen</p>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>