<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="basePath" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${path}/"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="Shortcut Icon" href="<%=basePath%>/resource/icon/panda_24px_1082113_easyicon.net.ico">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/resource/bootstrap-3.3.0-dist/dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/resource/bootstrap-3.3.0-dist/dist/css/bootstrap.min.css">
<script src="<%=basePath%>/resource/bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/resource/js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>/resource/layer/layer.js"></script>
<link rel="stylesheet" href="<%=basePath%>/resource/css/style.css" media="screen" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/resource/css/font-awesome.min.css" type="text/css" />
