<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
</head>
<style>
	label{
		margin-left:50px;
		margin-top:25px;
		font-size: 48px ;
		color:white;
		font-family: 方正姚体;
	}
	.content{
		color:white;
		margin-top:50px;
	}
	.form-group{
		width: 50%;
		margin:0 auto;
	}

</style>
<body  style="background: #2d2c41;">
	<label><span class="glyphicon glyphicon-lock"></span>密码修改</label><br><br>
	
		<div class="content" style="text-align: center;">

				 <div class="form-group">
				    <input type="password" class="form-control" id="passold" placeholder="原密码">
				  </div><br>
				  <div class="form-group">
				    <input type="password" class="form-control" id="passnew" placeholder="新密码">
				  </div><br>
				  <div class="form-group">
				    <input type="password" class="form-control" id="passsure" placeholder="确认密码">
				  </div><br>
		</div>
		<button type="button" id="subtu" class="btn btn-primary" style="margin-left:25%;">提交修改</button>
		<script>
			$(function(){
				$("#subtu").click(function(){
					if($("#passold").val() == ""){
						layer.msg('请输入原密码', {icon: 5});
					}else if($("#passnew").val() == ""){
						layer.msg('请输入新密码', {icon: 5});
					}else if($("#passsure").val() == ""){
						layer.msg('请输确认密码', {icon: 5});
					}else if($("#passnew").val() != $("#passsure").val()){
						layer.msg('两次密码不匹配', {icon: 5});
					}else{
						$.post("passwordEdit.do",{passold:$("#passold").val(),passnew:$("#passnew").val()},function(data,textStatus){
							if(data.status){
								layer.msg('修改成功', {icon: 1});
							}
						},"json");
					}
				});
			});
		</script>
</body>
</html>