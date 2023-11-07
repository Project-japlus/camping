package com.itbank.component;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itbank.model.LatLngDTO;
import com.itbank.repository.CampingDAO;
import com.itbank.util.DataType;

@Component
public class WeatherComponent {

	@Autowired private CampingDAO campingDAO;
	
	private String serviceKey = "QxR1rPiyyvLn78S6brSBcNjAWwYW73QU7hvslatKryTcXFLm5DbGyUhYCDcgK%2BxutbBkSzYIn%2BeaS3XzzjBf1g%3D%3D";
	
	public String getStringMid(int camping_idx) throws IOException {
		return getStringMid(DataType.JSON, camping_idx);
	}
	
	public String getStringMid(DataType dataType, int camping_idx) throws IOException {
		String jsonData = "";
		String regId = "";
		String code = campingDAO.selectAreaCode(camping_idx);
		if (code.startsWith("11B")) {
			regId = "11B00000";
		} else if (code.startsWith("11D1")) {
			regId = "11D10000";
		} else if (code.startsWith("11D2")) {
			regId = "11D20000";
		} else if (code.startsWith("11C1")) {
			regId = "11C10000";
		} else if (code.startsWith("11C2")) {
			regId = "11C20000";
		} else if (code.startsWith("11F1")) {
			regId = "11F10000";
		} else if (code.startsWith("11F2")) {
			regId = "11F20000";
		} else if (code.startsWith("11H1")) {
			regId = "11H10000";
		} else if (code.startsWith("11H2")) {
			regId = "11H20000";
		} else if (code.startsWith("11G")) {
			regId = "11G00000";
		}
		LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		String date = "";
		String time = "0600";
		if (now.getHour() >= 6) {
			date = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		}
		else {
			date = now.minusDays(1).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		}
		
		// 1) 주소 및 파라미터 지정
		String urlString = "https://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst";
		urlString += "?";
			
		HashMap<String, String> params = new HashMap<>();
		params.put("serviceKey", serviceKey);
		params.put("pageNo", "1");
		params.put("numOfRows", "10");
		params.put("dataType", dataType.getDataType());
		params.put("regId", regId);
		params.put("tmFc", date + time);
		
		for (String key : params.keySet()) {
			String value = params.get(key);
			urlString += key + "=" + value + "&";
		}
		
		// 2) Http 연결 만들기
		URL url = new URL(urlString);	// throws IOException
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json;charset=utf-8");
				
		int statusCode = conn.getResponseCode();	// 200, 301, 404, 500...
		Scanner sc = null;
		if (200 <= statusCode && statusCode < 300) {	// 정상이면
			sc = new Scanner(conn.getInputStream());
			while (sc.hasNextLine()) {
				jsonData += sc.nextLine() + "\r\n";
			}
		}
		else {	// 200이 아니면
			sc = new Scanner(conn.getErrorStream());
			while (sc.hasNextLine()) {
				System.err.println(sc.nextLine());
			}
		}
		conn.disconnect();
		sc.close();
		return jsonData;
	}
	
	public String getStringTemp(int camping_idx) throws IOException {
		return getStringTemp(DataType.JSON, camping_idx);
	}
	
	public String getStringTemp(DataType dataType, int camping_idx) throws IOException {
		String jsonData = "";
		String regId = campingDAO.selectAreaCode(camping_idx);
		LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		String date = "";
		String time = "0600";
		if (now.getHour() >= 6) {
			date = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		}
		else {
			date = now.minusDays(1).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		}
		
		// 1) 주소 및 파라미터 지정
		String urlString = "https://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa";
		urlString += "?";
						
		HashMap<String, String> params = new HashMap<>();
		params.put("serviceKey", serviceKey);
		params.put("pageNo", "1");
		params.put("numOfRows", "10");
		params.put("dataType", dataType.getDataType());
		params.put("regId", regId);
		params.put("tmFc", date + time);
				
		for (String key : params.keySet()) {
			String value = params.get(key);
			urlString += key + "=" + value + "&";
		}
		
		// 2) Http 연결 만들기
		URL url = new URL(urlString);	// throws IOException
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json;charset=utf-8");
						
		int statusCode = conn.getResponseCode();	// 200, 301, 404, 500...
		Scanner sc = null;
		if (200 <= statusCode && statusCode < 300) {	// 정상이면
			sc = new Scanner(conn.getInputStream());
			while (sc.hasNextLine()) {
				jsonData += sc.nextLine() + "\r\n";
			}
		}
		else {	// 200이 아니면
			sc = new Scanner(conn.getErrorStream());
			while (sc.hasNextLine()) {
				System.err.println(sc.nextLine());
			}
		}
		conn.disconnect();
		sc.close();
		
		return jsonData;
	}

