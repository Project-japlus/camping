package com.itbank.component;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class HashComponent {
	
	private Random random = new Random();
	private String sample = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	
	public String getRandomSalt() {
		String salt="";
		for(int i=0; i <12; i++) {
			salt += sample.charAt(random.nextInt(sample.length()));
		}
		return salt;
	}
	

	public String getSalt() {
		String salt = null;
		SecureRandom ran = new SecureRandom();
		byte[] arr = new byte[16];
		ran.nextBytes(arr);
		salt = new String(Base64.getEncoder().encode(arr));
		return salt;
	}

	public String getHash(String source, String salt) {	// 원본 문자열, salt
		String hash = null;				// 해시값을 담을 문자열
		MessageDigest md = null;		// 해시알고리즘을 처리할 객체
		try {
			md = MessageDigest.getInstance("SHA-512");	// 해시 알고리즘 : SHA-512

			// 원본 소스를 추가히기 전, salt도 같이 추가한다
			md.update(salt.getBytes());	
			md.update(source.getBytes());	// 원본 소스를 바이트형태로 추가
			hash = String.format("%0128X", new BigInteger(1, md.digest()));
			// BigInteger : primitive 타입으로 처리할 수 없는 큰 수를 처리할 때 사용, java.math 클래스 내부에 존재
			// 원본 소스를 SHA512형식을 적용한 해시로 숫자를 추출하고, 추출된 숫자를 128자리의 16진수 문자열로 만들기
			// %X : 16진수, 16진수에 사용되는 알파벳을 대문자로 생성(소문자로 하고싶으면 x를 사용)
			// 0128 : 128자리를 준비하는데, 빈자리가 있으면 0으로 채워라
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hash;
	}
}