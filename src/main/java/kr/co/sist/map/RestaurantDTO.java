package kr.co.sist.map;

import java.util.Date;

public class RestaurantDTO {
	private int rest_num;//식당 식별 번호
	private String id, rest_name, menu, info;//회원 아이디, 식당명, 메뉴, 식당 정보
	private double lat, lng;//위도, 경도
	private Date input_date;//입력일
	public RestaurantDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestaurantDTO(int rest_num, String id, String rest_name, String menu, String info, double lat, double lng,
			Date input_date) {
		super();
		this.rest_num = rest_num;
		this.id = id;
		this.rest_name = rest_name;
		this.menu = menu;
		this.info = info;
		this.lat = lat;
		this.lng = lng;
		this.input_date = input_date;
	}
	public int getRest_num() {
		return rest_num;
	}
	public void setRest_num(int rest_num) {
		this.rest_num = rest_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRest_name() {
		return rest_name;
	}
	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public Date getInput_date() {
		return input_date;
	}
	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}
	@Override
	public String toString() {
		return "RestaurantDTO [rest_num=" + rest_num + ", id=" + id + ", rest_name=" + rest_name + ", menu=" + menu
				+ ", info=" + info + ", lat=" + lat + ", lng=" + lng + ", input_date=" + input_date + "]";
	}
	
}
