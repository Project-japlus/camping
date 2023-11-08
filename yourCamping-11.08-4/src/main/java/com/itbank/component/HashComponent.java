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

	public String getHash(String source, String salt) {
		String hash = null;
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");

			md.update(salt.getBytes());	
			md.update(source.getBytes());
			hash = String.format("%0128X", new BigInteger(1, md.digest()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return hash;
	}
}