<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=basePath%>/resource/css/register.css" type="text/css" />
<script src="<%=basePath%>/resource/js/register.js"></script>
<title>个人用户注册</title>
</head>
<body>
	<h1>老王物流--个人用户注册</h1>
	
	<ol class="breadcrumb">
		<li><a href="#">账号信息填写</a></li>
	</ol>
	<br>
	 <div class="form row">  
            <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="<%=basePath%>personregister.do" method="post">   
                <div class="col-sm-9 col-md-9">  
                    <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="账号" id="username" name="username" autofocus="autofocus" required/>  
                    </div>  
                    <div class="form-group">  
                      
                        <input class="form-control required" type="password" placeholder="密码" id="register_password" name="password" required/>  
                    </div>  
                    <div class="form-group">  
                         
                         <input class="form-control required" type="password" placeholder="确认密码" name="rpassword" required id="repassword"/>  
                    </div>    
                    <div class="form-group">  
                        <input type="submit" class="btn btn-success pull-right" value="注册成为个人用户"/>  
                        <a href="<%=basePath%>/index.jsp"><input type="button" class="btn btn-info pull-left" id="back_btn" value="返回"/></a> 
                    </div>  
                </div>  
            </form>  
        </div>  
</body>
</html>