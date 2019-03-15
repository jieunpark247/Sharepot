package floatingbanner;

public class MainDTO {

	String pm10_array; // 미세먼지 실제 값
	String pm25_array; // 초미세먼지 실제 값

	String pm10_state; // 미세먼지 상태 값
	String pm25_state; // 초미세먼지 상태 값

	String weather_clock_array; // 날씨 정보 시간 split으로 담을 값
	String weather_degree_array; // 온도를 split으로 담을 값
	String weather_state_array;
	String weather_flage_array; // 날씨 구름 정보를 가져온다
	String weather_rain_percent_array; // 강수 확률
	String weather_max_array; // 최저
	String weather_min_array; // 최고

	public String getWeather_max_array() {
		return weather_max_array;
	}

	public void setWeather_max_array(String weather_max_array) {
		this.weather_max_array = weather_max_array;
	}

	public String getWeather_min_array() {
		return weather_min_array;
	}

	public void setWeather_min_array(String weather_min_array) {
		this.weather_min_array = weather_min_array;
	}

	public String getWeather_rain_percent_array() {
		return weather_rain_percent_array;
	}

	public void setWeather_rain_percent_array(String weather_rain_percent_array) {
		this.weather_rain_percent_array = weather_rain_percent_array;
	}

	public String getWeather_flage_array() {
		return weather_flage_array;
	}

	public void setWeather_flage_array(String weather_flage_array) {
		this.weather_flage_array = weather_flage_array;
	}

	public String getPm10_array() {
		return pm10_array;
	}

	public void setPm10_array(String pm10_array) {
		this.pm10_array = pm10_array;
	}

	public String getPm25_array() {
		return pm25_array;
	}

	public void setPm25_array(String pm25_array) {
		this.pm25_array = pm25_array;
	}

	public String getPm10_state() {
		return pm10_state;
	}

	public void setPm10_state(String pm10_state) {
		this.pm10_state = pm10_state;
	}

	public String getPm25_state() {
		return pm25_state;
	}

	public void setPm25_state(String pm25_state) {
		this.pm25_state = pm25_state;
	}

	public String getWeather_clock_array() {
		return weather_clock_array;
	}

	public void setWeather_clock_array(String weather_clock_array) {
		this.weather_clock_array = weather_clock_array;
	}

	public String getWeather_degree_array() {
		return weather_degree_array;
	}

	public void setWeather_degree_array(String weather_degree_array) {
		this.weather_degree_array = weather_degree_array;
	}

	public String getWeather_state_array() {
		return weather_state_array;
	}

	public void setWeather_state_array(String weather_state_array) {
		this.weather_state_array = weather_state_array;
	}
	
	public String graph10()
	{
		
	
		return (100*Double.parseDouble(pm10_array)/151.0)+"";
	}
	public String graph25()
	{
		
	
		return (100*Double.parseDouble(pm25_array)/76.0)+"";
	}

}