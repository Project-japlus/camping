package com.itbank.component;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Scanner;

import org.springframework.stereotype.Component;

@Component
public class TestComponent {
	
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
		params.put("_type", "json");
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
		if (200 <= statusCode && statusCode < 300) { // 정상이면
			// 파일 객체 생성
			String _file = "D:\\free\\test\\test.json";
			
			// 파일에 작성을 위한 입출력 객체
//			FileWriter fw = new FileWriter(f);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(_file), "utf-8"));
			
			sc = new Scanner(conn.getInputStream());
			int i = 0;
			while (i == 0) {
//				bw.append(sc.nextLine());
//				bw.append("\r\n");
//				fw.append(sc.nextLine() + "\r\n");
				jsonData += sc.nextLine() + "\n";
				System.out.println(jsonData);
				i++;
			}
			bw.flush();
			bw.close();
//			fw.flush();
//			fw.close();
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
