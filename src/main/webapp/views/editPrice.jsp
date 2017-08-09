<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>价格编辑</title>
</head>
<style>
	table tr{
		border:2px solid #FFFFFF;
	}
	table td{
		empty-cells:show;
		text-align: center;
	}
	table th{
		text-align: center;
		font-family: 微软雅黑;
	}
	.price{
		border-style:none;
		background-color: #2d2c41;
		color:#FFFFFF;
		font-size: 20px;
		width: 100%;
		text-align: center;
	}
}
</style>
<body style="background: #2d2c41;" >
	<form action="<%=basePath%>savePrice.do" method="post">
	<table class="table" style="border-collapse:collapse;" border="1">
  		<caption style="font-size: 35px;font-family: 华文行楷">订单价格编辑</caption>
		<thead style="color:white;font-size: 20px">
		  <tr style="text-align: center;">
		    <th rowspan="2" style="font-size: 24px;vertical-align:middle;">地区</th>
		    <th colspan="2">EMS</th>
		    <th colspan="2">天天</th>
		    <th colspan="2">顺丰</th>
		    <th colspan="2">韵达</th>
		    <th colspan="2">圆通</th>
		  </tr>
		  <tr>
		  	<th>首重</th>
		  	<th>续重</th>
		  	<th>首重</th>
		  	<th>续重</th>
		  	<th>首重</th>
		  	<th>续重</th>
		  	<th>首重</th>
		  	<th>续重</th>
		  	<th>首重</th>
		  	<th>续重</th>
		  </tr>
		</thead>
	  <tbody style="color:AAAAAA;">
		<tr>
			<th>
				广东省内
			</th>
			<td><input class="price" value="${prices.get(0).eprice1}" type="number" name="myPrice[0].eprice1" required/></td>
			<td><input class="price" value="${prices.get(0).epricex1}" type="number" name="myPrice[0].epricex1"required/></td>
			<td><input class="price" value="${prices.get(1).eprice1}" type="number" name="myPrice[1].eprice1" required/></td>
			<td><input class="price" value="${prices.get(1).epricex1}" type="number" name="myPrice[1].epricex1" required/></td>
			<td><input class="price" value="${prices.get(2).eprice1}" type="number" name="myPrice[2].eprice1" required/></td>
			<td><input class="price" value="${prices.get(2).epricex1}" type="number" name="myPrice[2].epricex1" required/></td>
			<td><input class="price" value="${prices.get(3).eprice1}" type="number" name="myPrice[3].eprice1" required/></td>
			<td><input class="price" value="${prices.get(3).epricex1}" type="number" name="myPrice[3].epricex1" required/></td>
			<td><input class="price" value="${prices.get(4).eprice1}" type="number" name="myPrice[4].eprice1" required/></td>
			<td><input class="price" value="${prices.get(4).epricex1}" type="number" name="myPrice[4].epricex1" required/></td>
		</tr>
		<tr>
			<th>
				江苏、浙江、上海、北京、福建
			</th>
			<td><input class="price" value="${prices.get(0).eprice2}" type="number" name="myPrice[0].eprice2" required/></td>
			<td><input class="price" value="${prices.get(0).epricex2}" type="number" name="myPrice[0].epricex2"required/></td>
			<td><input class="price" value="${prices.get(1).eprice2}" type="number" name="myPrice[1].eprice2" required/></td>
			<td><input class="price" value="${prices.get(1).epricex2}" type="number" name="myPrice[1].epricex2" required/></td>
			<td><input class="price" value="${prices.get(2).eprice2}" type="number" name="myPrice[2].eprice2" required/></td>
			<td><input class="price" value="${prices.get(2).epricex2}" type="number" name="myPrice[2].epricex2" required/></td>
			<td><input class="price" value="${prices.get(3).eprice2}" type="number" name="myPrice[3].eprice2" required/></td>
			<td><input class="price" value="${prices.get(3).epricex2}" type="number" name="myPrice[3].epricex2" required/></td>
			<td><input class="price" value="${prices.get(4).eprice2}" type="number" name="myPrice[4].eprice2" required/></td>
			<td><input class="price" value="${prices.get(4).epricex2}" type="number" name="myPrice[4].epricex2" required/></td>
		</tr>
		<tr>
			<th>
				天津、重庆、安徽、广西、贵州、海南、湖北、湖南、江西、山东、山西、陕西、云南
			</th>
			<td><input class="price" value="${prices.get(0).eprice3}" type="number" name="myPrice[0].eprice3" required/></td>
			<td><input class="price" value="${prices.get(0).epricex3}" type="number" name="myPrice[0].epricex3"required/></td>
			<td><input class="price" value="${prices.get(1).eprice3}" type="number" name="myPrice[1].eprice3" required/></td>
			<td><input class="price" value="${prices.get(1).epricex3}" type="number" name="myPrice[1].epricex3" required/></td>
			<td><input class="price" value="${prices.get(2).eprice3}" type="number" name="myPrice[2].eprice3" required/></td>
			<td><input class="price" value="${prices.get(2).epricex3}" type="number" name="myPrice[2].epricex3" required/></td>
			<td><input class="price" value="${prices.get(3).eprice3}" type="number" name="myPrice[3].eprice3" required/></td>
			<td><input class="price" value="${prices.get(3).epricex3}" type="number" name="myPrice[3].epricex3" required/></td>
			<td><input class="price" value="${prices.get(4).eprice3}" type="number" name="myPrice[4].eprice3" required/></td>
			<td><input class="price" value="${prices.get(4).epricex3}" type="number" name="myPrice[4].epricex3" required/></td>
		</tr>
		<tr>
			<th>
				四川、河北、河南
			</th>
			<td><input class="price" value="${prices.get(0).eprice4}" type="number" name="myPrice[0].eprice4" required/></td>
			<td><input class="price" value="${prices.get(0).epricex4}" type="number" name="myPrice[0].epricex4"required/></td>
			<td><input class="price" value="${prices.get(1).eprice4}" type="number" name="myPrice[1].eprice4" required/></td>
			<td><input class="price" value="${prices.get(1).epricex4}" type="number" name="myPrice[1].epricex4" required/></td>
			<td><input class="price" value="${prices.get(2).eprice4}" type="number" name="myPrice[2].eprice4" required/></td>
			<td><input class="price" value="${prices.get(2).epricex4}" type="number" name="myPrice[2].epricex4" required/></td>
			<td><input class="price" value="${prices.get(3).eprice4}" type="number" name="myPrice[3].eprice4" required/></td>
			<td><input class="price" value="${prices.get(3).epricex4}" type="number" name="myPrice[3].epricex4" required/></td>
			<td><input class="price" value="${prices.get(4).eprice4}" type="number" name="myPrice[4].eprice4" required/></td>
			<td><input class="price" value="${prices.get(4).epricex4}" type="number" name="myPrice[4].epricex4" required/></td>
		</tr>
		<tr>
			<th>
				甘肃、黑龙江、吉林、辽宁、内蒙古、宁夏、青海、西藏、新疆
			</th>
			<td><input class="price" value="${prices.get(0).eprice5}" type="number" name="myPrice[0].eprice5" required/></td>
			<td><input class="price" value="${prices.get(0).epricex5}" type="number" name="myPrice[0].epricex5"required/></td>
			<td><input class="price" value="${prices.get(1).eprice5}" type="number" name="myPrice[1].eprice5" required/></td>
			<td><input class="price" value="${prices.get(1).epricex5}" type="number" name="myPrice[1].epricex5" required/></td>
			<td><input class="price" value="${prices.get(2).eprice5}" type="number" name="myPrice[2].eprice5" required/></td>
			<td><input class="price" value="${prices.get(2).epricex5}" type="number" name="myPrice[2].epricex5" required/></td>
			<td><input class="price" value="${prices.get(3).eprice5}" type="number" name="myPrice[3].eprice5" required/></td>
			<td><input class="price" value="${prices.get(3).epricex5}" type="number" name="myPrice[3].epricex5" required/></td>
			<td><input class="price" value="${prices.get(4).eprice5}" type="number" name="myPrice[4].eprice5" required/></td>
			<td><input class="price" value="${prices.get(4).epricex5}" type="number" name="myPrice[4].epricex5" required/></td>
		</tr>
		<tr>
			<th>
				香港、澳门、台湾
			</th>
			<td><input class="price" value="${prices.get(0).eprice6}" type="number" name="myPrice[0].eprice6" required/></td>
			<td><input class="price" value="${prices.get(0).epricex6}" type="number" name="myPrice[0].epricex6"required/></td>
			<td><input class="price" value="${prices.get(1).eprice6}" type="number" name="myPrice[1].eprice6" required/></td>
			<td><input class="price" value="${prices.get(1).epricex6}" type="number" name="myPrice[1].epricex6" required/></td>
			<td><input class="price" value="${prices.get(2).eprice6}" type="number" name="myPrice[2].eprice6" required/></td>
			<td><input class="price" value="${prices.get(2).epricex6}" type="number" name="myPrice[2].epricex6" required/></td>
			<td><input class="price" value="${prices.get(3).eprice6}" type="number" name="myPrice[3].eprice6" required/></td>
			<td><input class="price" value="${prices.get(3).epricex6}" type="number" name="myPrice[3].epricex6" required/></td>
			<td><input class="price" value="${prices.get(4).eprice6}" type="number" name="myPrice[4].eprice6" required/></td>
			<td><input class="price" value="${prices.get(4).epricex6}" type="number" name="myPrice[4].epricex6" required/></td>
		</tr>
	  </tbody>
	</table>
	<input value="EMS" type="hidden" name="myPrice[0].ename"/>
	<input value="EMS" type="hidden" name="myPrice[0].eid"/>
	<input value="天天" type="hidden" name="myPrice[1].ename"/>
	<input value="TT" type="hidden" name="myPrice[1].eid"/>
	<input value="顺丰" type="hidden" name="myPrice[2].ename"/>
	<input value="SF" type="hidden" name="myPrice[2].eid"/>
	<input value="韵达" type="hidden" name="myPrice[3].ename"/>
	<input value="YD" type="hidden" name="myPrice[3].eid"/>
	<input value="圆通" type="hidden" name="myPrice[4].ename"/>
	<input value="YT" type="hidden" name="myPrice[4].eid"/>
	<button type="submit" class="btn btn-primary" style="float: right;margin-right: 0px">保存</button>
	</form>
</body>
</html>