<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	

<title>完成订单</title>
</head>
<body style="background: #2d2c41;">
	<table class="table table-hover" data-pagination="true">
  <caption style="font-size: 35px;font-family: 华文行楷">已完成订单</caption>
  <thead style="color:white;font-size: 20px">
    <tr>
      <th>订单号</th>
      <th>收件人</th>
      <th>收件地址</th>
      <th>收件人电话</th>
      <th>发货时间</th>
      <th>收货时间</th>
    </tr>
  </thead>
  <tbody style="color:AAAAAA;">
  	<c:forEach var="order" items="${complete}">
  		<tr>
	      <td><a style="cursor:pointer;" href="showOrderDetail.do?orderId=${order.orderId}">${order.orderId}</a></td>
	      <td>${order.reviceName}</td>
	      <td>${order.destination}</td>
	      <td>${order.revicePhone}</td>
	      <td>${order.orderTime}</td>
	      <td>${order.reciveTime}</td>
    	</tr>
  	</c:forEach>
  </tbody>
</table>
</body>
</html>