package kr.co.sist.emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class EmployeeDAO {
	private static EmployeeDAO empDAO;
	
	private EmployeeDAO() {
	}
	
	public static EmployeeDAO getInstance() {
		if(empDAO == null) {
			empDAO=new EmployeeDAO();
		}//end if
		
		return empDAO;
	}//getInstance
	
	public List<DeptDTO> selectAllDept() throws SQLException{
		List<DeptDTO> list=new ArrayList<DeptDTO>();
	
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
			String selectAllDept="select deptno,dname from dept";
			pstmt=con.prepareStatement(selectAllDept);
		//5. 바인드변수 값 설정
			
		//6. 조회결과 얻기
			DeptDTO dDTO=null;
			rs=pstmt.executeQuery();
			
			while( rs.next() ) {
				dDTO=new DeptDTO();
				dDTO.setDeptno(rs.getInt("deptno"));
				dDTO.setDname(rs.getString("dname"));
				list.add(dDTO);
			}//end while
			
		}finally {
		//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllDept
	
	public List<EmpDTO> selectEmp( int deptno ) throws SQLException{
		List<EmpDTO> list=new ArrayList<EmpDTO>();
	
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
			StringBuilder selectEmp=new StringBuilder();
			selectEmp
			.append("	select	empno, ename, job, sal, hiredate,				 ")
			.append("	to_char(hiredate,'yyyy-mm-dd q\"분기\"') hiredate_str	")
			.append("	from	emp												")
			.append("	where	deptno=?										");
			
			pstmt=con.prepareStatement(selectEmp.toString());
		//5. 바인드변수 값 설정
			pstmt.setInt(1, deptno);
		//6. 조회결과 얻기
			EmpDTO eDTO=null;
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				eDTO=new EmpDTO();
				eDTO.setEmpno(rs.getInt("empno"));
				eDTO.setEname(rs.getString("ename"));
				eDTO.setJob( rs.getString("job"));
				eDTO.setSal(rs.getInt("sal"));
				eDTO.setHiredate(rs.getDate("hiredate"));
				eDTO.setHiredateStr(rs.getString("hiredate_str"));
				
				list.add(eDTO);
			}//end while
		}finally {
		//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllDept
	
	
}//class





