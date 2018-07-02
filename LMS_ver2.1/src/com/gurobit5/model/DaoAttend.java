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
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//출석 현황 보기
		public List<DtoAttend> selectAttend(String id) throws SQLException, ClassNotFoundException{	
			String sql="select * from attend where id=? order by nalja desc";
			List<DtoAttend> list = new ArrayList<DtoAttend>();
			try {
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				while(rs.next()){
					DtoAttend dtoAttend = new DtoAttend();
					dtoAttend.setNalja(rs.getDate("nalja"));
					dtoAttend.setInDate(rs.getDate("in_Date"));
					dtoAttend.setOutDate(rs.getDate("out_date"));
					dtoAttend.setState(rs.getString("state"));
					list.add(dtoAttend);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return list;
		
		}// 
	
}
