<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=basePath%>/resource/css/register.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/resource/css/shopinfo.css" type="text/css" />
<script src="<%=basePath%>/resource/js/jsAddress.js"></script>
<title>老王物流-注册成为新卖家</title>
</head>
<body>
	<h1>老王物流--注册</h1>
	
	<ol class="breadcrumb">
		<li><a href="<%=basePath%>/views/register.jsp">账号信息填写</a></li>
		<li><a href="<%=basePath%>/views/register_personinfo.jsp">卖家信息填写</a></li>
		<li><a href="#">网店信息填写</a></li>
	</ol>
	<br>
	
	<div class="form row">  
            <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="<%=basePath%>registerShopInfo.do" method="post">   
                <div class="col-sm-9 col-md-9">  
                    <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="店名" id="name" name="shopName" autofocus="autofocus" required/>  
                    </div>   
                    
                    <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="营业执照编号" id="cardYY" name="cardYY" autofocus="autofocus" required/>  
                    </div>
                    
                    <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="经营许可证编号" id="cardJY" name="cardJY" autofocus="autofocus" required/>  
                    </div> 
                    
                    <input name="shopAddress" id="adress" value="" type="hidden"/>
                     
                     <div class="address">
                     	地址：<select id="area"></select>  
						省：<select id="cmbProvince"></select>  
						市：<select id="cmbCity"></select>  
						区：<select id="cmbArea"></select>
                     </div><br>
                     
                     <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="详细地址" id="detaddress" name="detaddress" autofocus="autofocus" required/>  
                    </div>
                    
                    <div class="form-group">  
                        <input type="submit" class="btn btn-success pull-right" value="成为老王中的一员" id="subutton"/>  
                        <a href="<%=basePath%>/index.jsp"><input type="button" class="btn btn-info pull-left" id="back_btn" value="返回"/></a> 
                    </div>  
                </div>  
            </form>  
    </div>
    
    <script type="text/javascript">  
   		addressInit('area','cmbProvince','cmbCity','cmbArea','西北地区', '北京', '市辖区', '东城区');  
   		$(function(){
   			
   			$("select").change(function(){
   				$("#adress").val($("#area").val()+"|"+$("#cmbProvince").val()+"|"+$("#cmbCity").val()+"|"+
   						$("#cmbArea").val()+"|"+$("#detaddress").val());
   			});
   			
			$("#detaddress").change(function(){
				$("#adress").val($("#area").val()+"|"+$("#cmbProvince").val()+"|"+$("#cmbCity").val()+"|"+
						$("#cmbArea").val()+"|"+$("#detaddress").val());
   			});
   			
   			$("#subutton").click(function(){
   				layer.msg('账号将进入审核状态，请耐心等候', {icon: 4});
   			});
   		});
	</script> 
</body>
</html>