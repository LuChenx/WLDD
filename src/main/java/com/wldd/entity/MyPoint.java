package com.wldd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPoint {
	String loginName;
	String loginPassword;

	String address;
	String userName;
	int pointId;
	String phone;
}
