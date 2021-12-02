package project;

import java.sql.*;
import java.util.Vector;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RegisterMgr {

	private DBConnectionMgr pool;

	public RegisterMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 연결 실패");
		}
	}

	// 게시판 리스트
	public Vector<RegisterBean> getMList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from medicininfo order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  medicininfo where " + keyField + " like ? ";
				sql += "order by ref desc, pos limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RegisterBean bean = new RegisterBean();
				bean.setMedicineName(rs.getString("medicineName"));
				bean.setManufactureName(rs.getString("manufactureName"));
				bean.setImage(rs.getString("image"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// 제품검색 - zipcode에서 가져온
	public Vector<RegisterBean> MedicineRead(String mediName) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			sql = "select medicineName, manufactureName, image from medicininfo where medicineName like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + mediName + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RegisterBean bean = new RegisterBean();
				bean.setMedicineName(rs.getString(1));
				bean.setManufactureName(rs.getString(2));
				bean.setImage(rs.getString(3));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	   //총 게시물수
	   public int getTotalCount(String keyField, String keyWord) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      int totalCount = 0;
	      try {
	         con = pool.getConnection();
	         if (keyWord.equals("null") || keyWord.equals("")) { //검색창에 아무것도 안 써 있을 경우
	            sql = "select count(medicine_Idx) from medicininfo";
	            pstmt = con.prepareStatement(sql);
	         } else {
	            sql = "select count(medicine_Idx) from medicininfo where " + keyField + " like ? ";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, "%" + keyWord + "%");
	         }
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            totalCount = rs.getInt(1);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return totalCount;
	   }
}
