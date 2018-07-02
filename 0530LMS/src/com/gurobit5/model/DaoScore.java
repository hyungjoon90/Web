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
	// modify - hyunjung/2018-05-29
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DaoScore() throws ClassNotFoundException, SQLException {
	}
	//학생 전체의 성적 보기
		public ArrayList<DtoScore> selectAll(String id) throws ClassNotFoundException, SQLException{
			String sql="select * from score "
					+ "where lec_code=(select lec_code from member where id=?) "
					+ "order by name"; 
			ArrayList<DtoScore> list = new ArrayList<DtoScore>();
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				while(rs.next()){
					DtoScore dtoScore = new DtoScore();
					dtoScore.setId(rs.getString("id"));
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
		public DtoScore selectOne(String id) throws ClassNotFoundException, SQLException{	
			String sql="select A.name, A.java, A.web, A.db, A.tot,"
					+ "(select B.class_name from lec_info B where A.lec_code=B.lec_code ) as class_name "
					+ "from score A where id=?";
			DtoScore dtoScore = new DtoScore();
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				while(rs.next()){
					dtoScore.setClass_name(rs.getString("class_name"));
					dtoScore.setName(rs.getString("name"));
					dtoScore.setJava(rs.getInt("java"));
					dtoScore.setWeb(rs.getInt("web"));
					dtoScore.setDb(rs.getInt("db"));
					dtoScore.setTot(rs.getInt("tot"));
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return dtoScore;
		}//selectOne
	
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
	
	
	
	
	public void sellectAlltoCnt(){
		
	}


	

}
