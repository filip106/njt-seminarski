<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>Admin panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="<c:url value='/resources/image/favicon.ico' />">
    <!-- Jquery scripts -->
    <script src="<c:url value='/resources/js/backend/jquery.min.js' />"></script>
    <link href="<c:url value='/resources/css/common/bootstrap.min.css' />" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/backend/common/jquery-ui.min.css' />">
    <link href="<c:url value='/resources/css/common/font-awesome.min.css' />" rel="stylesheet"/>

    <link href="<c:url value='/resources/css/backend/common/metisMenu.min.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/backend/common/sb-admin-2.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/backend/common/morris.css' />" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/resources/css/backend/common/switchery.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/backend/common/dropify.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/backend/common/powerange.min.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/backend/common/style.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/backend/common/fullcalendar.min.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/common/toastr.min.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/backend/common/select2.min.css' />">

    <style>
        @font-face {
            font-family: 'dropify';
            src: url("/resources/css/fonts/dropify.eot");
            src: url("/resources/css/fonts/eot#iefix") format("embedded-opentype"),
            url("/resources/css/fonts/dropify.woff") format("woff"),
            url("/resources/css/fonts/dropify.ttf") format("truetype"),
            url("/resources/css/fonts/dropify.svg#dropify") format("svg");
            font-weight: normal;
            font-style: normal;
        }
        .input-group-btn:last-child>.btn {
            height: 34px;
        }
    </style>

</head>

<body>
<div id="wrapper">
    <tiles:insertAttribute name="navigation-menu"/>

    <div id="page-wrapper">
        <tiles:insertAttribute name="body"/>
    </div>
</div>

<tiles:insertAttribute name="footer-scripts"/>

</body>
</html>