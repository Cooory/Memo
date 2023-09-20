package com.cooory.memo.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {

	// md5 암호화 기능
	// 암호화 할 문자열을 전달 받고 암호화 된 문자열을 돌려준다.
	
	public static String md5(String messege) {
		
		String resultString = "";
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			byte[] bytes = messege.getBytes();
			md.update(bytes);
			
			byte[] digest = md.digest();
			
			for(int i = 0; i < digest.length; i++) {
				// 비트 연산
				resultString += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
			return null;
		}
		
		return resultString;
	}
}
