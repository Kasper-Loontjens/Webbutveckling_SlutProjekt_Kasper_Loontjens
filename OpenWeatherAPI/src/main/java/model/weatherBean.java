package model;

public class weatherBean {

	private String cityStr;

	private String countryStr;

	private String cloudsStr;
	
	private String dateStr;
	
	private String windDirectionStr;

	public weatherBean(String cityStr, String countryStr) {

		this.cityStr = cityStr;
		this.countryStr = countryStr;

	}

	public String getCityStr() {
		return cityStr;
	}

	public String getCountryStr() {
		return countryStr;
	}

	public String getCloudsStr() {
		return cloudsStr;
	}

		public void setCloudsStr(String cloudsStr) {
		this.cloudsStr = cloudsStr;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr.substring(0, 10);
	}

	public String getWindDirectionStr() {
		return windDirectionStr;
	}

	public void setWindDirectionStr(String windDirectionStr) {
		this.windDirectionStr = windDirectionStr;
	}
		
	
		
		
		
		
		
		
		
		
		

}
