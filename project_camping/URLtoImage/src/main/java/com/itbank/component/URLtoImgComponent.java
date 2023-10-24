package com.itbank.component;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

@Component
public class URLtoImgComponent {

	public Map<String, String> downImg(String serviceKey) {
		String apiUrl = "https://apis.data.go.kr/B551011/GoCamping/basedList";
		String queryParams = String
				.format("?serviceKey=%s&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json", serviceKey);
		Map<String, String> parcingData = null;
		try {
			String jsonData = getJSONData(apiUrl + queryParams);
			parcingData = parcing(jsonData);
			savingImg(parcingData);
			return parcingData;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private void savingImg(Map<String, String> parcingData) throws IOException {
		String saveDirectory = "C:\\Users\\user\\OneDrive\\project\\firstImg";
		List<String> list = new ArrayList<String>(parcingData.keySet());

		for (int i = 0; i < list.size(); i++) {
			String sample = parcingData.get(list.get(i));
			if ("".equals(sample)) {
				continue;
			}

			String ext = sample.substring(sample.lastIndexOf("."));
			File f = new File(saveDirectory, list.get(i) + ext);
			if (!f.exists()) {
				f.createNewFile();
			}
			HttpURLConnection conn = (HttpURLConnection) new URL(parcingData.get(list.get(i))).openConnection();

			byte[] buf = new byte[1024];
			int b = 0;
			InputStream is = conn.getInputStream();
			FileOutputStream fos = new FileOutputStream(f);

			while ((b = is.read(buf, 0, 1024)) != -1) {
				fos.write(buf, 0, b);
			}
			fos.flush();
			fos.close();
			conn.disconnect();
		}

	}

	private Map<String, String> parcing(String jsonData) {
		Map<String, String> parcingData = new HashMap<String, String>();
		JSONObject jb = new JSONObject(jsonData);
		JSONArray itemList = jb.getJSONObject("response").getJSONObject("body").getJSONObject("items")
				.getJSONArray("item");
		for (int i = 0; i < itemList.length(); i++) {
			JSONObject item = itemList.getJSONObject(i);
			parcingData.put(item.getString("facltNm"), item.optString("firstImageUrl"));
		}
		return parcingData;
	}

	private String getJSONData(String apiUrl) throws Exception {
		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json);charset=utf-8");

		int statusCode = conn.getResponseCode();
		if (statusCode == HttpURLConnection.HTTP_OK) {
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
			throw new Exception("API 호출 실패 : " + statusCode);
		}
	}
}
