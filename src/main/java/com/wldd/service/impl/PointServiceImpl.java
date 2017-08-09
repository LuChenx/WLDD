package com.wldd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wldd.dao.PointDao;
import com.wldd.entity.MyPoint;
import com.wldd.service.PointService;

@Service("pointService")
public class PointServiceImpl implements PointService {

	@Autowired
	PointDao pointDao;

	public void save(MyPoint myPoint) {
		pointDao.save(myPoint);
	}

	public void delete(String pointId) {
		pointDao.delete(pointId);
	}

	public List<MyPoint> findAll() {
		return pointDao.findAll();
	}

}
