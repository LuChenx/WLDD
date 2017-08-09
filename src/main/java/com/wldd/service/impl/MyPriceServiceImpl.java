package com.wldd.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wldd.dao.MyPriceDao;
import com.wldd.entity.MyPrice;
import com.wldd.service.MyPriceService;

@Service("myPriceService")
public class MyPriceServiceImpl implements MyPriceService {

	@Autowired
	private MyPriceDao myPriceDao;

	private static Logger logger = Logger.getLogger(Logger.class);

	public List<MyPrice> findAll() {

		return myPriceDao.findAll();
	}

	public void save(List<MyPrice> myPrices) {
		for (MyPrice price : myPrices) {
			logger.info(price.toString());
			try {
				myPriceDao.save(price);
			} catch (Exception e) {
				myPriceDao.update(price);
			}
		}
	}

}
