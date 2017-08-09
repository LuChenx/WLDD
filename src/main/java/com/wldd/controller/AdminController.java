package com.wldd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wldd.common.MyPriceModel;
import com.wldd.entity.MyPoint;
import com.wldd.entity.MyPrice;
import com.wldd.entity.Order;
import com.wldd.entity.Seller;
import com.wldd.service.MyPriceService;
import com.wldd.service.OrderService;
import com.wldd.service.PointService;
import com.wldd.service.SellerService;

@Controller
public class AdminController {
	@Autowired
	private SellerService sellerService;

	@Autowired
	private MyPriceService myPriceService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private PointService pointService;

	private static Logger logger = Logger.getLogger(Logger.class);

	/*
	 * ajax刷新消息
	 */
	@RequestMapping("/refashMessage.do")
	@ResponseBody
	public Map<String, String> refashMessage(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String msg) {
		logger.info("ajax:" + msg);
		Map<String, String> reqMap = new HashMap<String, String>();
		List<Seller> sellers = sellerService.findNoStatus();
		if (!CollectionUtils.isEmpty(sellers)) {
			session.setAttribute("message", sellers.size());
			logger.info("ajax : seller review " + sellers.size());
			reqMap.put("status", String.valueOf(sellers.size()));
		} else {
			session.setAttribute("message", 0);
			logger.info("ajax : no seller");
			reqMap.put("status", "0");
		}
		return reqMap;
	}

	/*
	 * 审核账号
	 */
	@RequestMapping("/toReviewSeller.do")
	public String toReviewSeller(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("to review seller account");
		List<Seller> sellers = sellerService.findNoStatus();
		request.setAttribute("reviewseller", sellers);
		return "reviewSeller";
	}

	/*
	 * 拒绝账号
	 */
	@RequestMapping("/removerSeller.do")
	public String removerSeller(HttpServletRequest request,
			HttpServletResponse response, String sellerId) {
		logger.info("to remover seller account:" + sellerId);
		sellerService.setSellerNotPass(sellerId);
		// 刷新页面
		List<Seller> sellers = sellerService.findNoStatus();
		request.setAttribute("reviewseller", sellers);
		return "reviewSeller";
	}

	/*
	 * 通过账号
	 */
	@RequestMapping("/aggreSeller.do")
	public String aggreSeller(HttpServletRequest request,
			HttpServletResponse response, String sellerId) {
		logger.info("to aggre seller account:" + sellerId);
		sellerService.setSellerPass(sellerId);
		// 刷新页面
		List<Seller> sellers = sellerService.findNoStatus();
		request.setAttribute("reviewseller", sellers);
		return "reviewSeller";
	}

	/*
	 * 价格编辑
	 */
	@RequestMapping("/editPrice.do")
	public String editPrice(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		logger.info("show Price info");
		List<MyPrice> myPrices = myPriceService.findAll();
		session.setAttribute("prices", myPrices);

		return "editPrice";
	}

	/*
	 * 保存价格
	 */
	@RequestMapping("/savePrice.do")
	public String savePrice(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			MyPriceModel myPrice) {

		logger.info("save Price info");

		List<MyPrice> myPrices = myPrice.getMyPrice();
		myPriceService.save(myPrices);

		return "redirect:/editPrice.do";
	}

	/*
	 * 去创建快递点
	 */
	@RequestMapping("/toCreatePoint.do")
	public String toCreatePoint(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("to create point");
		return "createPoint";
	}

	/*
	 * 创建快递点
	 */
	@RequestMapping("/createPoint.do")
	public String createPoint(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, MyPoint myPoint) {
		logger.info("create point:" + myPoint.toString());
		pointService.save(myPoint);
		return "createPoint";
	}

	/*
	 * 显示所有快递点
	 */
	@RequestMapping("/showPoint.do")
	public String showPoint(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		List<MyPoint> myPoints = pointService.findAll();
		session.setAttribute("points", myPoints);
		logger.info("show all points");
		return "showPoint";
	}

	/*
	 * 查看已完成订单
	 */
	@RequestMapping("/toAdminCompleteOrder.do")
	public String toAdminCompleteOrder(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		List<Order> orders = orderService.findAllComplete();
		session.setAttribute("complete", orders);
		return "CompleteOrder_Admin";
	}

	/*
	 * 查看未完成订单
	 */
	@RequestMapping("/toAdminUnCompleteOrder.do")
	public String toAdminUnCompleteOrder(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		List<Order> orders = orderService.findAllUnComplete();
		session.setAttribute("uncomplete", orders);
		return "UnCompleteOrder_Admin";
	}
}
