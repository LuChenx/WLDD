package com.wldd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	String userId;
	String loginName;
	String loginPassword;
	String userName;
	String userPhone;
}
