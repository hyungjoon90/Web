package com.gurobit5.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.entity.DtoAttend;
import com.gurobit5.util.MyOracle;


public class DaoAttend {
	// try - hyunjung/2018-05-23
	// try - hyunjung/2018-05-28
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//출석 현황 보기
	public ArrayList<DtoAttend> selectOne(String id) throws SQLException, ClassNotFoundException{	
		//이름,날짜,입실시간,퇴실시간,출석상태, 지각횟수,결석횟수 
		String sql="select A.id, A.name, A.nalja, A.state, "
				+ "A.in_date, A.out_date," 
				+"(select count(decode(state,'지각','1')) from ATTEND group by id having id=?) as late ,"
				+"(select count(decode(state,'결석','1')) from Attend group by id having id=?) as absent"  
				+" from attend A where A.id=? order by nalja desc";
		ArrayList<DtoAttend> list = new ArrayList<DtoAttend>();
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DtoAttend dtoAttend = new DtoAttend();
				dtoAttend.setId(rs.getString("id"));
				dtoAttend.setName(rs.getString("name"));
				dtoAttend.setNalja(rs.getDate("nalja"));
				dtoAttend.setInDate(rs.getTime("in_date"));
				dtoAttend.setOutDate(rs.getTime("out_date"));
				dtoAttend.setState(rs.getString("state"));
				dtoAttend.setLate(rs.getInt("late"));
				dtoAttend.setAbsent(rs.getInt("absent"));
				list.add(dtoAttend);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
		
	}//selectOne 
	
}
