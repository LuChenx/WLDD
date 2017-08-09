<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>账号审核</title>
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
		margin-left:30%;
		font-family: 华文新魏;
	}
	.accinfo{
		font-size:35px;
		margin-left:15%;
		font-family: 华文新魏;
	}
</style>
<body style="background: #2d2c41;">

	<label><span class="glyphicon glyphicon-link"></span>账号信息</label><br><br>
	
	<div class="content">
		<span class="title"><span class="glyphicon glyphicon-th-list" style="font-size: 20"></span>  注册账号:</span><span class="accinfo">${Seller.loginName}</span><br><br>
		<span class="title"><span class="glyphicon glyphicon-user" style="font-size: 20"></span>  用户姓名:</span><span class="accinfo">${Seller.sellerName}</span><br><br>
		<span class="title"><span class="glyphicon glyphicon-phone-alt" style="font-size: 20"></span>  联系电话:</span><span class="accinfo">${Seller.sellerPhone}</span><br><br>
		<span class="title"><span class="glyphicon glyphicon-home" style="font-size: 20"></span>  关联网店:</span><span class="accinfo">${Seller.shopName}</span><br><br>
		<span class="title"><span class="glyphicon glyphicon-calendar" style="font-size: 20"></span>  申请时间:</span><span class="accinfo">${Seller.accountCreateTime}</span><br><br>
		<span class="title"><span class="glyphicon glyphicon-record" style="font-size: 20"></span>  审核状态:</span><span class="accinfo">${Seller.status}</span><br><br>
	</div>
	
	<hr style=" height:4px;border:none;border-top:2px solid #FFFFFF;" />
	
	<label><span class="glyphicon glyphicon-paperclip"></span>关于审核</label><br><br>
	
	<ul style="color:white;margin-left:15%;font-size: 20px">
		<li><span class="glyphicon glyphicon-pushpin"></span>账号申请后将进入审核状态，审核时间根据情况而定，但最长不会查过一周，请您耐心等待。</li>
		<li><span class="glyphicon glyphicon-pushpin"></span>账号状态显示为待审核，即是您的账号任然处于未审核状态。否则表示您的账号在审核过程中出现了问题，请保证您的输入的相关证件号是正确的。</li>
		<li><span class="glyphicon glyphicon-pushpin"></span>如有任何疑问，请拨打老王热线：18408253317.</li>
	</ul>
</body>
</html>