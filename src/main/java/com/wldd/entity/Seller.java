package com.wldd.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * @author luchenxi
 * @see itmeType 商品种类
 * @see status  账号状态（是否通过审核等等）
 * 
 * 卖家实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Seller {
	String sellerId;

	String shopName;
	String shopAddress;
	String cardYY;// 营业执照编号
	String cardJY;// 经营许可证标号

	String sellerName;
	String sellerPhone;

	String loginName;
	String loginPassword;

	String status;// 账号状态 0待审核 1正常 2被封

	Timestamp accountCreateTime;
}
