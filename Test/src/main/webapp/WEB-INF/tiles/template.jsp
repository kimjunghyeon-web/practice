<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:set var="ctxp" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctxp}/css/reset.css">
<meta charset="UTF-8">
<title>PracticePage</title>
<style>
* {
	margin:0;
	padding:0;
}
#header {
	width: 100%;
	height: 100px;
	text-align: center;
	line-height: 100px;
	background-color: #f9f3e3;
	border:1px solid gray;
}

#nav {
	border:1px solid gray;
}

#left {
	float: left;
	width: 15%;
	text-align: center;
	background-color: #cfc8b5;
	border:1px solid gray;
}

#main {
	float: left;
	width: 85%;
	background-color: #f9f3e3;
	border:1px solid gray;
	overflow: auto;
}

#footer {
	width: 100%;
	height: 50px;
	text-align: center;
	background-color: #cfc8b5;
	clear: both;
	border:1px solid gray;
}

#left, #main {
	min-height: 800px;
	max-height: 800px;
}
</style>
</head>
<body>
<div id="wrap">
	<div style="width: 100%; height: 100%;">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="nav">
			<tiles:insertAttribute name="nav" />
		</div>
		<div id="left">
			<tiles:insertAttribute name="left" />
		</div>
		<div id="main">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	</div>
</body>
</html>