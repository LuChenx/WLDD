<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=basePath%>/resource/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/resource/layui/css/layui.css" type="text/css" />
<script src="<%=basePath%>/resource/js/jsAddress.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新建订单</title>
</head>
<body style="background: #2d2c41;">
	<div class="layui-collapse">
	  <div class="layui-colla-item">
	    <h2 class="layui-colla-title">寄件人信息</h2>
	    <div class="layui-colla-content layui-show">
	    	<table class="table table-striped">
				  <thead style="color:white;">
				    <tr>
				      <th>寄件人</th>
				      <th>寄件地址</th>
				      <th>联系电话</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>${Seller.shopName}</td>
				      <td>${Seller.shopAddress}</td>
				      <td>${Seller.sellerPhone}</td>
				    </tr>
				  </tbody>
			</table>
	    </div>
	  </div>
	  <div class="layui-colla-item">
	    <h2 class="layui-colla-title">订单信息</h2>
	    <div class="layui-colla-content layui-show">
	    	<table class="table table-striped">
				  <thead style="color:white;">
				    <tr>
				      <th>物品种类</th>
				      <th>邮寄方式</th>
				      <th>支付方式</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>
				      	 <select ss class="form-control" id="itemType">
				      	 	<option value="普通">普通</option>
      						<option value="生鲜水果">生鲜水果</option>
      						<option value="易碎品">易碎品</option>
      						<option value="大件">大件</option>
						    <option value="危险品">危险品</option>
   						 </select>
				      </td>
				      <td>
				      	<select  class="form-control" id="emType">
				      	 	<c:forEach var="em" items="${prices}">
				      	 		<option value="${em.ename}">${em.ename}</option>
				      	 	</c:forEach>
   						 </select>
				      </td>
				      <td>
				      	<select  class="form-control" id="payType">
				      	 	<option value="到付">到付</option>
      						<option value="揽件支付">揽件支付</option>
   						 </select>
				      </td>
				    </tr>
				  </tbody>
			</table>
	    </div>
		</div>

	  <div class="layui-colla-item">
	    <h2 class="layui-colla-title">收件人信息</h2>
	    <div class="layui-colla-content layui-show">
	    	<table class="table table-striped">
				  <thead style="color:white;">
				    <tr>
				      <th>收件人</th>
				      <th>收件地址</th>
				      <th>联系电话</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td><input type="text" class="form-control" id="name" placeholder="请输入收件人姓名"></td>
				      <td>
				      <input style="float:right;width:350px;" type="text" class="form-control" id="address" placeholder="请输入详细地址">
				      <div class="address">
                     	地址：<select id="area"></select>  
						省：<select id="cmbProvince"></select>  
						市：<select id="cmbCity"></select>  
						区：<select id="cmbArea"></select>
                     </div></td>
				      <td><input type="text" class="form-control" id="phone" placeholder="请输入收件人联系电话"></td>
				    </tr>
				  </tbody>
			</table>
	    </div>
	  </div>
	</div>
	<button type="button" class="btn btn-primary" id="createBtu" style="margin-right:10px;float: right;width: 100px">提交</button>
<script>

	addressInit('area','cmbProvince','cmbCity','cmbArea','西北地区', '北京', '市辖区', '东城区');  
	
	//注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element();
	});
	
	$(function(){
		$("#createBtu").click(function(){
			if($("#name").val() == ""){
				layer.msg('请输入收件人姓名', {icon: 5});
			}else if($("#address").val() == ""){
				layer.msg('请输入收件人详细地址', {icon: 5});
			}else if($("#phone").val() == ""){
				layer.msg('请输入收件人联系方式', {icon: 5});
			}else{
				$.post("createOrder.do",{itemType:$("#itemType").val(),orderEmType:$("#emType").val(),payType:$("#payType").val(),reviceName:$("#name").val(),
					revicePhone:$("#phone").val(),destination:$("#area").val()+"|"+$("#cmbProvince").val()+"|"+$("#cmbCity").val()+"|"+
					$("#cmbArea").val()+"|"+$("#address").val()},function(data, textStatus){
						if(data.status){
							layer.alert('成功提交订单,一个工作日内老王将会上门取件，请保持电话畅通。', {icon: 1});
						}
				},"json");
			}	
		});
	});
</script>
</body>
</html>