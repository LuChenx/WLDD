<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/resource/css/index.css"> 
<script src="<%=basePath%>/resource/js/index.js">
</script>
<title>老王物流</title>
</head>
<body>
<h1>老王物流--登入</h1>
	<div class="logindiv">
		
		<form class="form-horizontal" role="form">
		  <div class="form-group">
		    <label for="firstname" class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="loginName" name="loginName" placeholder="请输入用户名" required>
		    </div>
		  </div>
		  <br>
		  <div class="form-group">
		    <label for="lastname" class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="password"	name="password" placeholder="请输入密码" required>
		    </div>
		  </div>
		  <br>
		  
		  <div class="form-group">
		    <label for="lastname" class="col-sm-2 control-label">身份</label>
		    <div class="col-sm-10">
		      <select name="ident" class="form-control" id="ident">
		      	<option value="1">卖家</option>
		      	<option value="0">个人</option>
		      	<option value="2" selected="selected">快递公司管理员</option>
		      	<option value="3">快递小哥</option>
		      </select>
		    </div>
		  </div>
		  
		  <br>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="button" class="btn btn-primary btn-block" id="subbtu">登入</button>
		    </div>
		  </div>
		  
		</form>
		<a class="registerLink" href="toregister.do">注册成为卖家</a>&nbsp;|&nbsp;<a class="registerLink" href="toregisterperson.do">注册成为个人</a>
	</div>
</body>
</html>