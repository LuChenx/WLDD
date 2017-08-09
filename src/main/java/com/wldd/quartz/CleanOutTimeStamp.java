package com.wldd.quartz;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wldd.utils.redisUtils;

public class CleanOutTimeStamp {

	private static Logger logger = Logger.getLogger(Logger.class);

	public void runJob() {
		logger.info("Quartz job is running");
		redisUtils.clean();

		// 将订单分配到指定的快递点

	}

	public static void main(String[] args) {
		logger.info("get quartz xml");
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:spring/spring-quartz.xml");
		logger.info(context);
	}
}
