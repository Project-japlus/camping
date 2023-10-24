package com.itbank.component;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

@Component
public class AllImgComponent {

	public void downImg(String serviceKey) {
		System.out.println("downImg 메서드 실행");
		String apiUrl1 = "https://apis.data.go.kr/B551011/GoCamping/basedList";
		// 사진 다운받다가 멈춰서 numOfRows 100, pageNo 1로 한 번에 받으려던거 numOfRows 10, pageNo 1~10으로 여러번 돌려야할듯
		String apiUrl1Params = String.format("?serviceKey=%s&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json", serviceKey);
		Map<String, String> api1Data = null;
		try {
			// API 호출하여 데이터를 문자열 형태로 받아옴
			System.out.println("1번 api의 getJSONData 실행");
			String jsonData = getJSONData(apiUrl1 + apiUrl1Params);
			System.out.println("1번 api의 getJSONData 실행 완료");
			
			// 받아온 문자열을 "캠핑장 명" = "contentId"의 형태로 받아옴
			// 함수를 돌려쓰기 위해 받아올 컬럼명을 변수로 전달
			String col1 = "facltNm";
			String col2 = "contentId";
			System.out.println("1번 apiData의 parcing 실행");
			api1Data = parcing(jsonData, col1, col2);
			System.out.println("1번 apiData의 parcing 실행완료");
			
			// 2번 api를 호출하기 위한 파라미터 생성
			// 얘네는 공통이니까 바깥에서 생성
			HashMap<String, String> api2params = new HashMap<String, String>();
			api2params.put("serviceKey", serviceKey);
			api2params.put("numOfRows", "100");
			api2params.put("pageNo", "1");
			api2params.put("MobileOS", "ETC");
			api2params.put("MobileApp", "AppTest");
			api2params.put("_type", "json");
			
			// 2번 api에는 contentId를 전달해 줘야하므로, api1Data를 반복하면서 파라미터를 추가해줌
			System.out.println("api2번 데이터 호출 및 파싱, 저장 반복문 실행");
			for(String facltNm : api1Data.keySet()) {
				// 반복을 돌릴 때 주소 뒤에 주소가 또 붙는 것을 막기 위해 url을 반복문 안에서 생성
				String apiUrl2 = "https://apis.data.go.kr/B551011/GoCamping/imageList";
				apiUrl2 += "?";
				// 캠핑장 명으로 contnetId를 하나 꺼내서 파라미터 맵에 넣고
				api2params.put("contentId", api1Data.get(facltNm));
				
				// url 뒤에 쿼리스트링으로 붙여준다
				for(String key : api2params.keySet()) {
					String value = api2params.get(key);
					apiUrl2 += key + "=" + value + "&";
				}
				// apiUrl2에서 데이터를 문자열 형태로 받아오고
				jsonData = getJSONData(apiUrl2);
				// "contentId" = "imageUrl"의 형태로 데이터를 꺼낸다
				// 어 잠깐만 key값 중복되는데??
				// 그럼 "imageUrl" = "contentId" 순으로 받아와보자
				String col3 = "imageUrl";
				Map<String, String> api2Data = parcing(jsonData, col3, col2);
				if (api2Data != null) {
					// 캠핑장 명과 imageUrl, contentId를 파라미터로 전달
					// 캠핑장 명에 해당하는 폴더를 생성하고, imageUrl에서 확장자를 따고, UUID로 변환한 다음 이미지 저장
					savingImg(facltNm, api2Data);
				}
			}
			System.out.println("api2번 데이터 호출 및 파싱, 저장 반복문 실행 완료");
			
			
		} catch (Exception e) {
			System.err.println("downImg 예외 : " + e);
		}
	}

