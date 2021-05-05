package org.iiiEDU.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.junit.Test;

public class CipherHandler {
	
	@Test
	public void test01() {
		
		System.out.println(getStringSHA512("0000"));
		System.out.println(getStringSHA512("iiiEDU@08"));
		System.out.println(getStringSHA512("iiiEDU@03"));
		System.out.println(getStringSHA512("iiiEDU@05"));
		System.out.println(getStringSHA512("iiiEDU@01"));
		System.out.println(getStringSHA512("iiiEDU@04"));
		System.out.println(getStringSHA512("iiiEDU@33"));	
	}

	public static String getStringMD5(String message) {
		return getStringHash(message, "MD5");
	}

	public static String getStringSHA1(String message) {
		return getStringHash(message, "SHA1");
	}
	
	public static String getStringSHA256(String message) {
		return getStringHash(message, "SHA-256");
	}
	
	public static String getStringSHA384(String message) {
		return getStringHash(message, "SHA-384");
	}
	
	public static String getStringSHA512(String message) {
		return getStringHash(message, "SHA-512");
	}
	
	private static String getStringHash(String message, String algorithm) {
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance(algorithm);
			md.update(message.getBytes());
			byte[] digest = md.digest();

			for (int i = 0; i < digest.length; ++i) {
				byte b = digest[i];
				String s = Integer.toHexString(Byte.toUnsignedInt(b));
				s = s.length() < 2 ? "0" + s : "" + s;
				buffer.append(s);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("請檢查使用的演算法，演算法有誤");
			return null;
		}
		return buffer.toString();
	}

	public static String getFileSHA1(File file) {
		return getFileHash(file, "SHA1");
	}
	
	public static String getFileSHA512(File file) {
		return getFileHash(file, "SHA-512");
	}

	public static String getFileMD5(File file) {
		return getFileHash(file, "MD5");
	}

	private static String getFileHash(File file, String algorithm) {
		final StringBuffer buffer = new StringBuffer();
		try (
			FileInputStream fis = new FileInputStream(file);	
		){
			MessageDigest md = MessageDigest.getInstance(algorithm);
			byte[] b = new byte[8192];
			int len = 0;
			while ((len = fis.read(b)) != -1) {
				md.update(b, 0, len);
			}
			byte[] digest = md.digest();

			for (int i = 0; i < digest.length; ++i) {
				byte data = digest[i];
				String s = Integer.toHexString(Byte.toUnsignedInt(data));
				s = s.length() < 2 ? "0" + s : "" + s;
				buffer.append(s);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("請檢查使用的演算法，演算法有誤");
			return null;
		} catch (FileNotFoundException e) {
			System.out.println("檔案不存在，請檢查");
			return null;
		} 		
		catch (IOException e) {
			System.out.println("發生IO錯誤");
			return null;
		}
		return buffer.toString();
	}

}
