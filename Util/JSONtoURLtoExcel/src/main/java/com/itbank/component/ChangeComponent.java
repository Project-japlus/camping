package com.itbank.component;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

@Component
public class ChangeComponent {

	public void changeURL(String serviceKey, String filePath) throws Exception {
		// 1. 1번 api에서 캠핑장 명과 contentId을 map 형태로 추출
		String apiUrl1 = "https://apis.data.go.kr/B551011/GoCamping/basedList";
		apiUrl1 += "?";
		Map<String, String> apiUrl1params = new HashMap<String, String>();
		apiUrl1params.put("serviceKey", serviceKey);
		apiUrl1params.put("numOfRows", "200");
		apiUrl1params.put("pageNo", "1");
		apiUrl1params.put("MobileOS", "ETC");
		apiUrl1params.put("MobileApp", "AppTest");
		apiUrl1params.put("_type", "json");

		for (String key : apiUrl1params.keySet()) {
			apiUrl1 += key + "=" + apiUrl1params.get(key) + "&";
		}
		Map<String, String> api1Data = null;
		System.out.println("1번 api getJSONData 실행");
		String jsonData = getJSONData(apiUrl1);
		System.out.println("1번 api getJSONData 실행 완료");
		String col1 = "contentId";
		String col2 = "facltNm";
		System.out.println("1번 api parcing 실행");
		api1Data = parcing1(jsonData, col1, col2);
		System.out.println("1번 api parcing 실행 완료");

		// 2. excel 파일 생성
		createExcel(filePath);

		// 3. 추출된 map을 사용해서 2번 api에서 url 추출 후 엑셀에 저장
		HashMap<String, String> api2params = new HashMap<String, String>();
		api2params.put("serviceKey", serviceKey);
		api2params.put("numOfRows", "100");
		api2params.put("pageNo", "1");
		api2params.put("MobileOS", "ETC");
		api2params.put("MobileApp", "AppTest");
		api2params.put("_type", "json");

		// camping_idx용, 함수가 실행되던 안되던 증가시켜야함
		int i = 1;
		int x = 1;
		System.out.println("2번 api 반복 실행");
		for (String con : api1Data.keySet()) {
			String apiUrl2 = "https://apis.data.go.kr/B551011/GoCamping/imageList";
			apiUrl2 += "?";
			api2params.put("contentId", con);

			for (String key : api2params.keySet()) {
				apiUrl2 += key + "=" + api2params.get(key) + "&";
			}
			System.out.println("2번 api getJSONData" + i + "번 실행");
			jsonData = getJSONData(apiUrl2);
			System.out.println(jsonData);
			String col3 = "imageUrl";
			Map<String, String> api2Data = parcing(jsonData, col3, col1);
			if (api2Data != null) {
				x = saveJSONToExcel(api2Data, api1Data.get(con), i, filePath, x);
			}
			i++;
		}
	}

	private void createExcel(String filePath) throws Exception {
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("inner_img");
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("camping_idx");
		headerRow.createCell(1).setCellValue("facltNm");
		headerRow.createCell(2).setCellValue("inner_img");

		try (OutputStream output = new FileOutputStream(filePath)) {
			workbook.write(output);
			workbook.close();
		}
	}

	private int saveJSONToExcel(Map<String, String> api2Data, String facltNm, int i, String filePath, int x)
			throws FileNotFoundException, IOException {
		FileInputStream inputStream = new FileInputStream(filePath);
		Workbook workbook = new XSSFWorkbook(inputStream);
		Sheet sheet = workbook.getSheet("inner_img");
		for (String url : api2Data.keySet()) {
			Row row = sheet.createRow(x++);
			row.createCell(0).setCellValue(i);
			row.createCell(1).setCellValue(facltNm);
			row.createCell(2).setCellValue(url);
		}
		try (OutputStream output = new FileOutputStream(filePath)) {
			workbook.write(output);
			workbook.close();
		}
		return x;
	}

	private Map<String, String> parcing1(String jsonData, String col1, String col2) {
		Map<String, String> parcingData = null;
		JSONObject jb = new JSONObject(jsonData);
		String tmp = jb.getJSONObject("response").getJSONObject("body").toString();
		if (tmp.length() - tmp.replace("item", "").length() > 4) {
			parcingData = new HashMap<String, String>();
			JSONArray itemList = jb.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONArray("item");
			for (int i = 0; i < itemList.length(); i++) {
				JSONObject item = itemList.getJSONObject(i);
				if (!item.getString("firstImageUrl").equals("") && !item.getString("lctCl").equals("")) {
					parcingData.put(item.getString(col1), item.getString(col2));
				}
			}
		}
		return parcingData;
	}

	private Map<String, String> parcing(String jsonData, String col1, String col2) {
		Map<String, String> parcingData = null;
		JSONObject jb = new JSONObject(jsonData);
		String tmp = jb.getJSONObject("response").getJSONObject("body").toString();
		if (tmp.length() - tmp.replace("item", "").length() > 4) {
			parcingData = new HashMap<String, String>();
			JSONArray itemList = jb.getJSONObject("response").getJSONObject("body").getJSONObject("items")
					.getJSONArray("item");
			for (int i = 0; i < itemList.length(); i++) {
				JSONObject item = itemList.getJSONObject(i);
				parcingData.put(item.getString(col1), item.getString(col2));
			}
		}
		return parcingData;
	}

	private String getJSONData(String apiUrl1) throws Exception {
		URL url = new URL(apiUrl1);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");

		if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
			StringBuilder response = new StringBuilder();
			try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
				String inputLine;
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
			}
			conn.disconnect();
			return response.toString();
		} else {
			throw new Exception("API 호출 실패 : " + conn.getResponseCode());
		}
	}

}
