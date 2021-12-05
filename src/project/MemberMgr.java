package project;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.RegisterBean;

public class MemberMgr {
	private static int number = 50;

	private DBConnectionMgr pool;
	private static final String SAVEFOLDER = "C:/Jsp/webProject_PillGood/WebContent/project/fileupload";
	private static final String ENCTYPE = "EUC-KR";
	private static int MAXSIZE = 5 * 1024 * 1024;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	  public void insertImg(HttpServletRequest req) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      MultipartRequest multi = null;
	      int filesize = 0;
	      String filename = null;
	      try {
	         con = pool.getConnection();
	         File file = new File(SAVEFOLDER);
	         if (!file.exists())
	            file.mkdirs();
	         multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
	               new DefaultFileRenamePolicy());

	         if (multi.getFilesystemName("filename") != null) {
	            filename = multi.getFilesystemName("filename");
	            filesize = (int) multi.getFile("filename").length();
	         }
	         
	         sql = "update userinfo set img = ? where userId = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, filename);
	         pstmt.setString(2, multi.getParameter("userId"));
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
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

			char st[] = { '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
					'0' };
			String symptom[] = bean.getSymptom();
			String lists[] = { "구토", "근육통", "기침", "두통", "멀미", "발열", "변비", "비염", "생리통", "소화불량", "속쓰림", "알레르기", "염좌",
					"위산과다", "위염", "제산작용", "치질", "치통", "코감기", "피부염" };
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

	public boolean insertPharmacist(pharmacistBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert pharmacistinfo(userId,career,pcode) values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserId());
			pstmt.setInt(2, bean.getCareer());
			pstmt.setInt(3, bean.getPcode());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// 이걸로 써야 함.
	public boolean loginRegister(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;
		try {
			con = pool.getConnection();
			String query = "select count(*) from userinfo where userId = ? and pw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0)
				loginCon = true;
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return loginCon;
	}

	// 로그인 쓰는것인감..
	/*
	 * public boolean loginMember(String id, String pwd) { Connection con = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null; String sql = null;
	 * boolean flag = false; try { con = pool.getConnection(); sql =
	 * "select id from userinfo where userId = ? and pw = ?"; pstmt =
	 * con.prepareStatement(sql); pstmt.setString(1, id); pstmt.setString(2, pwd);
	 * rs = pstmt.executeQuery(); flag = rs.next(); } catch (Exception e) {
	 * e.printStackTrace(); } finally { pool.freeConnection(con, pstmt, rs); }
	 * return flag; }
	 */

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

				String symptoms[] = new String[20];
				String symptom = rs.getString("symptom");// 01001
				for (int i = 0; i < symptoms.length; i++) {
					symptoms[i] = symptom.substring(i, i + 1);
				}
				bean.setSymptom(symptoms);

				bean.setUserType(rs.getInt("userType"));
				bean.setBirth(rs.getString("birth"));
				bean.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}

	public pharmacistBean getPharmMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pharmacistBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from pharmacistinfo where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new pharmacistBean();
				bean.setUserId(rs.getString("userId"));
				bean.setCareer(rs.getInt("career"));
				bean.setPcode(rs.getInt("pcode"));
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
			String sql = "update userinfo set userId=?, pw=?, name=?,"
					+ "email=?, gender=?, nickname=?, symptom=?, userType=?, birth=? where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getEmail());
			pstmt.setInt(5, bean.getGender());
			pstmt.setString(6, bean.getNickname());

			char symptom[] = { '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
					'0', '0' };
			if (bean.getSymptom() != null) {
				String symptoms[] = bean.getSymptom();
				String list[] = { "구토", "근육통", "기침", "두통", "멀미", "발열", "변비", "비염", "생리통", "소화불량", "속쓰림", "알레르기", "염좌",
						"위산과다", "위염", "제산작용", "치질", "치통", "코감기", "피부염" };
				for (int i = 0; i < symptoms.length; i++) {
					for (int j = 0; j < list.length; j++)
						if (symptoms[i].equals(list[j]))
							symptom[j] = '1';
				}
			}
			pstmt.setString(7, new String(symptom));
			pstmt.setInt(8, bean.getUserType());
			pstmt.setString(9, bean.getBirth());
			pstmt.setString(10, bean.getUserId());
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


//약사정보 수정
	public boolean updatePharmacist(pharmacistBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update pharmacistinfo set career=? where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getCareer());
			pstmt.setString(2, bean.getUserId());

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
	
	public boolean deletePharmacist(String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from pharmacistinfo where userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

}