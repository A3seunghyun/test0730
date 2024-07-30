package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDto0730;
import dto.UserDto;

public class MemberDao0730 {
	Connection getConnection() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "user0112";
		String dbPw = "user1234";
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void signup(String id, String pw, String name) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO MEMBER(ID, PW, NAME) VALUES(?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	
	public boolean loginCheck(String id, String pw) throws Exception {
		String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pw=?";
		
		Connection conn = getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		ResultSet rs = pstmt.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result==1;
	}
	
	public ArrayList<MemberDto0730> memberList() throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT *" +
				" FROM MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<MemberDto0730> mList = new ArrayList<MemberDto0730>();

		while (rs.next()) {
			MemberDto0730 dto = new MemberDto0730(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4));
			mList.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return mList;
	}
	
	public void userInfoUpdate(String id, String pw, String name, int point) throws Exception {
		Connection conn = getConnection();
		
		String sql = "UPDATE member " + 
				"SET id=?, pw=?, name=?, point=? " + 
				"WHERE id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, point);
		pstmt.setString(5, id);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	
	public void userInfoDelete(String id) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM MEMBER WHERE id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	
	public ArrayList<UserDto> users(String id) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT id \"아이디\", name \"이름\", point \"포인트\" " +
				"FROM MEMBER " +
				"WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<UserDto> user = new ArrayList<UserDto>();

		while (rs.next()) {
			UserDto dto = new UserDto(rs.getString(1),rs.getString(2),rs.getInt(3));
			user.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return user;
	}
	
	// INSERT INTO BUY(ID, CLASS) VALUES('hi', '1234');
	
	public void buy(String id, String productTitle) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO BUY(ID, CLASS) VALUES(?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, productTitle);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	
	public void userPointUpdate(String id, int point) throws Exception {
		Connection conn = getConnection();
		
		String sql = "UPDATE member " + 
				"SET id=?, point=? " + 
				"WHERE id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setInt(2, point);
		pstmt.setString(3, id);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	
}
