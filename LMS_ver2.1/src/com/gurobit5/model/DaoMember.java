package com.gurobit5.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.entity.DtoMember;
import com.gurobit5.util.MyOracle;

public class DaoMember {
	// try - sskim / 2018-05-24


	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;



	public DaoMember() throws ClassNotFoundException, SQLException {
	}

	public void closeAll() throws SQLException{
		if(rs!=null){ rs.close(); }
		if(pstmt!=null){ pstmt.close(); }
		if(conn!=null){ conn.close(); }
	}

	
	public void insertJoin(String id, String password, String pwchk, String name, int both, String email, int phone){
		String sql = "insert into member values(?,?,?,?,?,?,?)";
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, pwchk);
			pstmt.setString(4, name);
			pstmt.setInt(5, both);
			pstmt.setString(6, email);
			pstmt.setInt(7, phone);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

	public int countAllByLecCode() throws SQLException, ClassNotFoundException{
		String sql = "SELECT COUNT(*) AS TOT FROM MEMBER WHERE LEC_COME IS NOT NULL";
		conn = MyOracle.getConnection();
		pstmt = conn.prepareStatement(sql);
		int tot = 0; 
		rs 	= pstmt.executeQuery();
		if(rs.next()){
			tot = rs.getInt(1);
		}
		return tot;
	}// countByLecCode();
	

	public List<DtoMember> selectNameAll(int memType) throws ClassNotFoundException, SQLException{
		String sql = ""
				+ "SELECT NAME FROM MEMBER WHERE MEM_TYPE = ? ORDER BY NAME DESC";
		conn = MyOracle.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memType);
		rs 	= pstmt.executeQuery();
		
		List<DtoMember> list = new ArrayList<DtoMember>();
		while(rs.next()){
			DtoMember bean = new DtoMember();
			bean.setName(rs.getString("name"));
			list.add(bean);
		}
		return list;
	}
	
	
	public List<String[]> selectStuAllbyLecCode(int start, int end) throws SQLException, ClassNotFoundException {
		String sql = ""
				+ "SELECT X.RN, X.NAME, X.CLASS_NAME "
					+ "FROM (SELECT ROWNUM AS RN T.NAME NAME, T.CLASS CLASS_NAME "
						+ "FROM (SELECT A.NAME NAME, LI.CLASS_NAME CLASS_NAME "
							+ "FROM MEMBER A LEFT OUTER JOIN LIEC_INFO L "
							+ "ON (A.LEC_CODE = LI.LEC_CODE and A.MEM_TYPE=0 ) ORDER BY A.NAME DESC) T "
						+ "WHERE ROWNUM <= ?) X "
				+ "WHERE X.RN >= ?";

		conn = MyOracle.getConnection();
		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, end);
		pstmt.setInt(2, start);
		rs = pstmt.executeQuery();

		ArrayList<String[]> list = new ArrayList<String[]>();
		while(rs.next()){
			String[] stu = new String[3];
			stu[0] = String.valueOf( rs.getInt("rn") );
			stu[1] = String.valueOf( rs.getString("name") );
			stu[2] = String.valueOf( rs.getString("class_name") );
			list.add(stu);
		}

		return list;
	}



}//DaoMember
