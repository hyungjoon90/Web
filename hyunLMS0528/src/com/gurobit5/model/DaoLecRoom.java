package com.gurobit5.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.entity.DtoLecRoom;
import com.gurobit5.util.MyOracle;

public class DaoLecRoom {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public DaoLecRoom(){}
	
	// 그냥 다 가지고 올때
	public List<DtoLecRoom> selectAll() throws ClassNotFoundException, SQLException {
		String sql = "SELECT CLASSNO, CLASS_USING, MAX_NUM FROM LEC_ROOM";

		conn = MyOracle.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs 	= pstmt.executeQuery();
		
		List<DtoLecRoom> list = new ArrayList<DtoLecRoom>();
		while(rs.next()){
			DtoLecRoom bean = new DtoLecRoom();
			bean.setClassno(rs.getInt("classno"));
			bean.setClassUsing(rs.getString("class_using"));
			bean.setMAX_NUM(rs.getInt("max_num"));
			list.add(bean);
		}
		return list;
	}

	// 사용여부로 필터링할때
	public List<DtoLecRoom> selectAll(String string) throws SQLException, ClassNotFoundException {
		String sql = "SELECT CLASSNO, CLASS_USING, MAX_NUM FROM LEC_ROOM where class_using = ?";

		conn = MyOracle.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,string);
		rs 	= pstmt.executeQuery();
		
		List<DtoLecRoom> list = new ArrayList<DtoLecRoom>();
		while(rs.next()){
			DtoLecRoom bean = new DtoLecRoom();
			bean.setClassno(rs.getInt("classno"));
			bean.setClassUsing(rs.getString("class_using"));
			bean.setMAX_NUM(rs.getInt("max_num"));
			list.add(bean);
		}
		return list;
	}
}
