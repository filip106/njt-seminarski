<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="blogPost" scope="request" type="com.silab.njt.springmvc.model.blog.BlogPost"/>

<style>
    .owl-carousel img {
        max-width: 175px;
    }
</style>

<section>
    <div class="container">
        <div class="row" style="margin-top: 150px">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <div class="brands_products">
                        <h2>Kategorije Blogova</h2>
                        <div class="brands-name">
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href=""> <span class="pull-right">(5)</span>Sport</a></li>
                                <li><a href=""> <span class="pull-right">(9)</span>Tereni</a></li>
                                <li><a href=""> <span class="pull-right">(2)</span>Ishrana</a></li>
                                <li><a href=""> <span class="pull-right">(4)</span>Ostalo</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="shipping text-center">
                        <img src="<c:url value='/resources/image/uploads/blog_post_banner.gif' />" alt=""/>
                    </div>

                    <div class="shipping text-center">
                        <img src="<c:url value='/resources/image/uploads/blog_post_banner2.png' />" alt=""/>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="blog-post-area">
                    <h2 class="title text-center">NAJNOVIJE OD BLOGERA</h2>
                    <div class="single-blog-post">
                        <h3>${blogPost.title}</h3>
                        <div class="post-meta">
                            <ul>
                                <li><i class="fa fa-user"></i> Mac Doe</li>
                                <li><i class="fa fa-clock-o"></i> 08:22h</li>
                                <li><i class="fa fa-calendar"></i> DEC 5, 2013</li>
                            </ul>
                            <span> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                        class="fa fa-star-half-o"></i>
							</span>
                        </div>
                        <div class="fancybox-items-holder">
                            <a href="<c:url value='/resources/image/uploads/blog/top-spin.jpg' />"
                               data-fancybox="group" data-caption="${blogPost.title}">
                                <img src="<c:url value='/resources/image/uploads/blog/top-spin.jpg' />" alt="">
                            </a>

                            <div class="owl-carousel owl-theme">
                                <a href="<c:url value='/resources/image/uploads/blog/top-spin2.jpg' />"
                                   data-fancybox="group" data-caption="${blogPost.title}">
                                    <img src="<c:url value='/resources/image/uploads/blog/top-spin2.jpg' />" alt="">
                                </a>
                                <a href="<c:url value='/resources/image/uploads/blog/top-spin3.jpg' />"
                                   data-fancybox="group" data-caption="${blogPost.title}">
                                    <img src="<c:url value='/resources/image/uploads/blog/top-spin3.jpg' />" alt="">
                                </a>
                                <a href="<c:url value='/resources/image/uploads/blog/top-spin4.jpg' />"
                                   data-fancybox="group" data-caption="${blogPost.title}">
                                    <img src="<c:url value='/resources/image/uploads/blog/top-spin4.jpg' />" alt="">
                                </a>
                                <a href="<c:url value='/resources/image/uploads/blog/top-spin5.jpg' />"
                                   data-fancybox="group" data-caption="${blogPost.title}">
                                    <img src="<c:url value='/resources/image/uploads/blog/top-spin5.jpg' />" alt="">
                                </a>
                            </div>
                        </div>

                        <div>${blogPost.content}</div>
                        <div></div>
                    </div>
                </div>

                <div class="rating-area">
                    <ul class="tag">
                        <li>TAGOVI:</li>
                        <c:forEach items="${blogPost.tags}" var="tag" varStatus="loop">
                            <li>
                                <a class="color" href="">${tag}&nbsp;
                                    <c:if test="${!loop.last}">
                                        <span>/</span>
                                    </c:if>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!--/rating-area-->

                <div class="socials-share">
                    <%--<a href=""><img src="assets/images/blog/socials.png" alt=""></a>--%>
                </div>
                <!--/socials-share-->

                <div class="media commnets">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="<c:url value='/resources/image/uploads/man-one.jpg' />" alt="">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">Annie Davis</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                            sed do eiusmod tempor incididunt ut labore et dolore magna
                            aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                            ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        <div class="blog-socials">
                            <ul>
                                <li><a href=""><i class="fa fa-facebook"></i></a></li>
                                <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                                <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                            <a class="btn btn-primary" href="">Other Posts</a>
                        </div>
                    </div>
                </div>
                <!--Comments-->
                <div class="response-area">
                    <h2>3 RESPONSES</h2>
                    <ul class="media-list">
                        <li class="media"><a class="pull-left" href="#"> <img
                                class="media-object" src="<c:url value='/resources/image/uploads/man-two.jpg' />"
                                alt="">
                        </a>
                            <div class="media-body">
                                <ul class="sinlge-post-meta">
                                    <li><i class="fa fa-user"></i>Janis Gallagher</li>
                                    <li><i class="fa fa-clock-o"></i> 1:33 pm</li>
                                    <li><i class="fa fa-calendar"></i> DEC 5, 2013</li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                    sed do eiusmod tempor incididunt ut labore et dolore magna
                                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                    ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                <a class="btn btn-primary" href=""><i class="fa fa-reply"></i>Replay</a>
                            </div>
                        </li>
                        <li class="media second-media"><a class="pull-left" href="#">
                            <img class="media-object" src="<c:url value='/resources/image/uploads/man-three.jpg' />"
                                 alt="">
                        </a>
                            <div class="media-body">
                                <ul class="sinlge-post-meta">
                                    <li><i class="fa fa-user"></i>Janis Gallagher</li>
                                    <li><i class="fa fa-clock-o"></i> 1:33 pm</li>
                                    <li><i class="fa fa-calendar"></i> DEC 5, 2013</li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                    sed do eiusmod tempor incididunt ut labore et dolore magna
                                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                    ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                <a class="btn btn-primary" href=""><i class="fa fa-reply"></i>Replay</a>
                            </div>
                        </li>
                        <li class="media"><a class="pull-left" href="#"> <img
                                class="media-object" src="<c:url value='/resources/image/uploads/man-four.jpg' />"
                                alt="">
                        </a>
                            <div class="media-body">
                                <ul class="sinlge-post-meta">
                                    <li><i class="fa fa-user"></i>Janis Gallagher</li>
                                    <li><i class="fa fa-clock-o"></i> 1:33 pm</li>
                                    <li><i class="fa fa-calendar"></i> DEC 5, 2013</li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                    sed do eiusmod tempor incididunt ut labore et dolore magna
                                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                    ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                <a class="btn btn-primary" href=""><i class="fa fa-reply"></i>Replay</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--/Response-area-->
                <div class="replay-box">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2>Leave a replay</h2>
                            <form>
                                <div class="blank-arrow">
                                    <label>Your Name</label>
                                </div>
                                <span>*</span> <input placeholder="write your name...">
                                <div class="blank-arrow">
                                    <label>Email Address</label>
                                </div>
                                <span>*</span> <input type="email" placeholder="your email address...">
                                <div class="blank-arrow">
                                    <label>Web Site</label>
                                </div>
                                <input type="email" placeholder="current city...">
                            </form>
                        </div>
                        <div class="col-sm-8">
                            <div class="text-area">
                                <div class="blank-arrow">
                                    <label>Your Name</label>
                                </div>
                                <span>*</span>
                                <textarea name="message" rows="11"></textarea>
                                <a class="btn btn-primary" href="">post comment</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Repaly Box-->
            </div>
        </div>
    </div>
</section>

<%--Scripts--%>
<script src="<c:url value='/resources/js/common/jquery.prettyPhoto.js' />"></script>
<script src="<c:url value='/resources/js/common/jquery.fancybox.min.js' />"></script>
<script src="<c:url value='/resources/js/common/rating.min.js' />"></script>
<script>
    $(document).ready(function () {
        $("[data-fancybox]").fancybox({
            loop: true
        });
    });
</script>