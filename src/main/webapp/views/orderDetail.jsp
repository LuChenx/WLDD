<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=basePath%>/resource/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/resource/layui/css/layui.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单详情</title>
</head>
<body style="background: #2d2c41;">

<div class="layui-collapse">
	  <div class="layui-colla-item">
	    <h2 class="layui-colla-title">寄件人信息</h2>
	    <div class="layui-colla-content layui-show">
	    	<table class="table table-striped">
				  <thead style="color:white;">
				    <tr>
				      <th>寄件人</th>
				      <th>寄件地址</th>
				      <th>联系电话</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>${order.owerName}</td>
				      <td>${order.address}</td>
				      <td>${order.owerPhone}</td>
				    </tr>
				  </tbody>
			</table>
	    </div>
	  </div>
	  <div class="layui-colla-item">
	    <h2 class="layui-colla-title">订单信息</h2>
	    <div class="layui-colla-content layui-show">
	    	<table class="table table-striped">
				  <thead style="color:white;">
				    <tr>
				      <th>物品种类</th>
				      <th>邮寄方式</th>
				      <th>支付方式</th>
				      <th>支付金额</th>
				      <th>发货时间</th>
				      <th>收货时间</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>${order.itemType}</td>
				      <td>${order.orderEmType}</td>
				      <td>${order.payType}</td>
				      <td>${order.price}</td>
				      <td>${order.orderTime}</td>
				      <td>${order.reciveTime}</td>
				    </tr>
				  </tbody>
			</table>
	    </div>
		</div>

	  <div class="layui-colla-item">
	    <h2 class="layui-colla-title">收件人信息</h2>
	    <div class="layui-colla-content layui-show">
	    	<table class="table table-striped">
				  <thead style="color:white;">
				    <tr>
				      <th>收件人</th>
				      <th>收件地址</th>
				      <th>联系电话</th>
				    </tr>
				  </thead>
				   <tbody>
				    <tr>
				      <td>${order.reviceName}</td>
				      <td>${order.destination}</td>
				      <td>${order.revicePhone}</td>
				    </tr>
				  </tbody>
			</table>
	    </div>
	  </div>
	</div>

<script>
	layui.use('element', function(){
	  var element = layui.element();
	});
</script>
</body>
</html>