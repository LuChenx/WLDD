package com.wldd.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wldd.dao.SellerDao;
import com.wldd.entity.Seller;
import com.wldd.service.SellerService;

@Service("sellerService")
public class SellerServiceImpl implements SellerService {

	private static Logger logger = Logger.getLogger(Logger.class);

	@Autowired
	SellerDao sellerDao;

	public Integer save(Seller seller) {
		seller.setAccountCreateTime(new Timestamp(System.currentTimeMillis()));
		logger.info(seller.toString());
		return sellerDao.save(seller);
	}

	public Boolean findByLoginName(String loginName) {
		List<Seller> sellers = new ArrayList<Seller>();
		sellers = sellerDao.findByLoginName(loginName);
		if (CollectionUtils.isEmpty(sellers)) {
			logger.info("this loginName is not exits in database");
			return true;
		} else {
			logger.info("this loginName is exits in database");
			return false;
		}
	}

	public List<Seller> findAll() {
		return sellerDao.findAll();
	}

	public Boolean login(String loginName, String loginPassword) {
		List<Seller> sellers = new ArrayList<Seller>();
		sellers = sellerDao.findByLoginInfo(loginName, loginPassword);
		if (CollectionUtils.isEmpty(sellers)) {
			logger.info("this loginName is not exits in database");
			return false;
		} else {
			logger.info("this loginName is exits in database");
			return true;
		}
	}

	public Seller getByLoginName(String loginName) {
		Seller seller = new Seller();
		try {
			seller = sellerDao.findByLoginName(loginName).get(0);
		} catch (Exception e) {
			logger.info("account not found");
			return null;
		}

		return seller;
	}

	public void updatePassword(String password, String sellerId) {
		sellerDao.updatePassword(password, sellerId);
	}

	public List<Seller> findNoStatus() {
		return sellerDao.findNoStatus();
	}

	public void setSellerPass(String sellerId) {
		sellerDao.setSellerPass(sellerId);
	}

	public void setSellerNotPass(String sellerId) {
		sellerDao.setSellerNotPass(sellerId);
	}
}
