<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>价格</title>
<style>
	label{
		font-size: 40px;
		margin-left: 30px;
		margin-top: 30px;
	}
	ul{
		margin-top:15px;
		margin-left: 45px;
	}
	li{
		color:white;
		font-size: 24px;
		margin-top:15px;
	}
</style>
</head>
<body style="background: #2d2c41;">
	<c:forEach var="em" items="${prices}">
		<label><a href="www.baidu.com">${em.ename}</a></label> 
		<ul>
			<li><span class="glyphicon glyphicon-pushpin"></span>广东省内：首重${em.eprice1}元/KG、续重${em.epricex1}元/KG。</li>
			<li><span class="glyphicon glyphicon-pushpin"></span>江苏、浙江、上海、北京、福建、首重${em.eprice2}元/KG、续重${em.epricex2}元/KG。</li>
			<li><span class="glyphicon glyphicon-pushpin"></span>天津、重庆、安徽、广西、贵州、海南、湖北、湖南、江西、山东、山西、陕西、云南、首重${em.eprice3}元/KG、续重${em.epricex3}元每/KG。</li>
			<li><span class="glyphicon glyphicon-pushpin"></span>四川、河北、河南、首重${em.eprice4}元/KG、续重${em.epricex4}元每/KG。</li>
			<li><span class="glyphicon glyphicon-pushpin"></span>甘肃、黑龙江、吉林、辽宁、内蒙古、宁夏、青海、西藏、新疆、首重${em.eprice5}元/KG、续重${em.epricex5}元/KG。</li>
			<li><span class="glyphicon glyphicon-pushpin"></span>香港、澳门、台湾、首重${em.eprice6}元/KG、续重${em.epricex6}元/KG。</li>
		</ul>
	</c:forEach>
</body>
</html>