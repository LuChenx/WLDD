<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=basePath%>/resource/css/index_Selller.css" media="screen" type="text/css" />
<title>首页-卖家</title>
</head>
<body>
	<!-- Contenedor -->
	<ul id="accordion" class="accordion">
		<li>
			<div class="link"><i class="fa fa-paint-brush"></i>账号管理<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu">
				<li><a target="main" href="<%=basePath%>/accountExamine.do">账号审核进度</a></li>
				<li><a target="main" href="<%=basePath%>/tochangePassword.do">修改密码</a></li>
				<li><a target="main" href="<%=basePath%>/myShop.do">我的网店</a></li>
			</ul>
		</li>
		<li>
			<div class="link"><i class="fa fa-code"></i>订单管理<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu">
				<li><a target="main" href="<%=basePath%>/toSendOrder.do">寄到隔壁</a></li>
				<li><a target="main" href="<%=basePath%>/toCompleteOrder.do">已完成订单</a></li>
				<li><a target="main" href="<%=basePath%>/toUnCompleteOrder.do">未完成订单</a></li>
			</ul>
		</li>
		<li><div class="link"><i class="fa fa-globe"></i>关于我们<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu">
				<li><a target="main" href="<%=basePath%>/showWang.do">关于老王</a></li>
				<li><a target="main" href="<%=basePath%>/showPrice.do">价格相关</a></li>
				<li><a target="main" href="<%=basePath%>/showMap.do">MAP</a></li>
			</ul>
		</li>
	</ul>
  <script src="<%=basePath%>/resource/js/index.js"></script>
</body>
</html>