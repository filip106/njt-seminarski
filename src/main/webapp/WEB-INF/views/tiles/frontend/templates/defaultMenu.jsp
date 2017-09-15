<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .attr-nav {
        position: relative;
        top: 22px;
    }
</style>
<div class="culmn">
    <nav class="navbar navbar-default bootsnav navbar-fixed">
        <div class="navbar-top bg-grey fix">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="navbar-callus text-left sm-text-center">
                            <ul class="list-inline">
                                <li><a href=""><i class="fa fa-phone"></i> Call us: 066*** 4620</a></li>
                                <li><a href=""><i class="fa fa-envelope-o"></i> Contactus: djordjevic.filip@mail.com</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="navbar-socail text-right sm-text-center">
                            <ul class="list-inline header-social-icons">
                                <sec:authorize access="hasRole('ADMIN')">
                                    <li><a href="<c:url value='/backend/home' />"><i class="fa fa-tasks"></i></a></li>
                                </sec:authorize>
                                <li><a href="<c:url value='/user/user-profile' />"><i
                                        class="fa fa-user-circle-o"></i></a></li>
                                <li class="facebook-list-item"><a href="https://www.facebook.com" target="_blank"><i
                                        class="fa fa-facebook"></i></a></li>
                                <li class="twitter-list-item"><a href="https://www.twitter.com" target="_blank"><i
                                        class="fa fa-twitter"></i></a></li>
                                <li class="linkedin-list-item"><a href="https://www.linkedin.com" target="_blank"><i
                                        class="fa fa-linkedin"></i></a></li>
                                <li class="fa-google-plus-list-item"><a href="https://plus.google.com"
                                                                        target="_blank"><i
                                        class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input id="search-products" class="form-control" placeholder="Pretraži">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->

        <div class="container">
            <div class="attr-nav">
                <ul>
                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                </ul>
            </div>

            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="<c:url value='/' />">
                    <img src="<c:url value='/resources/image/uploads/site-logo.png' />" class="logo" alt="">
                </a>
            </div>
            <!-- End Header Navigation -->

            <c:choose>
                <c:when test="${requestScope['javax.servlet.forward.servlet_path']} == /home">
                    <c:set var="homePagePrefix" value="home" scope="request"/>
                    <br/>
                </c:when>
                <c:otherwise>
                    <c:set var="homePagePrefix" value="" scope="request"/>
                    <br/>
                </c:otherwise>
            </c:choose>

            <!-- navbar menu -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<c:url value='/${homePagePrefix}' />#home">Naslovna</a></li>
                    <li><a href="<c:url value='/${homePagePrefix}' />#features">O Name</a></li>
                    <li><a href="<c:url value='/${homePagePrefix}' />#business">Bet 365</a></li>
                    <li><a href="<c:url value='/${homePagePrefix}' />#product">Naši Partneri</a></li>
                    <li><a href="<c:url value='/${homePagePrefix}'/>#test">Komentari</a></li>
                    <li><a href="<c:url value='/${homePagePrefix}'/>#contact">Kontakt</a></li>
                    <li><a href="<c:url value='/all-courts'/>">Tereni</a></li>
                    <li><a href="<c:url value='/all-blogs'/>">Blog</a></li>
                    <sec:authorize access="isAuthenticated()">
                        <li><a href="<c:url value='/logout' />">Logout</a></li>
                    </sec:authorize>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
</div>