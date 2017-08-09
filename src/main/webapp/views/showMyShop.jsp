<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>关联的网店</title>
</head>
<style>
	label{
		margin-left:50px;
		margin-top:25px;
		font-size: 48px ;
		color:white;
		font-family: 方正姚体;
	}
	span{
		color:white;
	}
	.title{
		font-size:40px;
		margin-left:25%;
		font-family: 华文新魏;
	}
	.accinfo{
		font-size:35px;
		margin-left:15%;
		font-family: 华文新魏;
	}
</style>
<body style="background: #2d2c41;">
	<label><span class="glyphicon glyphicon-link"></span>关联店铺</label><br><br>
	
	<div class="content">
		<span class="title"><span class="glyphicon glyphicon-th-list" style="font-size: 20"></span>  关联网店名:</span><span class="accinfo">${Seller.shopName}</span><br><br>
		<span class="title"><span class="glyphicon glyphicon-home" style="font-size: 20"></span>  网店的地址:</span><span class="accinfo">${Seller.shopAddress}</span><br><br>
		<span class="title"><span class="glyphicon glyphicon-tag" style="font-size: 20"></span>  营业执照号:</span><span class="accinfo">${Seller.cardYY}</span><br><br>
		<span class="title"><span class="glyphicon glyphicon-tags" style="font-size: 20"></span>  经营许可证:</span><span class="accinfo">${Seller.cardJY}</span><br><br>
	</div>
	
		<hr style=" height:4px;border:none;border-top:2px solid #FFFFFF;" />
	
	<label><span class="glyphicon glyphicon-paperclip"></span>关于店铺</label><br><br>
	
	<ul style="color:white;margin-left:15%;font-size: 20px">
		<li><span class="glyphicon glyphicon-pushpin"></span>关联店铺的相关信息暂不支持修改。</li>
		<li><span class="glyphicon glyphicon-pushpin"></span>请一定填写正确的营业执照和经营许可证号。</li>
		<li><span class="glyphicon glyphicon-pushpin"></span>如有任何疑问，请拨打老王热线：18408253317.</li>
	</ul>
	
</body>
</html>