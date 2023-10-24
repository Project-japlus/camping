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
        	// url
            String apiUrl = "https://apis.data.go.kr/B551011/GoCamping/basedList";
            // 전달하는 파라미터. 데이터를 받아올 개수를 변경하고 싶다면 numOfRows를 변경한다.
            // pageNo를 반복 돌리는 방법도 생각해봤는데, saveJSONToExcel 메서드를 변경하지 않으면 덮어쓰기 될듯
            String queryParams = String.format("?serviceKey=%s&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json", serviceKey);
            
            // JSON 데이터를 getJSONData 메서드를 통해 받아온다
            String jsonData = getJSONData(apiUrl + queryParams);
            // 받아온 jsonData와 HomeController에서 작성한 저장할 위치를 전달해서, 해당 위치에 파일을 생성하고, jsonData를 추출/변형하여 저장한다
            saveJSONToExcel(jsonData, filePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // API에서 json 데이터를 추출해서 자바 문자열로 만드는 메서드
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
    
    // json 형식의 자바 문자열과 파일 저장 위치를 전달받아서, json 데이터를 excel로 저장하는 메서드
    private void saveJSONToExcel(String jsonData, String filePath) throws Exception {
    	// workbook은 엑셀 창이라고 생각하면 될
        Workbook workbook = new XSSFWorkbook();
        // sheet는 엑셀 창 아래의 배너라고 생각하면 됨
        Sheet sheet = workbook.createSheet("Camping Data");

        // 엑셀 헤더 설정
        // 엑셀창에 행(가로줄)하나를 만든다. 만드는 가로줄 번호는 0번 => 엑셀에는 1번으로 나오지만 index라고 생각하면 0번이 맞다
        Row headerRow = sheet.createRow(0);
        
        // 만들어진 행의 0번째(A열)에 cell(네모칸)을 만들고, camping_idx라는 값을 집어넣는다
        // camping_idx는 모든 camping 테이블에서 사용
        headerRow.createCell(0).setCellValue("camping_idx");
        
        // API에서 끌어올 값들을 배열로 준비. xlsx를 sqldeveloper에 import할 때 얘네가 컬럼명이 된다
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
        
        // camping, camping_introduce, camping_site, camping_internal, camping_activity, camping_place, camping_safety_device, our_create 순
        // 배열의 index를 지정하기 위한 변수
        // len은 모든 배열의 길이이고, 반복문 안에서 index를 0으로 초기화하면 제대로 배열의 값을 지정할 수 없다
        // 그래서 생각한 방법이 index에서 이미 사용한 배열의 길이를 빼서 0으로 초기화 하는 방법
        // ex) 길이가 4인 배열(인덱스는 0~3) A와 6인 배열(인덱스는 0~5) B이 있을 때, index가 4가 되면 B로 넘어가고, index에서 A.length를 빼서 0으로 초기화시킨다
        // 여기서 사용된 A, B, C, D, E, F는 사용된 배열의 길이들을 미리 더해둔 것
        int index = 0;
        for(int i = 0; i < len; i++) {
        	if(i < camping.length) {
        		// 위에서 0번째 칸에 camping_idx를 넣었으므로, 1을 더해서 셀을 생성한다. for문의 int 값을 1로하고, i <= len으로 설정하면 그냥 i로 넣어도 된다
        		// => 근데 이러면 index값 다시 생각해야할 것 같아서 그냥 두세요 머리아픔
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
        // 이미지 url을 끌어오기 위한 컬럼
        // 인덱스와 len의 값이 같기 때문에(지금까지 삽입된 컬럼 숫자와 같기 때문에), index에 미리 1을 더하고 컬럼을 생성한다 
        headerRow.createCell(++index).setCellValue("firstImageUrl");

        // 혹시 몰라서 사업자 번호도 끌어놓을게요
        headerRow.createCell(++index).setCellValue("bizrno");
        
        
        // JSON 데이터를 엑셀에 추가
        // jsonData를 JSONObject로 만든다 => JSONArray는 배열 형태일 때만 생성이 가능하기 때문에, Object로 생성 후 Array로 다운캐스팅한다고 생각하면 됨
        JSONObject jsonObject = new JSONObject(jsonData);
        
        // jsonObject의 response 아래의 body 아래의 items 아래의 item을 끌어와서 itemList에 담는다
        // ajax할 때 json.body.items.item 이라고 생각하면 됨
        JSONArray itemList = jsonObject.getJSONObject("response").getJSONObject("body")
                .getJSONObject("items").getJSONArray("item");
        
        // itemList의 길이만큼 반복. 반복 횟수는 numOfRows에 따라 달라진다
        for (int i = 0; i < itemList.length(); i++) {
        	// JSONArray의 i번째 배열을 JSONObject로 생성
            JSONObject item = itemList.getJSONObject(i);
            
            // 엑셀에 행(가로줄) 하나를 생성한다
            // i+1인 이유는 0번째 줄에 컬럼명들을 넣었기 때문
            Row row = sheet.createRow(i + 1);
            
            // 생성된 행의 첫번째 칸(A열)에 i+1을 넣는다 => camping_idx
            row.createCell(0).setCellValue(i + 1);
            
            // 각 컬럼에 들어갈 데이터를 API에서 긁어와서 변수로 저장
            // API에서 끌어오는 데이터는 F까지만 진행한다. our_crate는 API에는 없는 데이터이기 때문
            // camping, camping_introduce, camping_site, camping_internal, camping_activity, camping_place, camping_safety_device 순
            index = 0;
            for(int j = 0; j < F; j++) {
            	if(j < camping.length) {
            		// 열에 셀을 생성하고(0번째 셀에는 camping_idx가 있기 때문에 +1 해준다), JSONObject에서 문자열을 꺼내온다.
            		// => 꺼내오는 문자열은 위에서 작성한 컬럼명과 같다
            		// 꺼내온 문자열을 셀에다가 넣어준다(setCellValue)
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
            
            // API에서 데이터를 끌어오는 작업에서 빠져나와서 our_crate 컬럼에 데이터를 삽입하는 작업을 한다
            // 위에서는 len을 통해 한번에 작업했지만, 얘네는 직접 넣어줘야함
            // 초기값은 viewCount는 0, 가격들은 50000으로 진행
            // index = len이기 때문에, index에 미리 1을 더하고 셀을 생성한다
            for (int j = 0; j < our_create.length; j++) {
            	if (j == 0) {
            		row.createCell(++index).setCellValue(0);
            	} else {
            		row.createCell(++index).setCellValue(50000);
            	}
            }
            
            row.createCell(++index).setCellValue(item.getString("firstImageUrl"));
            row.createCell(++index).setCellValue(item.getString("bizrno"));
            
            // 밑에거 대로 하다가 반복문으로 가능할 것 같아서 괜히 반복문 만들다가 밤 새게 생겼음
            // camping 테이블의 값
//            String facltNm = item.getString("facltNm");
//            String featureNm = item.getString("featureNm");
//            String intro = item.getString("intro");
//            String lineIntro = item.getString("lineIntro");
//            String tooltip = item.getString("tooltip");
//            String induty = item.getString("induty");
//            String tel = item.getString("tel");
//            String homepage = item.getString("homepage");
//            String lctCl = item.getString("lctCl");
//            String addr1 = item.getString("addr1");
//            String camping_viewCount = "0";
//            
//            // camping_site 테이블의 값
//            String siteMg1Co = item.getString("siteMg1Co");
//            String siteMg2Co = item.getString("siteMg2Co");
//            String siteMg3Co = item.getString("siteMg3Co");
//            String siteMg1_price = "50000";
//            String siteMg2_price = "50000";
//            String siteMg3_price = "50000";
//            
//            // 엑셀의 행을 하나 추가하고
//            Row row = sheet.createRow(i + 1);
//            // 생성된 행에 셀을 만들고, 셀의 값으로 위에서 생성한 변수로 지정한다
//            // camping 테이블의 셀
//            row.createCell(0).setCellValue(i);
//            row.createCell(1).setCellValue(facltNm);
//            row.createCell(2).setCellValue(featureNm);
//            row.createCell(3).setCellValue(intro);
//            row.createCell(4).setCellValue(lineIntro);
//            row.createCell(5).setCellValue(tooltip);
//            row.createCell(6).setCellValue(induty);
//            row.createCell(7).setCellValue(tel);
//            row.createCell(8).setCellValue(homepage);
//            row.createCell(9).setCellValue(lctCl);
//            row.createCell(10).setCellValue(addr1);
//            row.createCell(11).setCellValue(camping_viewCount);
//            
//            // camping_site 테이블의 셀
//            row.createCell(11).setCellValue(siteMg1Co);
//            row.createCell(12).setCellValue(siteMg2Co);
//            row.createCell(13).setCellValue(siteMg3Co);
//            row.createCell(14).setCellValue(siteMg1_price);
//            row.createCell(15).setCellValue(siteMg2_price);
//            row.createCell(16).setCellValue(siteMg3_price);
            
        }
        // 바깥으로 나가는 통로를 만드는데, 통로가 연결된 바깥이 HomeController에서 지정했던 filePath의 위치
        try (OutputStream outputStream = new FileOutputStream(filePath)) {
        	// 생성한 통로를 통해서 엑셀을 작성한다
            workbook.write(outputStream);
            // 엑셀을 닫아준다
            workbook.close();
        }
    }
}
