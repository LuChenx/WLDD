<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>卖家审核</title>
</head>
<body style="background: #2d2c41;">
	<table class="table table-hover">
  		<caption style="font-size: 35px;font-family: 华文行楷">待审核卖家账号</caption>
		<thead style="color:white;font-size: 20px">
		  <tr>
		    <th>姓名</th>
		    <th>账号</th>
		    <th>店名</th>
		    <th>电话</th>
		    <th>地址</th>
		    <th>营业执照</th>
		    <th>经营许可证</th>
		    <th>操作</th>
		  </tr>
		</thead>
	  <tbody style="color:AAAAAA;">
	  	<c:forEach var="seller" items="${reviewseller}">
	  		<tr>
		      <td>${seller.sellerName}</td>
		      <td>${seller.loginName}</td>
		      <td>${seller.shopName}</td>
		      <td>${seller.sellerPhone}</td>
		      <td>${seller.shopAddress}</td>
		      <td>${seller.cardYY}</td>
		      <td>${seller.cardJY}</td>
		      <td><a href="<%=basePath%>/removerSeller.do?sellerId=${seller.sellerId}"><button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>拒绝</button></a>
		      <a href="<%=basePath%>/aggreSeller.do?sellerId=${seller.sellerId}"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span>通过</button></a></td>
	    	</tr>
	  	</c:forEach>
	  </tbody>
	</table>
</body>
</html>