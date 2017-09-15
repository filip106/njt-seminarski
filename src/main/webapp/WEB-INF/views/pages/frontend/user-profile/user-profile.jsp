<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="user" scope="request" type="com.silab.njt.springmvc.model.User"/>

<c:choose>
    <c:when test="${user.imagePath != null}">
        <c:set var = "imagePath" scope = "session" value = "${user.imagePath}"/>
    </c:when>    
    <c:otherwise>
        <c:url value="/resources/image/uploads/users/default-user.jpg" var="imageUrl" />
        <c:set var = "imagePath" scope = "session" value = "${imageUrl}"/>
    </c:otherwise>
</c:choose>

<style>
    .title{
        text-align: center;
        color: #2c3e50;
    }

    .user-profile-container {max-width: 940px; width: 100%; margin: 0 auto; }
    .twelve { width: 100%; }
    .eleven { width: 91.53%; }
    .ten { width: 83.06%; }
    .nine { width: 74.6%; }
    .eight { width: 66.13%; }
    .seven { width: 57.66%; }
    .six { width: 49.2%; }
    .five { width: 40.73%; }
    .four { width: 32.26%;}
    .three { width: 23.8%; }
    .two { width: 15.33%; }
    .one{ width: 6.866%;}

    .col {
        display: block;
        float:left;
        margin: 1% 0 1% 1.6%;
    }

    .col:first-of-type { margin-left: 0; }

    .cf:before, .cf:after {
        content: " ";
        display: table;
    }
    .cf:after {
        clear: both;
    }
    .cf {
        *zoom: 1;
    }

    .card{
        max-width: 100%;
        height: 400px;
        background-color: papayawhip;
        font-family: 'Arimo', sans-serif;
        font-size: 14px;
    }
    #card1{
        text-align: center;
        color: #2c3e50;
        padding: 15px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    #card1 .image-wrapper{
        width: 100px;
        height: 100px;
        margin: 20px auto;
        border-radius: 100%;
        background-image: url("<c:url value='/resources/image/uploads/users/user-tasks.png' />");
        background-size: cover;
        background-repeat: no-repeat;
    }
    #card1 .info .four{
        text-align: center;
        border-right: 1px solid #2c3e50;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    #card1 .info .four:last-of-type{
        border-right: none;
    }
    #card1 .info .four .number{
        display: block;
        font-size: 20px;
        padding: 3px 0;
        font-weight: 700;
    }
    #card1 .options{
        margin-top: 30px;
        text-align: left;
    }
    #card1 .options ul{
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    #card1 .options ul .icon,
    .social-icons
    {
        display: inline-block;
        width: 30px;
        height: 30px;
        background-color: #3498db;
        border-radius: 100%;
        margin-right: 8px;
        vertical-align: middle;
        color: #fff;
        line-height: 30px;
        text-align: center;
    }
    #card1 .options ul li{
        margin: 12px 0;
    }

    #card2{
        overflow: hidden;
        color: #2c3e50;
    }
    #card2 a{
        color: #2c3e50;
    }
    #card2 .wrapper{
        padding: 10px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    #card2 .header{
        width: 100%;
        height: 100px;
        position: relative;
        background-color: #3498db;
    }
    #card2 .header:after{
        content: '';
        background: inherit;
        bottom: 0;
        display: block;
        height: inherit;
        position: absolute;
        left: 0;
        right: 0;
        transform: skewY(-8deg);
        -webkit-transform: skewY(-8deg);
        transform-origin: 100%;
    }
    #card2 .image-wrapper{
        width: 100px;
        height: 100px;
        border-radius: 100%;
        background-image: url("<c:out value='${imagePath}' />");
        background-size: cover;
        background-repeat: no-repeat;
        position: absolute;
        z-index: 5;
        top: 310px;
        left: 50%;
        margin-left: -50px;
    }
    #card2 .name{
        margin-top: 70px;
        text-align: center;
    }
    #card2 .social .four{
        text-align: center;
    }
    #card2 .info{
        margin: 30px 0;
        text-align: center;
    }

    #card3{
        color: #2c3e50;
    }
    #card3 .header{
        width: 100%;
        height: 180px;
        /*background-image: url("https://static.pexels.com/photos/9692/pexels-photo.jpeg");*/
        background-size: cover;
        background-repeat: no-repeat;
    }
    #card3 .wrapper{
        padding: 0px 15px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    #card3 .name{
        font-weight: 400;
    }
    #card3 .info{
        margin: 20px 0;
        text-align: center;
    }
    #card3 .info .number{
        background-color: #3498db;
        color: #fff;
        border-radius: 100%;
        width: 70px;
        height: 70px;
        line-height: 70px;
        text-align: center;
        margin: 0 auto;
        font-size: 20px;
    }
    #site-content {
        margin-top: 200px;
    }
    .options .fa,
    .social-icons .fa
    {
        top: 7px;
        position: relative;
        color: white;
    }
</style>

<div class="user-profile-container">
    <h1 class="title">Profile Korisnika</h1>
    <div class="row cf">
        <div id="card1" class="card four col">
            <div class="image-wrapper"></div>
            <h3 class="name">Amy Smith</h3>
            <div class="info cf">
                <div class="four col"><span class="number">100</span>Posts</div>
                <div class="four col"><span class="number">28</span>Tasks</div>
                <div class="four col"><span class="number">179</span>Likes</div>
            </div>
            <div class="options">
                <ul>
                    <li><span class="icon"><i class="fa fa-plus"></i></span>Add to team</li>
                    <li><span class="icon"><i class="fa fa-envelope"></i></span>Send a message</li>
                </ul>
            </div>
        </div>

        <div id="card2" class="card four col">
            <div class="header"></div>
            <div class="wrapper">
                <div class="image-wrapper"></div>
                <h3 class="name">${user.username}</h3>
                <div class="social cf">
                    <div class="four col">
                        <a class="social-icons" href="#"><i class="fa fa-facebook"></i></a>
                    </div>
                    <div class="four col">
                        <a class="social-icons" href="#"><i class="fa fa-twitter"></i></a>
                    </div>
                    <div class="four col">
                        <a class="social-icons" href="#"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="info">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem aspernatur, mollitia
                        suscipit perspiciatis minima reprehenderit quasi consectetur.</p>
                </div>
            </div>
        </div>

        <div id="card3" class="card four col">
            <div class="header"></div>
            <div class="wrapper">
                <h2 class="name">${user.firstName} ${user.lastName}</h2>
            </div>
            <div class="info cf">
                <div class="four col">
                    <div class="number">17</div>

                </div>
                <div class="four col">
                    <div class="number">239</div>
                </div>
                <div class="four col">
                    <div class="number">8</div>
                </div>
            </div>
        </div>
    </div>
</div>