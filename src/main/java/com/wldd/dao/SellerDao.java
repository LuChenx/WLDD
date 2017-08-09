package com.wldd.dao;

import java.util.List;

import com.wldd.entity.Seller;

public interface SellerDao {
	Integer save(Seller seller);

	List<Seller> findByLoginName(String loginName);

	List<Seller> findAll();

	List<Seller> findByLoginInfo(String loginName, String loginPassword);

	List<Seller> findNoStatus();

	void updatePassword(String password, String sellerId);

	void setSellerPass(String sellerId);

	void setSellerNotPass(String sellerId);
}