	private void savingImg(String facltNm, Map<String, String> api2Data) throws MalformedURLException, IOException {
		String saveDirectory = "C:\\Users\\user\\OneDrive\\project\\innerImg\\" + facltNm;
		File dir = new File(saveDirectory);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		// keySet의 값이 imageUrl, value는 contentId
		// 어차피 반복문 안이라 map의 contentId는 하나밖에 없다
		// 솔직히 contentId는 여기서 안쓴다
		// 꼬일거 생각 안해도 된다는 소리
		
		// list에는 imageUrl들이 담겨있다
		List<String> list = new ArrayList<String>(api2Data.keySet());
		
		for(int i = 0; i < list.size(); i++) {
			String sample = list.get(i);
			if ("".equals(sample)) {
				continue;
			}
			String ext = sample.substring(sample.lastIndexOf("."));
			String fileName = UUID.randomUUID().toString().replace("-", "");
			File f = new File(saveDirectory, fileName + ext);
			
			HttpURLConnection conn = (HttpURLConnection) new URL(sample).openConnection();
			
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
		
//		for(String key : api2Data.keySet()) {
//			String sample = api2Data.get(key);
//			if ("".equals(sample)) {
//				continue;
//			}
//			
//			String ext = sample.substring(sample.lastIndexOf("."));
//			String fileName = UUID.randomUUID().toString().replace("-", "");
//			File f = new File(saveDirectory, fileName + ext);
//			
//			HttpURLConnection conn = (HttpURLConnection) new URL(api2Data.get(key)).openConnection();
//			
//			byte[] buf = new byte[1024];
//			int b = 0;
//			InputStream is = conn.getInputStream();
//			FileOutputStream fos = new FileOutputStream(f);
//			
//			while ((b = is.read(buf, 0, 1024)) != -1) {
//				fos.write(buf, 0, b);
//			}
//			fos.flush();
//			fos.close();
//			conn.disconnect();
//		}
	}

	private Map<String, String> parcing(String jsonData, String col1, String col2) {
		System.out.println(jsonData);
		Map<String, String> parcingData = null;
		JSONObject jb = new JSONObject(jsonData);
//		String tmp = jb.getJSONObject("response").getJSONObject("body").getJSONObject("items").toString();
//		boolean flag = jb.isNull("item");
//		JSONObject tmp = jb.getJSONObject("response").getJSONObject("body").getJSONObject("items");
//		if (tmp.length() != 0) {
////			JSONArray itemList = tmp.getJSONObject("items").getJSONArray("item");
//			for (int i = 0; i < itemList.length(); i++) {
//				JSONObject item = itemList.getJSONObject(i);
//				parcingData.put(item.getString(col1), item.getString(col2));
//			}
//		}
//		JSONObject tmp = jb.getJSONObject("response").getJSONObject("body");
//		if (tmp.length() != 0) {
//			JSONObject items = tmp.getJSONObject("items");
//			if (items.has("item")) {	// 확인 : "item"이 있는지 확인
//				JSONArray itemList = items.getJSONArray("item");
//				for (int i = 0; i < itemList.length(); i++) {
//					JSONObject item = itemList.getJSONObject(i);
//					parcingData.put(item.getString(col1), item.getString(col2));
//				}
//			}
//		}
//		String tmp = jb.getJSONObject("response").getJSONObject("body").toString();
//		if (tmp.equals("item")) {
//			JSONArray itemList = jb.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
//			for (int i = 0; i < itemList.length(); i++) {
//				JSONObject item = itemList.getJSONObject(i);
//				parcingData.put(item.getString(col1), item.getString(col2));
//			}
//		}
		String tmp = jb.getJSONObject("response").getJSONObject("body").toString();
		if (tmp.length() - tmp.replace("item", "").length() > 4) {
			parcingData = new HashMap<String, String>();
			JSONArray itemList = jb.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
			for (int i = 0; i < itemList.length(); i++) {
				JSONObject item = itemList.getJSONObject(i);
				parcingData.put(item.getString(col1), item.getString(col2));
			}
		}
		return parcingData;
	}

	private String getJSONData(String apiUrl) throws Exception {
		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		
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
