package floatingbanner;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class MainDAO {

   static MainDTO dustDTO;
   private final static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36";

   public static MainDTO dustView() {

	   String url = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?serviceKey=bCmoAhi3OlijIFedb0McSQztB7s1AkW4KaM19P%2BGfs%2FwQ30Dk7T92JRsz92pVd%2BHBML8LzLWsYbAJ7vlLsTTfw%3D%3D&numOfRows=10&pageNo=1&stationName=%EC%84%9C%EC%B4%88%EA%B5%AC&dataTerm=DAILY&ver=1.3";      // 1. URL 선언

      dustDTO = new MainDTO();
      // 2. HTML 가져오기
      Connection conn = Jsoup.connect(url).header("Content-Type", "application/json;charset=UTF-8")
            .userAgent(USER_AGENT).method(Connection.Method.GET).ignoreContentType(true);

      Document doc = null;
      try {
         doc = conn.get();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      String[] pm10_array; // 초미세먼지를 split으로 담을 값
      String[] pm25_array; // 초미세먼지를 split으로 담을 값

      String all = doc.toString(); // 파싱한 것을 string으로 만들어!

      // 미세먼지 pm10을 문자열 분해
      pm10_array = all.split("<pm10Value>");// 좋음 0~30 보통~80 나쁨~150 매우나쁨151~
      String[] pm10_array_value = new String[6]; // 6개만 뽑자
      String pm10_state;
      for (int i = 0; i <= 1; i++) {
         pm10_array_value = pm10_array[i].split("<");

      }

      pm10_array_value[0] = pm10_array_value[0].trim();// 공백 제거

      if (pm10_array_value[0].equals("-")) {
         pm10_state = "측정 불가";
      } else if (Integer.parseInt(pm10_array_value[0]) <= 30) {
         pm10_state = "좋음";
      } else if (30 < Integer.parseInt(pm10_array_value[0]) && Integer.parseInt(pm10_array_value[0]) <= 80) {
         pm10_state = "보통";
      } else if (80 < Integer.parseInt(pm10_array_value[0]) && Integer.parseInt(pm10_array_value[0]) <= 150) {
         pm10_state = "나쁨";
      } else {
         pm10_state = "매우 나쁨";
      }
      // System.out.println(pm10_state);

      // 초미세먼지 pm25을 문자열 분해
      pm25_array = all.split("<pm25Value>");// ▷0~15(좋음) ▷16~35(보통) ▷36~75(나쁨) ▷76~(매우 나쁨)을
      String[] pm25_array_value = new String[6]; // 6개만 뽑자
      String pm25_state;
      for (int i = 0; i <= 1; i++) {
         pm25_array_value = pm25_array[i].split("<");
         String values = pm25_array_value[0];
      }
      pm25_array_value[0] = pm25_array_value[0].trim();// 공백 제거
      // System.out.println(pm25_array_value[0]);
      if (pm25_array_value[0].equals("-")) {
         pm25_state = "측정 불가";
      } else if (Integer.parseInt(pm25_array_value[0]) <= 15) {
         pm25_state = "좋음";
      } else if (15 < Integer.parseInt(pm25_array_value[0]) && Integer.parseInt(pm25_array_value[0]) <= 35) {
         pm25_state = "보통";
      } else if (35 < Integer.parseInt(pm25_array_value[0]) && Integer.parseInt(pm25_array_value[0]) <= 75) {
         pm25_state = "나쁨";
      } else {
         pm25_state = "매우 나쁨";
      }
      // System.out.println(pm25_state);

      // http://www.kma.go.kr/wid/queryDFS.jsp?gridx=37.486809&gridy=126.801890 방배
      String url_weather = "http://www.kma.go.kr/wid/queryDFS.jsp?gridx=37.486809&gridy=126.801890";
      // 1. URL 선언

      // 2. HTML 가져오기
      Connection conn_weather = Jsoup.connect(url_weather).header("Content-Type", "application/json;charset=UTF-8")
            .userAgent(USER_AGENT).method(Connection.Method.GET).ignoreContentType(true);

      Document doc_weather = null;
      try {
         doc_weather = conn_weather.get();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      String[] weather_clock_array; // 날씨 정보 시간 split으로 담을 값
      String[] weather_degree_array; // 온도를 split으로 담을 값
      String[] weather_state_array; // 날씨 정보 상태 split으로 담을 값
      String[] weather_flag_array; // 날씨 구름 상태
      String[] weather_rain_percent_array;// 날씨 강수 %
      String[] weather_max_array;// 최고 값
      String[] weather_min_array;// 최저 값

      String weather = doc_weather.toString(); // 파싱한 것을 string으로 만들어!

      // 날씨를 시간대별로 가져온다 그 시간대를 가지고 있다.
      weather_clock_array = weather.split("<hour>");// 3시간 단위로 받아온다
      String[] weather_clock_array_value = new String[7]; // 6개만 보여주자
      
      for (int i = 0; i <= 6; i++) {
         String[] weather_clock_tem_array_value = new String[2];
         weather_clock_tem_array_value = weather_clock_array[i].split("<");
         weather_clock_array_value[i] = weather_clock_tem_array_value[0].trim();
         // System.out.println(weather_clock_array_value[i]);
      }

      weather_degree_array = weather.split("<temp>");// 예측 온도를 받아온다
      String[] weather_degree_array_value = new String[7]; // 6개만 보여주자
      for (int i = 0; i <= 6; i++) {
         String[] weather_degree_tem_array_value = new String[2];
         weather_degree_tem_array_value = weather_degree_array[i].split("<");
         weather_degree_array_value[i] = weather_degree_tem_array_value[0].trim();
         // System.out.println("이거="+weather_degree_array_value[i]);
      }

      weather_state_array = weather.split("<pty>");// 예측 날씨 상태를 받아온다
      String[] weather_state_array_value = new String[7]; // 6개만 보여주자
      for (int i = 0; i <= 6; i++) {
         String[] weather_state_tem_array_value = new String[2];
         weather_state_tem_array_value = weather_state_array[i].split("<");
         weather_state_array_value[i] = weather_state_tem_array_value[0].trim();

         switch (weather_state_array_value[i]) {

         case "0":
            weather_state_array_value[i] = "맑음";
            break;
         case "1":
            weather_state_array_value[i] = "비";
            break;
         case "2":
         case "3":
            weather_state_array_value[i] = "진눈깨비";
            break;
         default:
            weather_state_array_value[i] = "눈";
            break;
         }

      }

      weather_flag_array = weather.split("<wfKor>");// 예측 날씨 구름 상태를 받아온다
      String[] weather_flag_array_value = new String[7]; // 6개만 보여주자
      for (int i = 0; i <= 6; i++) {
         String[] weather_state_tem_array_value = new String[2];
         weather_state_tem_array_value = weather_flag_array[i].split("<");
         weather_flag_array_value[i] = weather_state_tem_array_value[0].trim();

      }
      weather_rain_percent_array = weather.split("<pop>");// 예측 강수 확률 구름 상태를 받아온다
      String[] weather_rain_percent_array_value = new String[7]; // 6개만 보여주자
      for (int i = 0; i <= 6; i++) {
         String[] weather_state_tem_array_value = new String[2];
         weather_state_tem_array_value = weather_rain_percent_array[i].split("<");
         weather_rain_percent_array[i] = weather_state_tem_array_value[0].trim();

      }

      weather_max_array = weather.split("<tmx>");// 예측 강수 확률 구름 상태를 받아온다
      String[] weather_max_array_value = new String[7]; // 6개만 보여주자
      for (int i = 0; i <= 6; i++) {
         String[] weather_state_tem_array_value = new String[2];
         weather_state_tem_array_value = weather_max_array[i].split("<");
         weather_max_array[i] = weather_state_tem_array_value[0].trim();
      }

      weather_min_array = weather.split("<tmn>");// 예측 강수 확률 구름 상태를 받아온다
      String[] weather_min_array_value = new String[7]; // 6개만 보여주자
      for (int i = 0; i <= 6; i++) {
         String[] weather_state_tem_array_value = new String[2];
         weather_state_tem_array_value = weather_min_array[i].split("<");
         weather_min_array[i] = weather_state_tem_array_value[0].trim();

      }

      // http://www.kma.go.kr/wid/queryDFS.jsp?gridx=37.3876442&gridy=127.0988379 분당
      dustDTO.setPm10_array(pm10_array_value[0]);
      dustDTO.setPm10_state(pm10_state);
      dustDTO.setPm25_array(pm25_array_value[0]);
      dustDTO.setPm25_state(pm25_state);
      dustDTO.setWeather_clock_array(weather_clock_array_value[1]);
      dustDTO.setWeather_degree_array(weather_degree_array_value[1]);
      dustDTO.setWeather_state_array(weather_state_array_value[1]);
      dustDTO.setWeather_flage_array(weather_flag_array_value[1]);
      dustDTO.setWeather_rain_percent_array(weather_rain_percent_array[1]);

      for (int i = 1; weather_min_array.length > i; i++) {
         //System.out.println(i + "cccc" + weather_min_array[i]);
         if (weather_min_array[i].equals("-999.0") || weather_min_array[i] == null || weather_min_array[i].equals("")) {
            //System.out.println("Min 다시" + weather_min_array[i]);
         } else {
            dustDTO.setWeather_min_array(weather_min_array[i]);
            //System.out.println(weather_min_array[i]);
            break;
         }
      }
      for (int i = 1; weather_max_array.length > i; i++) {
         //System.out.println(i + "ddd" + weather_min_array[i]);
         if (weather_max_array[i].equals("-999.0") || weather_max_array[i] == null || weather_max_array[i].equals("")) {
            //System.out.println("Max 다시" + weather_max_array[i]);
         } else {
            dustDTO.setWeather_max_array(weather_max_array[i]);
            //System.out.println(i);
            break;
         }
      }

      return dustDTO;

   }
}