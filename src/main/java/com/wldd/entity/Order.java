package com.wldd.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {

	String orderId;

	String owerType;// 个人还是卖家

	String owerId;

	Timestamp orderTime;// 订单下发时间

	Timestamp reciveTime;// 收货时间

	String orderEmType;// 哪种快递

	String itemType; // 物品种类

	float price;

	float orderWeight;

	String address; // 发货地址

	String destination; // 目的地

	String owerName; // 寄件人姓名

	String owerPhone; // 寄件人电话

	String reviceName; // 收件人姓名

	String revicePhone; // 收件人电话

	String status; // 状态

	String nowAddress; // 到哪里了

	String payType; // 支付方式
}
