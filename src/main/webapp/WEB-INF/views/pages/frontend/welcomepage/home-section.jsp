<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--Home Sections-->
<section id="home" class="home bg-black fix"
         style="background: url(<c:url
                 value='/resources/image/uploads/google-maps-big.jpg'/>) no-repeat scroll  center center;background-size: cover;">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="main_home text-center">
                <div class="col-md-12">
                    <div class="hello_slid">
                        <c:forEach items="${layout.allSlides}" var="slide">
                            <div class="slid_item">
                                <div class="home_text ">
                                    <h2 class="text-white">
                                        Dobrodošli u <strong>${slide.title}</strong>
                                    </h2>
                                    <h1 class="text-white">${slide.mainContent}</h1>
                                    <h3 class="text-white">${slide.leadingText}</h3>
                                </div>

                                <div class="home_btns m-top-40">
                                    <a href="<c:url value='${slide.detailsLink}' />"
                                       class="btn btn-primary m-top-20">${slide.title}</a> <a
                                        href="${slide.externalLink}" target="_blank"
                                        class="btn btn-default m-top-20">Posetite Sajt</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
