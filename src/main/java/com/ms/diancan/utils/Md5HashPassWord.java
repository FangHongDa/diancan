package com.ms.diancan.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 
 * @Description: TODO(使用Md5Hash对用户的密码进行加密)
 * @Version: V1.0
 */
public class Md5HashPassWord {
	
	/**
	 * 
	 * @Title: getMd5Hash
	 * @Description: TODO(使用Md5Hash对用户的密码进行加密)
	 * @param password   明文(密码)
	 * @param username   hashIterations
	 * @return
	 */
	public static String getMd5Hash(String password,String username) {
		//source:明文   salt   hashIterations 哈希的次数
		Md5Hash md5Hash = new Md5Hash(password, username, 3);
		return md5Hash.toString();
	}

/*	public static void main(String[] args) {
		//source:明文   salt   hashIterations 哈希的次数
		Md5Hash md5Hash = new Md5Hash("admin", "admin", 3);
		System.out.println(md5Hash);
		
		
	}*/
}
