package com.ms.diancan.shiro;

import com.ms.diancan.entity.User;
import com.ms.diancan.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AuthRealm extends AuthorizingRealm{

	@Autowired
	private UserService userService;



	@Override
	//权限认证模块
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
/*		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getSession().getAttribute("user");

		List<String> listPermission = userService.findAdminRole(user.getUserId());
		System.out.print(listPermission);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addStringPermissions(listPermission);

		return info;*/
		return null;
	}

	@Override
	//登陆认证模块
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		/*
		 * 为Shiro提供真实的用户数据
		 * 1.通过token获取用户名和密码
		 * 2.通过用户名和密码查询用户的真实的信息，真实的密码
		 * 3获取数据后通过info对象返回给shiro安全管理器
		 *
		 *
		 */
		UsernamePasswordToken logintoken = (UsernamePasswordToken) token;
		String  username = logintoken.getUsername();
		//通过用户名查询用户信息
		User user = userService.finuserByUsername(username);
		/*
		 * principal  真实用户对象(数据库中的)
		 * credentialsSalt  真实的密码(数据库中的)
		 * realm 当前realm的名称
		 */
		AuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), user.getUserName());
		return info;

	}






}
