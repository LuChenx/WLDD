package com.wldd.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wldd.entity.Account;
import com.wldd.entity.Seller;
import com.wldd.entity.User;
import com.wldd.service.AccountService;
import com.wldd.service.SellerService;
import com.wldd.service.UserService;
import com.wldd.utils.CookieUtils;
import com.wldd.utils.ObjectUtils;
import com.wldd.utils.redisUtils;

/*
 * 注册
 */
@Controller
public class RegisterController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private SellerService sellerService;

	@Autowired
	private UserService userService;

	private static Logger logger = Logger.getLogger(Logger.class);

	/*
	 * @author luchenxi 跳转到卖家注册界面
	 */
	@RequestMapping("/toregister.do")
	public String toregister(HttpServletRequest request,
			HttpServletResponse response) {
		return "register";
	}

	/*
	 * 跳转到个人注册界面
	 */
	@RequestMapping("/toregisterperson.do")
	public String toregisterperson(HttpServletRequest request,
			HttpServletResponse response) {
		return "personregister";
	}

	/*
	 * @author luchenxi 卖家账号创建
	 */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request,
			HttpServletResponse response, String username, String password) {
		logger.info("create account:" + username + ",with password:" + password);
		accountService.putAccountIntoRedis(username, password);

		Cookie cookie = new Cookie("cookie_useraccount", username);
		cookie.setMaxAge(60 * 60 * 24 * 3);
		response.addCookie(cookie);
		logger.info("set useraccount into cookies");
		return "register_personinfo";
	}

	/*
	 * 个人用户账号创建
	 */
	@RequestMapping("/personregister.do")
	public String personregister(HttpServletRequest request,
			HttpServletResponse response, String username, String password) {
		logger.info("create account:" + username + ",with password:" + password);
		accountService.putAccountIntoRedis(username, password);

		Cookie cookie = new Cookie("cookie_useraccount", username);
		cookie.setMaxAge(60 * 60 * 24 * 3);
		response.addCookie(cookie);
		logger.info("set useraccount into cookies");
		return "personregister_personinfo";
	}

	/*
	 * @author luchenxi 卖家账号检测
	 */
	@RequestMapping("/accountCheck.do")
	@ResponseBody
	public HashMap<String, Boolean> accountCheck(HttpServletRequest request,
			HttpServletResponse response, String username) {
		logger.info("account check : " + username);
		HashMap<String, Boolean> checkReq = new HashMap<String, Boolean>();
		checkReq.put("check", accountService.accountCheck(username));
		return checkReq;
	}

	/*
	 * @author luchenxi 卖家信息填写
	 */
	@RequestMapping("/registerUserInfo.do")
	public String registerUserInfo(HttpServletRequest request,
			HttpServletResponse response, String name, String phone) {
		Cookie[] cookies = request.getCookies();
		String account = CookieUtils.getAccountFormCookies(cookies);
		logger.info("sellername:" + name + " ,with phone:" + phone
				+ ",account:" + account);
		accountService.putUserIntoRedis(name, phone, account);
		return "register_shopinfo";
	}

	/*
	 * @author luchenxi 个人用户信息填写
	 */
	@RequestMapping("/registerPUserInfo.do")
	public String registerPUserInfo(HttpServletRequest request,
			HttpServletResponse response, String name, String phone,
			HttpSession session) {
		Cookie[] cookies = request.getCookies();
		String account = CookieUtils.getAccountFormCookies(cookies);
		logger.info("sellername:" + name + " ,with phone:" + phone
				+ ",account:" + account);
		accountService.putPUserIntoRedis(name, phone, account);
		// 个人用户注册完成，将信息保存
		accountService.setAccount(new Account(account, "0"));
		try {
			userService.save(((User) ObjectUtils.mapToObject(
					redisUtils.hget(account, null), User.class)));
		} catch (Exception e) {
			logger.error("useraccount save to database error");
			return "redirect:/index";
		}
		// shiro 认证授权
		UsernamePasswordToken token = new UsernamePasswordToken(account + "0",
				redisUtils.hsget(account, "loginPassword"));
		token.setRememberMe(true);
		SecurityUtils.getSubject().login(token);
		try {
			session.setAttribute("user", ObjectUtils.mapToObject(
					redisUtils.hget(account, null), User.class));
			logger.info("put user into session");
		} catch (Exception e) {
			logger.error("put user into session error");
		}
		return "User";
	}

	/*
	 * @author luchenxi 网店信息填写
	 */
	@RequestMapping("/registerShopInfo.do")
	public String registerShopInfo(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Seller seller) {
		String ident = "1";
		Cookie[] cookies = request.getCookies();
		seller.setLoginName(CookieUtils.getAccountFormCookies(cookies));
		logger.info(seller.toString());
		accountService.putShopIntoRedis(seller);
		// 到此，卖家注册完成，将redis中的信息保存到数据库中。
		try {
			sellerService
					.save((Seller) ObjectUtils.mapToObject(
							redisUtils.hget(seller.getLoginName(), null),
							Seller.class));
			logger.info("save to database success!");
		} catch (Exception e) {
			logger.error("save to database error!");
		}
		// 账号信息保存进account表
		accountService.setAccount(new Account(CookieUtils
				.getAccountFormCookies(cookies), "1"));
		// 通过shrio认证后进入首页
		UsernamePasswordToken token = new UsernamePasswordToken(
				seller.getLoginName() + ident, redisUtils.hsget(
						seller.getLoginName(), "loginPassword"));
		token.setRememberMe(true);

		try {
			// shrio 认证
			SecurityUtils.getSubject().login(token);
			session.setAttribute("Seller", sellerService
					.getByLoginName(CookieUtils.getAccountFormCookies(cookies)));
		} catch (Exception e) {
			logger.error("put seller into session error");
			return "redirect:/index";
		}

		return "Seller";
	}
}
