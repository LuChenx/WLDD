<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=basePath%>/resource/css/register.css" type="text/css" />
<script src="<%=basePath%>/resource/js/register.js"></script>
<title>老王物流-注册成为新卖家</title>
</head>
</head>
<body>
	<h1>老王物流--注册</h1>
	
	<ol class="breadcrumb">
		<li><a href="<%=basePath%>/views/register.jsp">账号信息填写</a></li>
		<li><a href="#">卖家信息填写</a></li>
	</ol>
	<br>
	
	<div class="form row">  
            <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="<%=basePath%>registerUserInfo.do" method="post">   
                <div class="col-sm-9 col-md-9">  
                    <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="姓名" id="name" name="name" autofocus="autofocus" required/>  
                    </div>  
                    <div class="form-group">  
                      
                        <input class="form-control required" type="number" placeholder="联系电话" id="phone" name="phone" maxlength="11" required/>  
                    </div>  
                     
                    <div class="form-group">  
                        <input type="submit" class="btn btn-success pull-right" value="填写网店信息"/>  
                        <a href="<%=basePath%>/index.jsp"><input type="button" class="btn btn-info pull-left" id="back_btn" value="返回"/></a> 
                    </div>  
                </div>  
            </form>  
        </div>
        
</body>
</html>