package com.wldd.shiro;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.wldd.entity.Seller;
import com.wldd.entity.User;
import com.wldd.service.SellerService;
import com.wldd.service.UserService;
import com.wldd.utils.LoginnameIdentUtils;
import com.wldd.utils.ObjectUtils;
import com.wldd.utils.redisUtils;

/*
 * shiro框架相关文档
 * http://www.open-open.com/doc/list/256
 * http://wiki.jikexueyuan.com/project/shiro/authentication.html 
 */
public class UserRealm extends AuthorizingRealm {

	@Autowired
	SellerService sellerService;

	@Autowired
	UserService userService;

	private static Logger logger = Logger.getLogger(Logger.class);

	/*
	 * 授权 此处只给卖家Seller做授权，审核通过的才可使用系统提供的服务
	 * 
	 * @see
	 * org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache
	 * .shiro.subject.PrincipalCollection)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		logger.info("shiro : SellerRealm is doGetAuthorizationInfo:"
				+ arg0.getPrimaryPrincipal().toString());
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		String loginName = arg0.getPrimaryPrincipal().toString();
		Seller seller = sellerService.getByLoginName(loginName);

		Set<String> permissSet = new HashSet<String>();
		permissSet.add("pass");
		logger.info("status:" + seller.getStatus());
		if (seller.getStatus().equals("正常")) {
			info.setStringPermissions(permissSet);
			logger.info("this account has pass permission");
		} else {
			logger.info("this account not pass。");
		}
		return info;
	}

	/*
	 * 登入认证
	 * 
	 * @see
	 * org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org
	 * .apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken arg0) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) arg0;
		/*
		 * 解析出登入名和身份。
		 */
		Map<String, String> userInfoMap = LoginnameIdentUtils.subString(token
				.getUsername());
		logger.info("shiro : login : " + userInfoMap.get("loginName"));

		String ident = userInfoMap.get("ident");

		/*
		 * 不同的ident对应不同的身份验证;
		 */
		String password = "";
		try {

			switch (Integer.valueOf(ident)) {
			case 0:
				User user = userService.getByLoginName(userInfoMap
						.get("loginName"));
				if (user != null) {
					SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
							userInfoMap.get("loginName"),
							user.getLoginPassword(), getName());
					redisUtils.hset(user.getLoginName(),
							ObjectUtils.objectToMap(user));
					logger.info("shiro pass.");
					return authenticationInfo;
				} else {
					logger.error("shiro error : user login");
					throw new UnknownAccountException();// 没找到帐号
				}

			case 1:
				Seller seller = sellerService.getByLoginName(userInfoMap
						.get("loginName"));
				if (seller != null) {
					SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
							userInfoMap.get("loginName"),
							seller.getLoginPassword(), getName());
					redisUtils.hset(seller.getLoginName(),
							ObjectUtils.objectToMap(seller));
					logger.info("shiro pass.");
					return authenticationInfo;
				} else {
					logger.error("shiro error : seller login");
					throw new UnknownAccountException();// 没找到帐号
				}
			case 2:
				if (userInfoMap.get("loginName").equals("wzx")) {
					SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
							userInfoMap.get("loginName"), "mlgbgblw", getName());
					logger.info("shiro pass.");
					return authenticationInfo;
				} else {
					throw new UnknownAccountException();// 没找到帐号
				}
			case 3:
				Seller seller3 = sellerService.getByLoginName(userInfoMap
						.get("loginName"));
				if (seller3 != null) {
					SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
							userInfoMap.get("loginName"),
							seller3.getLoginPassword(), getName());
					return authenticationInfo;
				} else {
					throw new UnknownAccountException();// 没找到帐号
				}

			default:
				logger.error("not find this ident");
				throw new UnknownAccountException();// 没找到帐号
			}

		} catch (Exception e) {
			logger.error("Unknown shiro error");
			throw new UnknownAccountException();// 没找到帐号
		}
	}
}
