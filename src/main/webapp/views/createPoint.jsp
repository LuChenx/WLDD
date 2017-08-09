<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="<%=basePath%>/resource/js/jsAddress.js"></script>
<title>创建快递点账号</title>
</head>
<body style="background: #2d2c41;">
	<h1>创建快递点</h1>
	<br>
	 <div class="form row">  
            <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="<%=basePath%>createPoint.do" method="post">   
                <div class="col-sm-9 col-md-9">  
                    <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="账号" id="loginName" name="loginName" autofocus="autofocus" required/>  
                    </div>  
                    <div class="form-group">  
                      
                        <input class="form-control required" type="password" placeholder="密码" id="register_password" name="loginPassword" required/>  
                    </div>  
                     <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="驻守点人员" id="username" name="userName" autofocus="autofocus" required/>  
                    </div>  
                    <div class="form-group">  
                      
                        <input class="form-control required" type="text" placeholder="驻守点电话" id="phone" name="phone" required/>  
                    </div>  
               
                        
                      <div class="address">
                     	地址：<select id="area"></select>  
						省：<select id="cmbProvince"></select>  
						市：<select id="cmbCity"></select>  
						区：<select id="cmbArea"></select>
                     </div><br>
                     
                     <div class="form-group">  
                        
                        <input class="form-control required" type="text" placeholder="详细地址" id="detaddress" name="detaddress" autofocus="autofocus" required/>  
                    </div>
                        <input class="form-control required" type="hidden" id="address" name="address" autofocus="autofocus"/>  
              
                    <div class="form-group">  
                        <input type="submit" class="btn btn-success pull-right" value="创建快递点"/>  
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
   					$("#address").val($("#area").val()+"|"+$("#cmbProvince").val()+"|"+$("#cmbCity").val()+"|"+
   							$("#cmbArea").val()+"|"+$("#detaddress").val());
   	   			});
   			});
   		</script>
</body>
</html>