package kr.co.sist.map;

import java.sql.SQLException;
import java.util.List;

import org.json.simple.JSONObject;

public class RestaurantService {
	private static RestaurantService rs;
	
	private RestaurantService() {}
	
	public static RestaurantService getInstance() {
		if(rs == null) {
			rs = new RestaurantService();
		}
		
		return rs;
	}
	
	public List<RestaurantDTO> searchRestaurant(String id){
		List<RestaurantDTO> list = null;
		
		RestaurantDAO rDAO = RestaurantDAO.getInstance();
		try {
			list = rDAO.selectAllRestaurant(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public String addRestaurant(RestaurantDTO rDTO) {
		JSONObject jsonObj = new JSONObject();
		RestaurantDAO rDAO = RestaurantDAO.getInstance();
		
		jsonObj.put("resultFlag", false);
		
		try {
			rDAO.insertRestaurant(rDTO);
			jsonObj.put("resultFlag", true);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return jsonObj.toJSONString();
	}//addRestaurant
}
