<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
    .port_overlay .fa{
        padding-top: 5px;
    }
</style>

<!--product section-->
<section id="product" class="product">
    <div class="container">
        <div class="main_product roomy-80">
            <div class="head_title text-center fix">
                <h2 class="text-uppercase">Naši Partneri</h2>
                <h5>Brz i Moderan Način Nalaženje Sportskog Terena</h5>
            </div>

            <div class="carousel-custom">
                <div class="carousel-inner" role="listbox">
                    <div class="iteme">
                        <div class="container">
                            <div class="row" id="slick-partners-container">
                                <c:forEach items="${allPartner}" var="partner">
                                    <div class="col-sm-3">
                                        <div class="port_item xs-m-top-30">
                                            <div class="port_img">
                                                <img src="${partner.baseImage}" alt=""/>
                                                <div class="port_overlay text-center">
                                                    <a href="${partner.partnerWebSite}" target="_blank"><i
                                                            class="fa fa-chevron-right"></i></a>
                                                    <c:if test="${partner.facebookLink != null && !partner.facebookLink.isEmpty()}">
                                                        <a href="${partner.facebookLink}" target="_blank"><i
                                                                class="fa fa-facebook"></i></a>
                                                    </c:if>
                                                    <c:if test="${partner.twitterLink != null && !partner.facebookLink.isEmpty()}">
                                                        <a href="${partner.twitterLink}" target="_blank"><i
                                                                class="fa fa-twitter"></i></a>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="port_caption m-top-20">
                                                <h5>${partner.caption}</h5>
                                                <h6>- ${partner.partnerCategory.title}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>