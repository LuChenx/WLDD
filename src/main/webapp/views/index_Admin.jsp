<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=basePath%>/resource/css/index_Selller.css" media="screen" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/resource/css/cdstyle.css" type="text/css" />
<title>首页-管理员</title>
</head>
<body>
	<!-- Contenedor -->
	<ul id="accordion" class="accordion">
		<li>
			<div class="link"><i class="fa fa-code"></i>订单统计<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu">
				<li><a target="main" href="<%=basePath%>/toCompleteAdmin.do">已完成订单</a></li>
				<li><a target="main" href="<%=basePath%>/toUnCompleteAdmin.do">未完成订单</a></li>
				<li><a target="main" href="<%=basePath%>/toOrderSearch.do">订单查询</a></li>
			</ul>
		</li>
		<li>
			<div class="link"><i class="fa fa-code"></i>快递点管理<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu">
				<li><a target="main" href="<%=basePath%>/toCreatePoint.do">创建新快递点账号</a></li>
				<li><a target="main" href="<%=basePath%>/toDeletePoint.do">撤销快递点</a></li>
				<li><a target="main" href="<%=basePath%>/toChinaMap.do">全国快递点分布图</a></li>
			</ul>
		</li>
		<li>
		　　<c:if test="${message > 0}" ><div class="link"><i class="fa fa-code"></i>卖家审核<span class="unread">${message}</span></div></c:if>
		　　<c:if test="${message == 0}"><div class="link"><i class="fa fa-code"></i>卖家审核<i class="fa fa-chevron-down"></i></div></c:if>
			<ul class="submenu">
				<li><a target="main" href="<%=basePath%>/toReviewSeller.do">卖家账号审核</a></li>
			</ul>
		</li>
		<li><div class="link"><i class="fa fa-globe"></i>关于我们<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu">
				<li><a target="main" href="<%=basePath%>/showWang.do">关于老王</a></li>
				<li><a target="main" href="<%=basePath%>/editPrice.do">价格相关</a></li>
				<li><a target="main" href="<%=basePath%>/showMap.do">MAP</a></li>
			</ul>
		</li>
	</ul>
  <script src="<%=basePath%>/resource/js/index.js"></script>
  <script src="<%=basePath%>/resource/js/cdindex.js"></script>
  <script>
	  $(function(){
		  //10分钟刷新一下消息数量
		  setInterval(getMessage,1000*60*10);
		  function getMessage(){
			  $.post("<%=basePath%>refashMessage.do",{msg:"getMessage"},function(data){
			  		$(".unread").text(data.status);
			  	},"json"); 
		  }
		  
		  //手动刷新
		  $.post("<%=basePath%>refashMessage.do",{msg:"getMessageByUser"},function(data){
			  $(".unread").text(data.status);
		  	},"json");
	  });
  </script>
</body>
</html>