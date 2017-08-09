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
import com.wldd.entity.Seller;
import com.wldd.service.MyPriceService;
import com.wldd.service.OrderService;
import com.wldd.service.SellerService;
import com.wldd.utils.CookieUtils;
import com.wldd.utils.ObjectUtils;
import com.wldd.utils.redisUtils;

/*
 * 卖家相关服务，由于本人懒癌犯了，所以所有功能都写在一个controller里面了。
 */
@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;

	@Autowired
	private MyPriceService myPriceService;

	@Autowired
	private OrderService orderService;

	private static Logger logger = Logger.getLogger(Logger.class);

	/*
	 * 账号审核进度
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping("/accountExamine.do")
	public String accountExamine(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		Cookie[] cookies = request.getCookies();
		String account = CookieUtils.getAccountFormCookies(cookies);

		// 判断redis中账号信息是否过期
		if (redisUtils.accountIsExits(account)) {
			return "redirect:/index";
		}

		logger.info("seller:" + session.getAttribute("Seller").toString());
		return "accountExamine";
	}

	/*
	 * 密码修改
	 */
	@RequestMapping("/tochangePassword.do")
	public String tochangePassword(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		Cookie[] cookies = request.getCookies();
		String account = CookieUtils.getAccountFormCookies(cookies);

		// 判断redis中账号信息是否过期
		if (redisUtils.accountIsExits(account)) {
			return "redirect:/index";
		}

		logger.info("seller:" + session.getAttribute("Seller").toString());
		return "passwordEdit";
	}

	@RequestMapping("/passwordEdit.do")
	@ResponseBody
	public Map<String, Boolean> changePassword(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String passold,
			String passnew) {
		Map<String, Boolean> reqMap = new HashMap<String, Boolean>();
		reqMap.put("status", true);
		Seller seller = (Seller) session.getAttribute("Seller");
		if (passold.equals(seller.getLoginPassword())) {
			logger.info("password oldone match success");
			seller.setLoginPassword(passnew);
			// 更新session
			session.setAttribute("Seller", seller);
			// 更新redis
			try {
				redisUtils.hset(seller.getLoginName(),
						ObjectUtils.objectToMap(seller));
			} catch (Exception e) {
				logger.error("updata redis error");
				reqMap.put("status", false);
			}
			// 更新数据库
			sellerService.updatePassword(passnew, seller.getSellerId());
			logger.info("更新完成");
		} else {
			logger.info("password oldone error");
			reqMap.put("status", false);
		}
		return reqMap;
	}

	/*
	 * 我的网店
	 */
	@RequestMapping("/myShop.do")
	public String myShop(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("show my shop info");
		return "showMyShop";
	}

	/*
	 * 有的没的，就是一些展示，充实内容
	 */
	@RequestMapping("/showMap.do")
	public String showMap(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("show china map");
		return "map";
	}

	/*
	 * 公司简介
	 */
	@RequestMapping("/showWang.do")
	public String showWang(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("show Wang info");
		return "showWang";
	}

	/*
	 * 价格相关
	 */
	@RequestMapping("/showPrice.do")
	public String showPrice(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("show Price info");
		List<MyPrice> myPrices = myPriceService.findAll();
		session.setAttribute("prices", myPrices);
		return "showPrice";
	}

	/*
	 * 去创建订单
	 */
	@RequestMapping("/toSendOrder.do")
	public String toSendOrder(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		logger.info("to create a new order");
		List<MyPrice> myPrices = myPriceService.findAll();
		session.setAttribute("prices", myPrices);
		return "newOrder";
	}

	/*
	 * 创建订单
	 */
	@RequestMapping("/createOrder.do")
	@ResponseBody
	public Map<String, Boolean> createOrder(HttpServletRequest request,
			HttpServletResponse response, Order order, HttpSession session) {
		logger.info("order:" + order.toString());
		Map<String, Boolean> reqMap = new HashMap<String, Boolean>();
		reqMap.put("status", true);

		Seller seller = (Seller) session.getAttribute("Seller");
		order.setOrderId(UUID.randomUUID().toString().substring(0, 8));
		order.setAddress(seller.getShopAddress());
		order.setOwerId(seller.getSellerId());
		order.setOwerName(seller.getShopName());
		order.setOwerPhone(seller.getSellerPhone());
		order.setOwerType("卖家");

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
	@RequestMapping("/toCompleteOrder.do")
	public String toCompleteOrder(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		Seller seller = (Seller) session.getAttribute("Seller");
		logger.info("to CompleteOrder");
		List<Order> orders = orderService.findAllCompleteByUser(seller
				.getSellerId());
		session.setAttribute("complete", orders);
		return "CompleteOrder";
	}

	/*
	 * 查看未完成订单
	 */
	@RequestMapping("/toUnCompleteOrder.do")
	public String toUnCompleteOrder(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		Seller seller = (Seller) session.getAttribute("Seller");
		logger.info("to UnCompleteOrder");
		List<Order> orders = orderService.findAllUnCompleteByUser(seller
				.getSellerId());
		session.setAttribute("uncomplete", orders);
		return "UnCompleteOrder";
	}

	/*
	 * 查看订单详情
	 */
	@RequestMapping("/showOrderDetail.do")
	public String showOrderDetail(HttpServletRequest request,
			HttpServletResponse response, String orderId) {
		Order order = orderService.findById(orderId);
		logger.info(order.toString());
		request.setAttribute("order", order);
		return "orderDetail";
	}
}
