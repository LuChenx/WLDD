package com.wldd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wldd.entity.Seller;
import com.wldd.service.SellerService;
import com.wldd.service.UserService;
import com.wldd.utils.LoginnameIdentUtils;

/*
 * 登入
 */
@Controller
public class UserLoginController {

	private static Logger logger = Logger.getLogger(Logger.class);

	@Autowired
	SellerService sellerService;

	@Autowired
	UserService userService;

	/*
	 * @author luchenxi 登入
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			String loginName, String password, String ident) {

		String logName = loginName;

		/*
		 * 放入新的cookie
		 */
		Cookie cookie = new Cookie("cookie_useraccount", loginName);
		cookie.setMaxAge(60 * 60 * 24 * 3);
		response.addCookie(cookie);
		logger.info("set useraccount into cookies");

		logger.info("loginName:" + loginName + "/password:" + password
				+ "/ident:" + ident);
		loginName = LoginnameIdentUtils.append(loginName, ident);
		UsernamePasswordToken token = new UsernamePasswordToken(loginName,
				password);
		token.setRememberMe(true);

		Boolean req = true;
		Map<String, Object> reqMap = new HashMap<String, Object>();
		try {
			// shrio 认证
			SecurityUtils.getSubject().login(token);

			// session
			switch (Integer.valueOf(ident)) {
			case 0:
				session.setAttribute("User",
						userService.getByLoginName(logName));
				logger.info("put user into session");
				break;
			case 1:
				session.setAttribute("Seller",
						sellerService.getByLoginName(logName));
				logger.info("put seller into session");
				break;
			case 2:
				logger.info("admin is online");
				List<Seller> sellers = sellerService.findNoStatus();
				if (!CollectionUtils.isEmpty(sellers)) {
					session.setAttribute("message", sellers.size());
				} else {
					session.setAttribute("message", 0);
				}
				break;
			case 3:
				break;
			default:
				logger.error("not find this ident");
				throw new UnknownAccountException();// 没找到帐号
			}
		} catch (Exception e) {
			req = false;
			logger.info("login fail");
		}
		reqMap.put("status", req);
		return reqMap;
	}
}
