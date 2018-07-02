package com.gurobit5.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.entity.DtoMember;
import com.gurobit5.util.MyOracle;
import com.gurobit5.util.MyRandom;

public class DaoMember {
	// try - sskim / 2018-05-24
	// try - sskim / 2018-05-29

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
		String sql = "SELECT COUNT(*) AS TOT FROM MEMBER WHERE LEC_CODE IS NOT NULL";

		int tot = 0; 
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs 	= pstmt.executeQuery();
			if(rs.next()){
				tot = rs.getInt(1);
			}
		}finally{
			closeAll();
		}
		return tot;
	}// countByLecCode();


	public List<DtoMember> selectNameAll(int memType) throws ClassNotFoundException, SQLException{
		// try - sskim / 2018-05-29

		String sql = ""
				+ "SELECT NAME FROM MEMBER WHERE MEM_TYPE = ? ORDER BY NAME DESC";
		List<DtoMember> list = null;
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memType);
			rs 	= pstmt.executeQuery();

			list = new ArrayList<DtoMember>();
			while(rs.next()){
				DtoMember bean = new DtoMember();
				bean.setName(rs.getString("name"));
				list.add(bean);
			}
		}finally{
			closeAll();
		}
		return list;
	}// selectNameAll(int memType)


	public List<String[]> selectStuAllbyLecCode(int start, int end) throws SQLException, ClassNotFoundException {
		// try - sskim / 2018-05-29

		String sql = ""
				+ "SELECT X.RN, X.NAME, X.CLASS_NAME "
				+ "FROM (SELECT ROWNUM AS RN T.NAME NAME, T.CLASS CLASS_NAME "
				+ "FROM (SELECT A.NAME NAME, LI.CLASS_NAME CLASS_NAME "
				+ "FROM MEMBER A LEFT OUTER JOIN LIEC_INFO L "
				+ "ON (A.LEC_CODE = LI.LEC_CODE and A.MEM_TYPE=0 ) ORDER BY A.NAME DESC) T "
				+ "WHERE ROWNUM <= ?) X "
				+ "WHERE X.RN >= ?";

		ArrayList<String[]> list = null;
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();

			list = new ArrayList<String[]>();
			while(rs.next()){
				String[] stu = new String[3];
				stu[0] = String.valueOf( rs.getInt("rn") );
				stu[1] = String.valueOf( rs.getString("name") );
				stu[2] = String.valueOf( rs.getString("class_name") );
				list.add(stu);
			}
		}finally{
			closeAll();
		}


		return list;
	}// selectStuAllbyLecCode(int start, int end) 

	// sskim 추가 : 2018-05-29
	public List<DtoMember> selectAllbyType(int start, int end, int type) throws ClassNotFoundException, SQLException {
		String sql = ""
				+ "SELECT RN, ID, NAME, MEM_TYPE"
				+ " FROM (SELECT ROWNUM AS RN ID, NAME, MEM_TYPE"
				+ " FROM (SELECT ID, NAME, MEM_TYPE FROM MEMBER"
				+ " WHERE MEM_TYPE = ? ORDER BY ID)"
				+ " WHERE ROWNUM <= ?) X"
				+ " WHERE RN >= ?";
		List<DtoMember> list = null;
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			rs = pstmt.executeQuery();
			list = new ArrayList<DtoMember>();
			while(rs.next()){
				DtoMember bean = new DtoMember();
				bean.setRn(rs.getInt("rn"));
				bean.setRn(rs.getInt("id"));
				bean.setRn(rs.getInt("name"));
				bean.setRn(rs.getInt("mem_type"));
				list.add(bean);
			}
		}finally{
			closeAll();
		}

		return list;

	}// selectAllbyType(int start, int end, int type) 

	public List<DtoMember> selectAll(int start, int end) throws ClassNotFoundException, SQLException {
		// try - sskim / 2018-05-29
		String sql = ""
				+ "SELECT RN, ID, NAME, MEM_TYPE"
				+ " FROM (SELECT ROWNUM AS RN, ID, NAME, MEM_TYPE"
				+ " FROM (SELECT ID, NAME, MEM_TYPE FROM MEMBER ORDER BY ID)"
				+ " WHERE ROWNUM <= ?)"
				+ " WHERE RN >= ?";
		List<DtoMember> list = null;
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();
			list = new ArrayList<DtoMember>();
			while(rs.next()){
				DtoMember bean = new DtoMember();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setMemType(rs.getInt("mem_type"));
				list.add(bean);
			}
			
		}finally{
			closeAll();
		}
		return list;
	}// selectAll();

	public DtoMember selectOne(String id) throws SQLException, ClassNotFoundException {
		// try - sskim / 2018-05-29
		DtoMember dtoMember = null;

		String sql = "select * from member where id = ?";
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dtoMember = new DtoMember();
				dtoMember.setId(rs.getString("id"));
				dtoMember.setName(rs.getString("name"));
				dtoMember.setPhone(rs.getInt("phone"));
				dtoMember.setEmail(rs.getString("email"));
				dtoMember.setMemType(rs.getInt("mem_type"));
				dtoMember.setLecCode(rs.getInt("lec_code"));
			}
		}finally{
			closeAll();
		}
		return dtoMember;
	}// selectOne();

	public int updateOne(DtoMember dtoMember) throws SQLException, ClassNotFoundException {
		// try - sskim / 2018-05-29
		String sql = "update member set"
				+ " name = ?"	+ " phone = ?"
				+ " email = ?"	+ " mem_type = ?"
				+ " where id = ?";
		int result = 0;
		
		try{
			if(conn!=null)conn = MyOracle.getConnection(); // pwInit 때문에
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dtoMember.getName());
			pstmt.setInt(2, dtoMember.getPhone());
			pstmt.setString(3, dtoMember.getEmail());
			pstmt.setInt(4, dtoMember.getMemType());
			pstmt.setString(5, dtoMember.getId());
			result = pstmt.executeUpdate();
		}finally{
			if(conn.getAutoCommit()==false){
				conn.setAutoCommit(true);
			}
			closeAll();
		}
		return result;
	}// updateOne();

	@SuppressWarnings("finally")
	public int pwInit(String id, String pw) throws SQLException {
		// try - sskim / 2018-05-29

		// 이건 catch 써서 에러나면 rollback 하고 commit은 하지 않습니다.
		String sql = ""
				+ "update member set password = ? where id = ?";
		int result = 0;
		try{
			if(conn!=null)conn = MyOracle.getConnection(); // pwInit 때문에
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println("["+id+"] 비밀번호 초기화시 오류");
			conn.rollback();
			//e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("["+id+"] 비밀번호 초기화시 오류");
			conn.rollback();
			//e.printStackTrace();
		}finally{
			return result;
		}
	}// pwInit

	public List<DtoMember> selectAllStu(int lecCode) {
		// TODO Auto-generated method stub
		return null;
	}

	public void changeLecCode(String name, int nowLecCode, int mem_type, int afLecCode) throws SQLException, ClassNotFoundException {

		String sql = "update member set"
				+ " classno = ?"
				+ " where name = ? and classno = ? and mem_type = ?";
		try{
			conn = MyOracle.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,afLecCode);
			pstmt.setString(2,name);
			pstmt.setInt(3,nowLecCode);
			pstmt.setInt(4,mem_type);
			pstmt.executeUpdate();
		}finally{
			closeAll();
		}
	}//changeLecCode




}//DaoMember
