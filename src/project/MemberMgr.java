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

	// 닉네임 중복 확인
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

			String symptom[] = bean.getSymptom();
			char st[] = { '0', '0', '0', '0' };
			String lists[] = { "감기", "두통", "생리통", "소화불량" };
			for (int i = 0; i < symptom.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if (symptom[i].equals(lists[j]))
						st[j] = '1';
				}
			}

			pstmt.setString(8, new String(st));

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
	 ************/

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

				String symptoms[] = new String[4];
				String symptom = rs.getString("symptom");// 01001
				for (int i = 0; i < symptoms.length; i++) {
					symptoms[i] = symptom.substring(i, i + 1);
				}
				bean.setSymptom(symptoms);

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

	// 약사코드 확인
	public boolean checkPharmacist(int code, int personalNumber) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from pauthentication where pCode = ? and registrationID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setInt(2, personalNumber);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 유저타입 1로 바꾸기
	public void changeUserType(String id, int userType) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = pool.getConnection();
			String sql = "update userinfo set userType = ? where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userType);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 지금 로그인 중인 회원의 userType이 1이면 true를 반환
	public boolean checkUserType(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from userinfo where userId = ? and userType = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, 1);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
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

			char symptom[] = { '0', '0', '0', '0' };
			if (bean.getSymptom() != null) {
				String symptoms[] = bean.getSymptom();
				String list[] = { "감기", "두통", "생리통", "소화불량" };
				for (int i = 0; i < symptoms.length; i++) {
					for (int j = 0; j < list.length; j++)
						if (symptoms[i].equals(list[j]))
							symptom[j] = '1';
				}
			}
			pstmt.setString(8, new String(symptom));
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