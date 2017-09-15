<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="generalSettings" scope="request"
             type="com.silab.njt.springmvc.model.settings.GeneralSettings"/>

<!--Brand Section-->
<section id="brand" class="brand fix roomy-80">
    <div class="container">
        <div class="row">
            <div class="main_brand text-center">
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <div class="brand_item sm-m-top-20">
                        <img src="<c:url value='/resources/image/uploads/cbrand-img1.png' />" alt=""/>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <div class="brand_item sm-m-top-20">
                        <img src="<c:url value='/resources/image/uploads/cbrand-img2.png' />" alt=""/>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <div class="brand_item sm-m-top-20">
                        <img src="<c:url value='/resources/image/uploads/cbrand-img3.png' />" alt=""/>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <div class="brand_item sm-m-top-20">
                        <img src="<c:url value='/resources/image/uploads/cbrand-img4.png' />" alt=""/>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <div class="brand_item sm-m-top-20">
                        <img src="<c:url value='/resources/image/uploads/cbrand-img5.png' />" alt=""/>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <div class="brand_item sm-m-top-20">
                        <img src="<c:url value='/resources/image/uploads/cbrand-img6.png' />" alt=""/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End off Brand section -->

<!-- Registration section -->
<section id="action" class="action bg-primary roomy-40">
    <div class="container">
        <div class="row">
            <div class="maine_action">
                <div class="col-md-8">
                    <div class="action_item text-center">
                        <h2 class="text-white text-uppercase">Postani i Ti Deo Naše Ekipe Već Sad</h2>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="action_btn text-left sm-text-center">
                        <a href="<c:url value='/login' />" class="btn btn-default">Registruj se</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End of registration section -->

<footer id="contact" class="footer action-lage bg-black p-top-80">
    <div class="container">
        <div class="row">
            <div class="widget_area">
                <div class="col-md-3">
                    <div class="widget_item widget_about">
                        <h5 class="text-white">O Nama</h5>
                        <p class="m-top-20">${generalSettings.shortDescription}</p>
                        <div class="widget_ab_item m-top-30">
                            <div class="item_icon">
                                <i class="fa fa-location-arrow"></i>
                            </div>
                            <div class="widget_ab_item_text">
                                <h6 class="text-white">Lokacija</h6>
                                <p>${generalSettings.locationAddress}</p>
                            </div>
                        </div>
                        <div class="widget_ab_item m-top-30">
                            <div class="item_icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="widget_ab_item_text">
                                <h6 class="text-white">Radno Vreme</h6>
                                <p>${generalSettings.workingHours}</p>
                            </div>
                        </div>
                        <div class="widget_ab_item m-top-30">
                            <div class="item_icon">
                                <i class="fa fa-envelope-o"></i>
                            </div>
                            <div class="widget_ab_item_text">
                                <h6 class="text-white">Email Address :</h6>
                                <p>${generalSettings.webSiteEmail}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End off col-md-3 -->

                <div class="col-md-3">
                    <div class="widget_item widget_latest sm-m-top-50">
                        <h5 class="text-white">Najnovije Vesti</h5>
                        <div class="widget_latst_item m-top-30">
                            <div class="item_icon">
                                <img src="<c:url value='/resources/image/uploads/ltst-img-1.jpg' />" alt=""/>
                            </div>
                            <div class="widget_latst_item_text">
                                <p>Lorem ipsum dolor sit amet, consectetur</p>
                                <a href="">21<sup>th</sup> July 2016</a>
                            </div>
                        </div>
                        <div class="widget_latst_item m-top-30">
                            <div class="item_icon">
                                <img src="<c:url value='/resources/image/uploads/ltst-img-2.jpg' />" alt=""/>
                            </div>
                            <div class="widget_latst_item_text">
                                <p>Lorem ipsum dolor sit amet, consectetur</p>
                                <a href="">21<sup>th</sup> July 2016</a>
                            </div>
                        </div>
                        <div class="widget_latst_item m-top-30">
                            <div class="item_icon">
                                <img src="<c:url value='/resources/image/uploads/ltst-img-3.jpg' />" alt=""/>
                            </div>
                            <div class="widget_latst_item_text">
                                <p>Lorem ipsum dolor sit amet, consectetur</p>
                                <a href="">21<sup>th</sup> July 2016</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End off col-md-3 -->

                <div class="col-md-3">
                    <div class="widget_item widget_service sm-m-top-50">
                        <h5 class="text-white">Pogledajte Još</h5>
                        <ul class="m-top-20">
                            <li class="m-top-20">
                                <a href="<c:url value='/user/user-profile' />">
                                    <i class="fa fa-angle-right"></i> Profil Korisnika</a>
                            </li>
                            <li class="m-top-20">
                                <a href="<c:url value='/login' />">
                                    <i class="fa fa-angle-right"></i> Registracija</a>
                            </li>
                            <li class="m-top-20">
                                <a href="<c:url value='/all-courts' />">
                                    <i class="fa fa-angle-right"></i> Tereni</a>
                            </li>
                            <li class="m-top-20">
                                <a href="<c:url value='/all-blogs' />">
                                    <i class="fa fa-angle-right"></i> Blog</a>
                            </li>
                            <li class="m-top-20">
                                <a href="">
                                    <i class="fa fa-angle-right"></i> Podržite Forum</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- End off col-md-3 -->

                <div class="col-md-3">
                    <div class="widget_item widget_newsletter sm-m-top-50">
                        <h5 class="text-white">Newsletter</h5>
                        <form class="form-inline m-top-30">
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Unesiti svoj Email">
                                <button class="btn text-center"><i class="fa fa-arrow-right"></i></button>
                            </div>
                        </form>
                        <div class="widget_brand m-top-40">
                            <div class="m-bottom-20">
                                <a href="" class="text-uppercase"><img
                                        src="<c:url value='/resources/image/uploads/site-logo.png' />" alt=""></a>
                            </div>
                            <p>${generalSettings.shortDescription}</p>
                        </div>

                        <ul class="list-inline footer-social-icons">
                            <li>
                                - <a href="${generalSettings.facebookLink}" target="_blank"><i
                                    class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="${generalSettings.twitterLink}" target="_blank"><i
                                        class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="${generalSettings.linkedinLink}" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="${generalSettings.googlePlusLink}" target="_blank"><i
                                        class="fa fa-google-plus"></i></a> -
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main_footer fix bg-mega text-center p-top-40 p-bottom-30 m-top-80">
        <div class="col-md-12">
            <p class="wow fadeInRight" data-wow-duration="1s">
                Made with <i class="fa fa-heart"></i> by <a target="_blank"
                                                            href="http://bootstrapthemes.co">Bootstrap Themes</a> 2016.
                All Rights Reserved
            </p>
        </div>
    </div>
</footer>

<!-- JS includes -->
<script src="<c:url value='/resources/js/common/bootstrap.min.js' />"></script>

<script src="<c:url value='/resources/js/common/owl.carousel.min.js' />"></script>
<script src="<c:url value='/resources/js/common/jquery.magnific-popup.js' />"></script>
<script src="<c:url value='/resources/js/common/jquery.easing.1.3.js' />"></script>
<script src="<c:url value='/resources/js/common/slick.min.js' />"></script>
<script src="<c:url value='/resources/js/common/jquery.collapse.js' />"></script>
<script src="<c:url value='/resources/js/common/bootsnav.js' />"></script>

<script src="<c:url value='/resources/js/common/plugins.js' />"></script>
<script src="<c:url value='/resources/js/common/main.js' />"></script>