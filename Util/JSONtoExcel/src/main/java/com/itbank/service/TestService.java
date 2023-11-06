package com.itbank.service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.TestComponent;

@Service
public class TestService {

	@Autowired
	private TestComponent testComponent;

	private String serviceKey = "3UOa%2Bm18t4tgk4tkEt2cgwKPyD1cRds2kIJKrLP8u6W845dgWraqNvugbLwBQf6dKOXLEQj6qnREK4GJzAming%3D%3D";

	public String getJsonString() throws IOException {
		String jsonData = "";

		// 주소 및 파라미터 지정
		String urlString = "https://apis.data.go.kr/B551011/GoCamping/basedList";
		urlString += "?";

		HashMap<String, String> params = new HashMap<>();
		params.put("serviceKey", serviceKey);
		params.put("pageNo", "1");
		params.put("numOfRows", "10");
		params.put("resultType", "json");
		params.put("MobileOS", "ETC");
		params.put("MobileApp", "AppTest");

		for (String key : params.keySet()) {
			String value = params.get(key);
			urlString += key + "=" + value + "&";
		}
		System.out.println(urlString);

		// 2) Http 연결
		URL url = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json;charset=utf-8");

		int statusCode = conn.getResponseCode(); // 200, 301, 404, 500 ...

		Scanner sc = null;
		String saveDirectory = "D:\\free\\test";
		File f = null;
		if (200 <= statusCode && statusCode < 300) { // 정상이면
			// 파일 객체 생성
			f = new File(saveDirectory, "test.csv");
			// 만약 없으면 해당 위치에 파일 생성
			if (!f.exists() ) {
				f.createNewFile();
			}
			// 파일에 작성을 위한 입출력 객체
			FileWriter fw = new FileWriter(f);
			
			sc = new Scanner(conn.getInputStream());
			while (sc.hasNextLine()) {
				fw.append(sc.nextLine() + "\r\n");
//				jsonData += sc.nextLine() + "\r\n";
				fw.flush();
				fw.close();
			}
		} else { // 정상이 아니면
			sc = new Scanner(conn.getErrorStream());
			while (sc.hasNextLine()) {
				System.err.println(sc.nextLine());
			}
		}
		conn.disconnect(); // 백엔드에서 열었던 http연결을 닫는다
		sc.close();

		return jsonData;
	}
}
