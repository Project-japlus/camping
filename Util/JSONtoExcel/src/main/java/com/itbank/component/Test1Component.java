package com.itbank.component;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@Component
public class Test1Component {

    public void convertCampingDataToExcel(String serviceKey, String filePath) {
        try {
            String apiUrl = "https://apis.data.go.kr/B551011/GoCamping/basedList";
            String queryParams = String.format("?serviceKey=%s&numOfRows=200&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json", serviceKey);
            
            String jsonData = getJSONData(apiUrl + queryParams);
            saveJSONToExcel(jsonData, filePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private String getJSONData(String apiUrl) throws Exception {
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            StringBuilder response = new StringBuilder();
            try (java.io.BufferedReader in = new java.io.BufferedReader(
                    new java.io.InputStreamReader(connection.getInputStream(), "UTF-8"))) {
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
            }
            return response.toString();
        } else {
            throw new Exception("API 호출 실패: " + responseCode);
        }
    }
    
    private void saveJSONToExcel(String jsonData, String filePath) throws Exception {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Camping Data");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("camping_idx");
        
        // camping 테이블 필요 컬럼들
        String[] camping = { "facltNm", "featureNm", "intro", "lineIntro", "tooltip", "induty", "tel", "homepage", "lctCl", "addr1" };
        // 전체 반복을 돌리기위한 len 변수. 배열이 하나 생성될 때마다 배열의 길이를 더한다
        int len = camping.length;
        
        // camping_introduce 테이블
        String[] camping_introduce = { "caravAcmpnyAt", "trlerAcmpnyAt", "operPdCl", "operDeCl", "themaEnvrnCl", "manageSttus", "eqpmnLendCl", "animalCmgCl", "siteBottomCl1", "siteBottomCl2", "siteBottomCl3", "siteBottomCl4", "siteBottomCl5" };
        len += camping_introduce.length;
        int A = camping.length + camping_introduce.length;
        
        // camping_site 테이블
        String[] camping_site = { "siteMg1Co", "siteMg2Co", "siteMg3Co" };
        len += camping_site.length;
        int B = A + camping_site.length;
        
        // camping_internal
        String[] camping_internal = { "sbrsCl", "sbrsEtc", "toiletCo", "swrmCo", "glampInnerFclty", "caravInnerFclty" };
        len += camping_internal.length;
        int C = B + camping_internal.length;
        
        // camping_activity
        String[] camping_activity = { "posblFcltyCl", "posblFcltyEtc", "exprnProgrmAt", "exprnProgrm", "direction" };
        len += camping_activity.length;
        int D = C + camping_activity.length;
        
        // camping_place
        String[] camping_place = { "mapX", "mapY"};
        len += camping_place.length;
        int E = D + camping_place.length;
        
        // camping_safety_device
        String[] camping_safety_device = { "extshrCo", "frprvtWrppCo", "frprvtSandCo", "fireSensorCo" };
        len += camping_safety_device.length;
        int F = E + camping_safety_device.length;
        
        // API에서 끌어오는게 아닌 직접 생성해야 하는 컬럼
        String[] our_create = { "camping_viewCount", "siteMg1_price", "siteMg2_price", "siteMg3_price" };
        len += our_create.length;
        
        int index = 0;
        for(int i = 0; i < len; i++) {
        	if(i < camping.length) {
        		headerRow.createCell(i + 1).setCellValue(camping[index]);
        	} else if (i < A) {	// A = 10 + 13	인덱스는 0~9, 0~12 / index에서 이전 길이를 빼줌으로써 index를 0으로 전환한다
        		int tmp = index - camping.length;
        		headerRow.createCell(i + 1).setCellValue(camping_introduce[tmp]);
        	} else if (i < B) {	// B = 10 + 13 + 3
        		int tmp = index - A;
        		headerRow.createCell(i + 1).setCellValue(camping_site[tmp]);
        	} else if (i < C) {	// C = 10 + 13 + 3 + 6
        		int tmp = index - B;
        		headerRow.createCell(i + 1).setCellValue(camping_internal[tmp]);
        	} else if (i < D) {	// D = 10 + 13 + 3 + 6 + 5
        		int tmp = index - C;
        		headerRow.createCell(i + 1).setCellValue(camping_activity[tmp]);
        	} else if (i < E) {	// E = 10 + 13 + 3 + 6 + 5 + 2
        		int tmp = index - D;
        		headerRow.createCell(i + 1).setCellValue(camping_place[tmp]);
        	} else if (i < F) {	// F = 10 + 13 + 3 + 6 + 5 + 4 + 4
        		int tmp = index - E;
        		headerRow.createCell(i + 1).setCellValue(camping_safety_device[tmp]);
        	} else {
        		int tmp = index - F;
        		headerRow.createCell(i + 1).setCellValue(our_create[tmp]);
        	}
        	index++;
        }
        headerRow.createCell(++index).setCellValue("firstImageUrl");
        headerRow.createCell(++index).setCellValue("bizrno");
        
        JSONObject jsonObject = new JSONObject(jsonData);
        JSONArray itemList = jsonObject.getJSONObject("response").getJSONObject("body")
                .getJSONObject("items").getJSONArray("item");
        
        int x = 1;
        for (int i = 0; i < itemList.length(); i++) {
            JSONObject item = itemList.getJSONObject(i);
            if (!item.getString("firstImageUrl").equals("") && !item.getString("lctCl").equals("")) {
            	Row row = sheet.createRow(x);
            	row.createCell(0).setCellValue(x);
            	index = 0;
            	for(int j = 0; j < F; j++) {
            		if(j < camping.length) {
            			row.createCell(j + 1).setCellValue(item.getString(camping[index]));
            		} else if (j < A){
            			int tmp = index - camping.length;
            			row.createCell(j + 1).setCellValue(item.getString(camping_introduce[tmp]));
            		} else if (j < B){
            			int tmp = index - A;
            			row.createCell(j + 1).setCellValue(item.getString(camping_site[tmp]));
            		} else if (j < C){
            			int tmp = index - B;
            			row.createCell(j + 1).setCellValue(item.getString(camping_internal[tmp]));
            		} else if (j < D){
            			int tmp = index - C;
            			row.createCell(j + 1).setCellValue(item.getString(camping_activity[tmp]));
            		} else if (j < E){
            			int tmp = index - D;
            			row.createCell(j + 1).setCellValue(item.getString(camping_place[tmp]));
            		} else {
            			int tmp = index - E;
            			row.createCell(j + 1).setCellValue(item.getString(camping_safety_device[tmp]));
            		} 
            		index++;
            	}
            	for (int j = 0; j < our_create.length; j++) {
            		if (j == 0) {
            			row.createCell(++index).setCellValue(0);
            		} else {
            			row.createCell(++index).setCellValue(50000);
            		}
            	}
            	
            	row.createCell(++index).setCellValue(item.getString("firstImageUrl"));
            	row.createCell(++index).setCellValue(item.getString("bizrno"));
            	x++;
            }
            
        }
        try (OutputStream outputStream = new FileOutputStream(filePath)) {
            workbook.write(outputStream);
            workbook.close();
        }
    }
}
