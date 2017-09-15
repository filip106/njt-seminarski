<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
            <span class="icon-bar"></span> <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<c:url value='/backend/home' /> ">NJT Admin v2.0</a>
    </div>

    <div>
        <tiles:insertAttribute name="custom-notifications"/>
    </div>

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
                    </div>
                </li>
                <li><a href="<c:url value='/backend/home' />"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
                <li><a href="<c:url value='/backend/orders' />"><i class="fa fa-table fa-fw"></i> Rezervacije</a></li>
                <li><a href="<c:url value='/backend/users' />"><i class="fa fa-table fa-fw"></i> Korisnici</a></li>
                <li><a href="<c:url value='/backend/general-settings' />"><i class="fa fa-table fa-fw"></i> Opšta
                    podešavanja</a></li>
                <li><a href="<c:url value='/backend/start-page-layout' />"><i class="fa fa-table fa-fw"></i> Izgled
                    Pošetne Stranice</a></li>

                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Tereni<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="<c:url value='/backend/courts' />">Svi Tereni</a></li>
                        <li><a href="<c:url value='/backend/court/add' />">Dodaj Novi Teren</a></li>
                        <li><a href="<c:url value='/backend/court/manage-categories' />">Upravljanje Kategorijama</a>
                        </li>
                    </ul>
                </li>

                <li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Partneri<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="<c:url value='/backend/partners' />">Svi Partneri</a></li>
                        <li><a href="<c:url value='/backend/partner/add' />">Dodaj Partnera</a></li>
                        <li><a href="<c:url value='/backend/partner/manage-categories' />">Upravljanje Kategorijama</a>
                        </li>
                    </ul>
                </li>

                <li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Blog<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="<c:url value='/backend/blog-posts' />">Svi Postovi</a></li>
                        <li><a href="<c:url value='/backend/blog-post/add' />">Dodaj Post</a></li>
                        <li><a href="<c:url value='/backend/blog-post/manage-categories' />">Upravljanje
                            kategorijama</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>