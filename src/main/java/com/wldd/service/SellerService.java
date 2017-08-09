package com.wldd.service;

import java.util.List;

import com.wldd.entity.Seller;

/*
 * @author luchenxi
 */
public interface SellerService {
	Integer save(Seller seller);

	Boolean findByLoginName(String loginName);

	Seller getByLoginName(String loginName);

	Boolean login(String logiName, String loginPassword);

	void updatePassword(String password, String sellerId);

	List<Seller> findNoStatus();

	List<Seller> findAll();

	void setSellerPass(String sellerId);

	void setSellerNotPass(String sellerId);
}
