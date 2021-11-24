package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class MemberMgr {
    private static int number = 2;
	
    private DBConnectionMgr pool;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// 회원가입
	public boolean insertMember(MemberBean bean) {
		++number;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert userinfo(user_Idx,userId,pw,name,email,gender,nickname"
					+ ",symptom,userType,birth)values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, bean.getUserId());
			pstmt.setString(3, bean.getPw());
			pstmt.setString(4, bean.getName());
			pstmt.setString(5, bean.getEmail());
			pstmt.setInt(6, bean.getGender());
			pstmt.setString(7, bean.getNickname());
			pstmt.setString(8, bean.getSymptom());
			pstmt.setInt(9, bean.getUserType());
			pstmt.setString(10, bean.getBirth());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//11월 22일 닉네임 중복 확인 추가
	public boolean checkNickname(String nickname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select nickname from userinfo where nickname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 로그인
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from userinfo where userId = ? and pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	/*************
	 * ch17 필요한 메소드
	 * ************/

	// 회원정보가져오기
	public MemberBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from userinfo where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new MemberBean();
				bean.setUser_Idx(rs.getInt("user_Idx"));
				bean.setUserId(rs.getString("userId"));
				bean.setPw(rs.getString("pw"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setGender(rs.getInt("gender"));
				bean.setNickname(rs.getString("nickname"));
				bean.setSymptom(rs.getString("symptom"));
				bean.setUserType(rs.getInt("userType"));
				bean.setBirth(rs.getString("birth"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}

	// 회원정보수정
	public boolean updateMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update userinfo set user_Idx=?, userId=?, pw=?, name=?,"
					+ "email=?, gender=?, nickname=?, symptom=?, userType=?, birth=? where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getUser_Idx());
			pstmt.setString(2, bean.getUserId());
			pstmt.setString(3, bean.getPw());
			pstmt.setString(4, bean.getName());
			pstmt.setString(5, bean.getEmail());
			pstmt.setInt(6, bean.getGender());
			pstmt.setString(7, bean.getNickname());
			pstmt.setString(8, bean.getSymptom());
			pstmt.setInt(9, bean.getUserType());
			pstmt.setString(10, bean.getBirth());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}