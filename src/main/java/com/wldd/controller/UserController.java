package com.wldd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wldd.entity.MyPrice;
import com.wldd.entity.Order;
import com.wldd.entity.User;
import com.wldd.service.MyPriceService;
import com.wldd.service.OrderService;
import com.wldd.service.SellerService;
import com.wldd.service.UserService;
import com.wldd.utils.CookieUtils;
import com.wldd.utils.ObjectUtils;
import com.wldd.utils.redisUtils;

@Controller
public class UserController {

	private static Logger logger = Logger.getLogger(Logger.class);

	@Autowired
	UserService userService;

	@Autowired
	private SellerService sellerService;

	@Autowired
	private MyPriceService myPriceService;

	@Autowired
	private OrderService orderService;

	/*
	 * 用户账号信息
	 */
	@RequestMapping("/accountInfo.do")
	public String accountInfo(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		Cookie[] cookies = request.getCookies();
		String account = CookieUtils.getAccountFormCookies(cookies);

		// 判断redis中账号信息是否过期
		if (redisUtils.accountIsExits(account)) {
			return "redirect:/index";
		}

		logger.info("show user account info");
		return "userAccount";
	}

	/*
	 * 用户密码修改
	 */
	@RequestMapping("/passwordUEdit.do")
	@ResponseBody
	public Map<String, Boolean> changePassword(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String passold,
			String passnew) {
		Map<String, Boolean> reqMap = new HashMap<String, Boolean>();
		reqMap.put("status", true);
		User user = (User) session.getAttribute("User");
		if (passold.equals(user.getLoginPassword())) {
			logger.info("password oldone match success");
			user.setLoginPassword(passnew);
			// 更新session
			session.setAttribute("User", user);
			// 更新redis
			try {
				redisUtils.hset(user.getLoginName(),
						ObjectUtils.objectToMap(user));
			} catch (Exception e) {
				logger.error("updata redis error");
				reqMap.put("status", false);
			}
			// 更新数据库
			userService.updatePassword(passnew, user.getUserId());
			logger.info("更新完成");
		} else {
			logger.info("password oldone error");
			reqMap.put("status", false);
		}
		return reqMap;
	}

	/*
	 * 去创建订单
	 */
	@RequestMapping("/toSendOrderU.do")
	public String toSendOrder(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("to create a new order");
		List<MyPrice> myPrices = myPriceService.findAll();
		session.setAttribute("prices", myPrices);
		return "newOrderU";
	}

	/*
	 * 创建订单
	 */
	@RequestMapping("/createOrderU.do")
	@ResponseBody
	public Map<String, Boolean> createOrder(HttpServletRequest request,
			HttpServletResponse response, Order order, HttpSession session) {
		logger.info("order:" + order.toString());
		Map<String, Boolean> reqMap = new HashMap<String, Boolean>();
		reqMap.put("status", true);

		User user = (User) session.getAttribute("User");
		order.setOrderId(UUID.randomUUID().toString().substring(0, 8));
		order.setOwerId(user.getUserId());
		order.setOwerName(user.getUserName());
		order.setOwerPhone(user.getUserPhone());
		order.setOwerType("个人");

		orderService.createOrder(order);

		try {
			redisUtils.hset(order.getOrderId(), ObjectUtils.objectToMap(order));
		} catch (Exception e) {
			logger.error("order info put into redis error");
		}
		return reqMap;
	}

	/*
	 * 查看已完成订单
	 */
	@RequestMapping("/toCompleteOrderU.do")
	public String toCompleteOrder(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		User user = (User) session.getAttribute("User");
		logger.info("to CompleteOrder");
		List<Order> orders = orderService.findAllCompleteByUser(user
				.getUserId());
		session.setAttribute("complete", orders);
		return "CompleteOrder";
	}

	/*
	 * 查看未完成订单
	 */
	@RequestMapping("/toUnCompleteOrderU.do")
	public String toUnCompleteOrder(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		User user = (User) session.getAttribute("User");
		logger.info("to UnCompleteOrder");
		List<Order> orders = orderService.findAllUnCompleteByUser(user
				.getUserId());
		session.setAttribute("uncomplete", orders);
		return "UnCompleteOrder";
	}

}
