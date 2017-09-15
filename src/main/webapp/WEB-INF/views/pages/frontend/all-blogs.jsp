<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .post-item {
        margin-bottom: 50px;
    }

    .post-item .post-thumb {
        position: relative;
        margin-bottom: 30px;
    }

    .banner-effect {
        position: relative;
        display: block;
        overflow: hidden;
    }

    .post-item .date {
        position: absolute;
        top: 0;
        left: 0;
        font-size: 18px;
        text-align: center;
        min-width: 75px;
        padding: 14px 0;
        text-transform: uppercase;
    }

    .post-item .categories {
        position: absolute;
        bottom: 10px;
        right: 10px;
        padding: 3px 30px;
        font-size: 14px;
        color: #778691;
        display: inline-block;
    }

    .banner-effect9 img {
        -webkit-transition: all .4s ease-in;
        transition: all .4s ease-in;
    }

    .post-list.post-items img:not(.kt-lazy), .owl-carousel img, .product-item img {
        height: auto;
    }

    .post-list.post-items img {
        max-width: 100%;
        height: auto;
    }

    .post-list.post-items img {
        vertical-align: middle;
    }

    .post-list.post-items img {
        border: 0;
    }

    .post-item .date .day {
        font-size: 30px;
        font-weight: bold;
    }

    .post-item .date > span {
        display: block;
    }

    .post-item .categories a {
        color: #778691;
    }

    .post-item .post-name {
        font-size: 22px;
        margin-bottom: 17px;
        text-transform: uppercase;
    }

    h3 {
        margin-top: 0;
        font-weight: 600;
        margin-bottom: 30px;
        font-family: 'Gotham', sans-serif;
    }

    .post-item .post-metas {
        margin-bottom: 13px;
    }

    .post-item .post-excerpt {
        margin-bottom: 30px;
    }

    .post-item .readmore {
        font-size: 11px;
        text-transform: uppercase;
        font-family: 'Gotham', sans-serif;
        font-weight: 600;
        display: inline-block;
    }

    .post-item .readmore .text {
        display: inline-block;
        margin-right: 11px;
    }

    .post-item .readmore .icon {
        font-size: 15px;
        display: inline-block;
        vertical-align: middle;
    }

    .post-item .date {
        background-color: #333333;
        color: #fff;
    }

    .post-item .categories {
        background-color: #fff;
    }

    .post-item .post-metas > span:after {
        content: '/';
        display: inline-block;
        padding: 0 5px;
    }

    .post-item .post-metas > span {
        color: #fe9e4b;
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
            <div class="col-sm-9 padding-right">
                <div class="features_items">
                    <h2 class="title text-center">NAJNOVIJI BLOGOVI</h2>
                    <div class="post-list post-items">
                        <c:forEach items="${allBlogPosts}" var="blog">
                            <div class="post-item">
                                <div class="post-thumb">
                                    <a class="thumb-link banner-effect banner-effect9"
                                       href="<c:url value='/blog-details/${blog.slug}' />">
                                        <img width="1170" height="462" src="${blog.baseImage}" alt="">
                                    </a>
                                    <div class="date">
                                        <span class="day">21</span>
                                        <span class="month">Dec</span>
                                    </div>
                                    <div class="categories">
                                        <a href="#">New Accessories</a>,
                                        <a href="#">Uncategorized</a>
                                    </div>
                                </div>
                                <div class="post-item-info">
                                    <h3 class="post-name">
                                        <a href="<c:url value='/blog-details/${blog.slug}' />">${blog.title}</a>
                                    </h3>
                                    <div class="post-metas">
                                        <span class="author">Posted by admin</span>
                                        <span class="comment">1 comment</span>
                                    </div>
                                    <div class="post-excerpt">
                                        <p>Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is
                                            therefore always free from repetition.</p>
                                    </div>
                                    <a href="<c:url value='/blog-details/${blog.slug}' />" class="readmore">
                                        <span class="text">Pročitaj više</span>
                                        <span class="icon flaticon-arrows-3"></span>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>