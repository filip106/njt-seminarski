<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--Test section-->
<section id="test" class="test bg-grey roomy-60 fix">
    <div class="container">
        <div class="row">
            <div class="main_test fix">

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="head_title text-center fix">
                        <h2 class="text-uppercase">Šta Korisnici Kažu</h2>
                        <h5>Lorem ipsum dorum anduim okleodm</h5>
                    </div>
                </div>

                <c:forEach items="${layout.celebrityReviews}" var="celebrityReview">
                    <div class="col-md-6">
                        <div class="test_item fix">
                            <div class="item_img">
                                <img class="img-circle"
                                     src="${celebrityReview.reviewImage}"
                                     alt=""/> <i class="fa fa-quote-left"></i>
                            </div>

                            <div class="item_text">
                                <h5>${celebrityReview.reviewTitle}</h5>
                                <h6>
                                    <a href="${celebrityReview.reviewLink}"
                                       target="_blank">${celebrityReview.reviewLinkTitle}</a>
                                </h6>
                                <p>${celebrityReview.reviewText}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>