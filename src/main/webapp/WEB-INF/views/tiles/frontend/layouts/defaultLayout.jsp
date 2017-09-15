<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><tiles:getAsString name="title" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<tiles:insertAttribute name="head-scripts-styles" />
<link rel="stylesheet" href="<c:url value='/resources/css/backend/common/fullcalendar.min.css' />" >
</head>

<body data-spy="scroll" data-target=".navbar-collapse">

	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="menu" />

	<div id="site-content">
		<tiles:insertAttribute name="body" />
	</div>

	<tiles:insertAttribute name="footer" />
</body>
</html>