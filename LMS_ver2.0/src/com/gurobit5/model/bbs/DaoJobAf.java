package com.gurobit5.model.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.bbs.entity.DtoConsult;
import com.gurobit5.model.bbs.entity.DtoJobAf;
import com.gurobit5.util.MyOracle;


public class DaoJobAf extends DaoBbs {
	//2018-05-24 취업현황게시판 DAO
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<DtoJobAf> selectList(){
		List<DtoJobAf> list =new ArrayList<DtoJobAf>();
		String sql="SELECT * FROM JOB_AF_BBS ORDER BY NUM DESC";
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DtoJobAf dtoJobAf= new DtoJobAf();
				dtoJobAf.setNum(rs.getInt("num"));
				dtoJobAf.setTitle(rs.getString("title"));
				dtoJobAf.setContents(rs.getString("contents"));
				dtoJobAf.setNalja(rs.getDate("nalja"));
				dtoJobAf.setCompany(rs.getString("company"));
				dtoJobAf.setId(rs.getString("id"));
				dtoJobAf.setView_num(rs.getInt("view_num"));
				dtoJobAf.setLec_code(rs.getInt("lec_code"));
				dtoJobAf.setField(rs.getString("field"));
				dtoJobAf.setName(rs.getString("name"));
				list.add(dtoJobAf);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public DtoJobAf selectOne(int num){
		DtoJobAf dtoJobAf =new DtoJobAf();
		String sql="select * from JOB_AF_BBS where num=?";
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next()){
				dtoJobAf.setNum(rs.getInt("num"));
				dtoJobAf.setTitle(rs.getString("title"));
				dtoJobAf.setContents(rs.getString("contents"));
				dtoJobAf.setNalja(rs.getDate("nalja"));
				dtoJobAf.setCompany(rs.getString("company"));
				dtoJobAf.setId(rs.getString("id"));
				dtoJobAf.setView_num(rs.getInt("view_num"));
				dtoJobAf.setLec_code(rs.getInt("lec_code"));
				dtoJobAf.setField(rs.getString("field"));
				dtoJobAf.setName(rs.getString("name"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dtoJobAf;
	}
	
	public void insertOne(String name, String company, int lec_code, String title, String field, String contents, String id){
		String sql="insert into JOB_AF_BBS"
				+ " values(JOB_AF_BBS_seq.nextval,?,?,sysdate,?,?,?,?,?,?)";
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, company);
			pstmt.setString(4, id);
			pstmt.setInt(5, 0);
			pstmt.setInt(6, lec_code);
			pstmt.setString(7, field);
			pstmt.setString(8, name);
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
	
	public void deleteOne(int num){
		String sql="delete from JOB_AF_BBS where num=?";
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
				if(pstmt!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public int edit(String title, String contents,String company,int lec_code,String field,String name,int num){
		String sql="update JOB_AF_BBS set title=?,contents=?,company=?,lec_code=?,field=?,name=? where num=?";
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, company);
			pstmt.setInt(4, lec_code);
			pstmt.setString(5, field);
			pstmt.setString(6, name);
			pstmt.setInt(7, num);
			return pstmt.executeUpdate();
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
		return 0;
	}
}
