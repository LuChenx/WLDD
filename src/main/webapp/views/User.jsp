<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>老王物流（个人用户）</title>
<!-- fream框架 -->
</head>
	<frameset cols="13%,*">
		<frame src="<%=basePath%>views/index_User.jsp" scrolling="no" name="left">
		<frame src="<%=basePath%>views/hello_Seller.jsp" scrolling="auto" name="main">
	<noframes>
<body>
	<p>对不起，您的浏览器不支持frameset</p>
</body>
	</noframes>
	</frameset>
</html>