package com.ms.diancan.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

/**
 *
 * @Description: TODO(实现用户密码的加密)
 * @Version: V1.0
 */
public class AuthCredential extends  SimpleCredentialsMatcher{

	//重新对用户的密码进行加密
	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
//		//获取用户的用户名和密码的明文
//		UsernamePasswordToken logintoken = (UsernamePasswordToken) token;
//		String username = logintoken.getUsername();
//		String password = String.valueOf(logintoken.getPassword());//String.valueOf() 将char[]转换成字符串  [admin]
//
//		//对密码进行加密处理
//		String md5HashPassword = Md5HashPassWord.getMd5Hash(password, username);
//
//		//将加密后的密码放回到token中
//		logintoken.setPassword(md5HashPassword.toCharArray());//xxx.toCharArray()将字符串转换成char[]

		//return super.doCredentialsMatch(logintoken, info);
        return  false;
	}
}
