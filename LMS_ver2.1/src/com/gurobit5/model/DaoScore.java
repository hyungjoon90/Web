package com.gurobit5.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.entity.DtoScore;
import com.gurobit5.util.MyOracle;

public class DaoScore {
	// try - sskim / 2018-05-24
	// try - hyunjung/2018-05-23
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//학생 전체의 성적 보기
	public List<DtoScore> selectAll() throws ClassNotFoundException, SQLException{
		String sql="slect * from score order by name"; 
		List<DtoScore> list = new ArrayList<DtoScore>();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DtoScore dtoScore = new DtoScore();
				dtoScore.setName(rs.getString("name"));
				dtoScore.setJava(rs.getInt("java"));
				dtoScore.setWeb(rs.getInt("web"));
				dtoScore.setDb(rs.getInt("db"));
				dtoScore.setTot(rs.getInt("tot"));
				list.add(dtoScore);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}//selectAll
	
	
	//학생 한명의 성적 보기
	public List<DtoScore> selectOne(String id) throws ClassNotFoundException, SQLException{	
		String sql="select * from score where id=?";
		List<DtoScore> list = new ArrayList<DtoScore>();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DtoScore dtoScore = new DtoScore();
				dtoScore.setName(rs.getString("name"));
				dtoScore.setJava(rs.getInt("java"));
				dtoScore.setWeb(rs.getInt("web"));
				dtoScore.setDb(rs.getInt("db"));
				dtoScore.setTot(rs.getInt("tot"));
				list.add(dtoScore);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}//selectOne
	
	public DaoScore() throws ClassNotFoundException, SQLException {
		conn = MyOracle.getConnection();
	}
	
	public void sellectAlltoCnt(){
		
	}


	

}
