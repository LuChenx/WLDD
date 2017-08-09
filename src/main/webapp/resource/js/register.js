/**
 * 注册界面js
 * 简单的密码验证和账号唯一验证
 */
$(function(){
	$("#username").blur(function(){
		$.post("accountCheck.do", { username:$("#username").val() },
		function (data, textStatus){
			if(!data.check){
				layer.msg('账号被占用', {icon: 5});
			}
		}, "json");	
	});
	
	$("#repassword").blur(function(){
		if($("#register_password").val() != $("#repassword").val()){
			layer.msg('两次密码不匹配', {icon: 5});
		}
	});
});