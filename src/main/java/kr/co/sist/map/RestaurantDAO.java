package kr.co.sist.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDTO;
import kr.co.sist.dao.DbConn;

public class RestaurantDAO {
	private static RestaurantDAO rDAO;
	
	private RestaurantDAO() {}
	
	public static RestaurantDAO getInstance() {
		if(rDAO == null) {
			rDAO = new RestaurantDAO();
		}
		
		return rDAO;
	}
	
	public List<RestaurantDTO> selectAllRestaurant(String id) throws SQLException {
		List<RestaurantDTO> list = new ArrayList<RestaurantDTO>();
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
		//1. JNDI사용객체 생성
		//2. DataSource 얻기
		//3. Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문생성객체 얻기
			StringBuilder selectRestaurant=new StringBuilder();
			selectRestaurant
			.append("	select  rest_num, rest_name, menu, lat, lng, input_date				 ")
			.append("	from	restaurant	")
			.append("	where id=?	");
			
			pstmt=con.prepareStatement(selectRestaurant.toString());
		//5. 바인드변수 값 설정
			pstmt.setString(1, id);
		//6. 조회결과 얻기
			RestaurantDTO rDTO=null;
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				rDTO=new RestaurantDTO();
				rDTO.setRest_num(rs.getInt("rest_num"));
				rDTO.setRest_name(rs.getString("rest_name"));
				rDTO.setMenu(rs.getString("menu"));
				rDTO.setMenu(rs.getString("menu"));
				rDTO.setLat(rs.getDouble("lat"));
				rDTO.setLng(rs.getDouble("lng"));
				rDTO.setInput_date(rs.getDate("input_date"));
				
				list.add(rDTO);
			}//end while
			
		}finally {
		//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllRestaurant
	
	public void insertRestaurant(RestaurantDTO rDTO) throws SQLException{
		
	}//insertRestaurant
}