	public String getStringShort(int camping_idx) throws IOException {
		return getStringShort(DataType.JSON, camping_idx);
	}
	
	private LatLngDTO convertGRID_GPS(double lat, double lng) {	// lat : 위도, lng : 경도
		double RE = 6371.00877; // 지구 반경(km)
	    double GRID = 5.0; // 격자 간격(km)
	    double SLAT1 = 30.0; // 투영 위도1(degree)
	    double SLAT2 = 60.0; // 투영 위도2(degree)
	    double OLON = 126.0; // 기준점 경도(degree)
	    double OLAT = 38.0; // 기준점 위도(degree)
	    double XO = 43; // 기준점 X좌표(GRID)
	    double YO = 136; // 기준점 Y좌표(GRID)

	    // LCC DFS 좌표변환 ( code : "TO_GRID"(위경도->좌표, lat_X:위도,  lng_Y:경도), "TO_GPS"(좌표->위경도,  lat_X:x, lng_Y:y) ) 

	    double DEGRAD = Math.PI / 180.0;
//	    double RADDEG = 180.0 / Math.PI;

	    double re = RE / GRID;
	    double slat1 = SLAT1 * DEGRAD;
	    double slat2 = SLAT2 * DEGRAD;
	    double olon = OLON * DEGRAD;
	    double olat = OLAT * DEGRAD;

	    double sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
	    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
	    double sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
	    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
	    double ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
	    ro = re * sf / Math.pow(ro, sn);
	    LatLngDTO rs = new LatLngDTO();

	    rs.setLat(lat);
	    rs.setLng(lng);
	    double ra = Math.tan(Math.PI * 0.25 + (lat) * DEGRAD * 0.5);
	    ra = re * sf / Math.pow(ra, sn);
	    double theta = lng * DEGRAD - olon;
	    if (theta > Math.PI) theta -= 2.0 * Math.PI;
	    if (theta < -Math.PI) theta += 2.0 * Math.PI;
	    theta *= sn;
	    double x = Math.floor(ra * Math.sin(theta) + XO + 0.5);
	    double y = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
	    rs.setX((int)x);
	    rs.setY((int)y);

	    return rs;
	}
	
	public String getStringShort(DataType dataType, int camping_idx) throws IOException {
		
		String jsonData = "";
		LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		String date = "";
		String time = "";
		if (now.getHour() >= 2) {
			date = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
			time = "0200";
		}
		else {
			date = now.minusDays(1).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
			time = "2300";
		}
		
	    LatLngDTO rs = convertGRID_GPS(campingDAO.selectMapY(camping_idx), campingDAO.selectMapX(camping_idx));
		
		String urlString = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		urlString += "?";
		
		HashMap<String, String> params = new HashMap<>();
		params.put("serviceKey", serviceKey);
		params.put("pageNo", "1");
		params.put("numOfRows", "1000");
		params.put("dataType", dataType.getDataType());
		params.put("base_date", date);
		params.put("base_time", time);
		params.put("nx", (int)rs.getX() + "");
		params.put("ny", (int)rs.getY() + "");
		
		for (String key : params.keySet()) {
			String value = params.get(key);
			urlString += key + "=" + value + "&";
		}
		
		URL url = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json;charset=utf-8");
				
		int statusCode = conn.getResponseCode();	// 200, 301, 404, 500...
		Scanner sc = null;
		if (200 <= statusCode && statusCode < 300) {	// 정상이면
			sc = new Scanner(conn.getInputStream());
			while (sc.hasNextLine()) {
				jsonData += sc.nextLine() + "\r\n";
			}
		}
		else {	// 200이 아니면
			sc = new Scanner(conn.getErrorStream());
			while (sc.hasNextLine()) {
				System.err.println(sc.nextLine());
			}
		}
		conn.disconnect();
		sc.close();
		return jsonData;
	}
}
