package com.gurobit5.model.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.bbs.entity.DtoLecAf;
import com.gurobit5.util.MyOracle;


public class DaoLecAf{
	// try - hyunjung/2018-05-23
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//수강후기 게시판 전체 리스트 보기
	public ArrayList<DtoLecAf> selectAll() throws ClassNotFoundException, SQLException{
		String sql="select rownum as rn, A.num, A.title, A.id, A.nalja, A.view_num from "
				+ "(select num, title, id, nalja, view_num from lec_af_bbs order by num) A order by rn desc";
		ArrayList<DtoLecAf> list = new ArrayList<DtoLecAf>();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DtoLecAf dtoLecAf = new DtoLecAf();
				dtoLecAf.setNum(rs.getInt("num"));
				dtoLecAf.setTitle(rs.getString("title"));
				dtoLecAf.setId(rs.getString("id"));
				dtoLecAf.setNalja(rs.getDate("nalja"));
				dtoLecAf.setViewNum(rs.getInt("view_num"));//조회수?
				dtoLecAf.setRn(rs.getInt("rn"));
				list.add(dtoLecAf);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}//selectAll
	
	//수강후기 상세보기
	public DtoLecAf selectOne(int num) throws ClassNotFoundException, SQLException{
		String sql="select a.num, a.title, a.id, a.nalja, a.contents, a.view_num, b.class_name as class_name "
				+ "from lec_af_bbs a, lec_info b where num=? and a.lec_code=b.lec_code";
		DtoLecAf dtoLecAf = new DtoLecAf();
		try{
			viewNum(num);//조회수 증가
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next()){
				dtoLecAf.setNum(rs.getInt("num"));
				dtoLecAf.setTitle(rs.getString("title"));
				dtoLecAf.setId(rs.getString("id"));
				dtoLecAf.setNalja(rs.getDate("nalja"));
				dtoLecAf.setContents(rs.getString("contents"));
				dtoLecAf.setViewNum(rs.getInt("view_num"));//조회수?
				dtoLecAf.setClassName(rs.getString("class_name"));//강의명 가져오기
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return dtoLecAf;
		
	}//selectOne
	
	//게시글 작성
	public void insert(){
		String sql="insert into Lec_af_bbs values ";
	}//insert
	
	
	//조회수 증가
	public void viewNum(int num) throws ClassNotFoundException, SQLException{
		String sql="update lec_af_bbs set view_num=view_num+1 where num=?";
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}//viewNum
	
}
