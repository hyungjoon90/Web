package com.gurobit5.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.entity.DtoLecInfo;
import com.gurobit5.util.MyOracle;

public class DaoLecInfo {
	// try - sskim / 2018-05-24
	// try - hyunjung/2018-05-24

	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public DaoLecInfo() throws ClassNotFoundException, SQLException {
	}
	
	//수강후기 게시판 - 강의명 불러오기
		public ArrayList<DtoLecInfo> selectClassName() throws ClassNotFoundException, SQLException{
			String sql="select class_name,lec_code from lec_info";
			ArrayList<DtoLecInfo> list = new ArrayList<DtoLecInfo>();
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					DtoLecInfo dtoLecInfo = new DtoLecInfo();
					dtoLecInfo.setClassName(rs.getString("class_name"));
					dtoLecInfo.setLecCode(rs.getInt("lec_code"));
					list.add(dtoLecInfo);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return list;
		}
	
	
	//CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD 만 불러옴
	public List<DtoLecInfo> selectAllforList(int start, int end) throws SQLException, ClassNotFoundException {
		// 리스트의 형태는 강의명, 개강일-종강일. 키워드->이미지 로 보여줌
		// list 이기 때문에 list page 작업을 위해서 필요한 정보도 심어줌
		// int pageNum = 1;
		// int rowNum = 5; List<DtoLecInfo> list
		// int totNum = daoMember.countByLecCode();
		String sql =""
				+ "SELECT RN, CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD"
				+ " FROM (SELECT ROWNUM AS RN, CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD"
					+ " FROM (SELECT CLASS_NAME, OPEN_DATE, END_DATE, KEYWORD"
						+ " FROM LEC_INFO ORDER BY LEC_CODE DESC)"
					+ " WHERE ROWNUM <= ?)"
				+ " WHERE RN >= ?";
		List<DtoLecInfo> list = new ArrayList<DtoLecInfo>();
		
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();

			while(rs.next()){
				DtoLecInfo dtoLecInfo = new DtoLecInfo();
				dtoLecInfo.setRn(rs.getInt("rn"));
				dtoLecInfo.setClassName(rs.getString("class_name"));
				dtoLecInfo.setOpenDate(rs.getDate("open_date"));
				dtoLecInfo.setEndDate( rs.getDate("end_date"));
				dtoLecInfo.setKeyword(rs.getString("keyword"));
				list.add(dtoLecInfo);
			}
		}finally{
			closeAll();
		}
		
		return list;
	}// selectAllforList()

	public DtoLecInfo selectOne(int idx) throws SQLException, ClassNotFoundException {
		DtoLecInfo dtoLecInfo = new DtoLecInfo();
		String sql =""
				+ "SELECT LEC_CODE, CLASS_NAME, TEACHER, OPEN_DATE, END_DATE, MAX_AB, KEYWORD, CLASSNO"
				+ " FROM LEC_INFO WHERE LEC_CODE= ?";
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dtoLecInfo.setLecCode(rs.getInt("LEC_CODE"));
				dtoLecInfo.setClassName(rs.getString("CLASS_NAME"));
				dtoLecInfo.setTeacher(rs.getString("TEACHER"));
				dtoLecInfo.setOpenDate(rs.getDate("OPEN_DATE"));
				dtoLecInfo.setEndDate(rs.getDate("END_DATE"));
				dtoLecInfo.setMaxAB(rs.getInt("MAX_AB"));
				dtoLecInfo.setKeyword(rs.getString("KEYWORD"));
				dtoLecInfo.setClassno(rs.getInt("CLASSNO"));
			}else{
				dtoLecInfo = null;
			}
		} finally{
			closeAll();
		}
		return dtoLecInfo;
	}
	

	public int countAll() throws SQLException, ClassNotFoundException {
		String sql = "SELECT COUNT(*) AS TOT FROM LEC_INFO";
		int tot = 0; 
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs 	= pstmt.executeQuery(sql);
			if(rs.next()){
				tot = rs.getInt(1);
			}
		}finally{
			closeAll();
		}
		return tot;
	}// countAll()
	
	public int addRecord(DtoLecInfo bean) throws SQLException, ClassNotFoundException{
		int result = 0;
		String sql =""
				+ "insert into LEC_INFO values (LEC_CODE_SEQ.nextval,?,?,?,?,?,?,?)";
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getClassName());
			pstmt.setString(2, bean.getTeacher());
			pstmt.setDate(3, bean.getOpenDate());
			pstmt.setDate(4, bean.getEndDate());
			pstmt.setInt(5, bean.getMaxAB());
			pstmt.setString(6, bean.getKeyword());
			pstmt.setInt(7, bean.getClassno());
			
			result = pstmt.executeUpdate();
		} finally{
			closeAll();
			System.out.println("입력 성공");
		}
		return result;
	}

	public int delRecord(int idx){
		return idx;
		
	}

	public int updateRecord(DtoLecInfo dtoLecInfo) throws SQLException, ClassNotFoundException{
		int result = 0;
		String sql =""
				+ "UPDATE LEC_INFO SET"
				+ " CLASS_NAME= ?,"	+ " TEACHER = ?," 	+ " OPEN_DATE= ?," 	
				+ " END_DATE= ?,"	+ " MAX_AB= ?,"		+ " KEYWORD= ?," 	
				+ " CLASSNO= ?"
				+ " WHERE LEC_CODE= ?";
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dtoLecInfo.getClassName());
			pstmt.setString(2, dtoLecInfo.getTeacher());
			pstmt.setDate(3, dtoLecInfo.getOpenDate());
			pstmt.setDate(4, dtoLecInfo.getEndDate());
			pstmt.setInt(5, dtoLecInfo.getMaxAB());
			pstmt.setString(6, dtoLecInfo.getKeyword());
			pstmt.setInt(7, dtoLecInfo.getClassno());
			pstmt.setInt(8, dtoLecInfo.getLecCode());
			
			result = pstmt.executeUpdate();
		} finally{
			closeAll();
			System.out.println("업데이트 성공");
		}
		return result;
	}
	
	
	
	
	public void closeAll() throws SQLException{
		if(rs!=null){ rs.close(); }
		if(pstmt!=null){ pstmt.close(); }
		if(conn!=null){ conn.close(); }
	}//closeAll()

	

}// DaoLecInfo
