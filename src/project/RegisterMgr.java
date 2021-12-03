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

	public Vector<RegisterBean> getMList(String prodName, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			if (prodName.equals("null") || prodName.equals("")) {
				sql = "select * from medicininfo limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  medicininfo where medicineName" + " like ?  limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + prodName + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RegisterBean bean = new RegisterBean();
	    		bean.setMedicine_Idx(rs.getInt("medicine_Idx"));
	    		bean.setMedicineName(rs.getString("medicineName"));
	    		bean.setManufactureName(rs.getString("manufactureName"));
	    		bean.setIngrediant(rs.getString("ingrediant"));
	    		bean.setMedicine_Efficacy(rs.getString("medicine_Efficacy"));
	    		bean.setDosage(rs.getString("dosage"));
	    		bean.setNtk(rs.getString("ntk"));
	    		bean.setCaution(rs.getString("caution"));
	    		bean.setWarningThings(rs.getString("warningThings"));
	    		bean.setAdverseReaction(rs.getString("adverseReaction"));
	    		bean.setStorageMethod(rs.getString("storageMethod"));
	    		bean.setAppearance(rs.getString("appearance"));
	    		bean.setImage(rs.getString("image"));
	    		bean.setDosageForm(rs.getString("dosageForm"));
	    		bean.setEfficacy(rs.getString("efficacy"));
	    		bean.setSymptom(rs.getString("symptom"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<RegisterBean> getChoList(String choSung, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		System.out.println(choSung);
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			if (choSung.equals("null") || choSung.equals("")) {
				sql = "select * from medicininfo limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  medicininfo where medicineName between ? and ? limit ? , ?";
				pstmt = con.prepareStatement(sql);
				if(choSung.equals("ㄱ")) {pstmt.setString(1, "가"); pstmt.setString(2, "깋"); }
				if(choSung.equals("ㄴ")) {pstmt.setString(1, "나"); pstmt.setString(2, "닣"); }
				if(choSung.equals("ㄷ")) {pstmt.setString(1, "다"); pstmt.setString(2, "딯"); }
				if(choSung.equals("ㄹ")) {pstmt.setString(1, "라"); pstmt.setString(2, "맇"); }
				if(choSung.equals("ㅁ")) {pstmt.setString(1, "마"); pstmt.setString(2, "밓"); }
				if(choSung.equals("ㅂ")) {pstmt.setString(1, "바"); pstmt.setString(2, "빟"); }
				if(choSung.equals("ㅅ")) {pstmt.setString(1, "사"); pstmt.setString(2, "싷"); }
				if(choSung.equals("ㅇ")) {pstmt.setString(1, "아"); pstmt.setString(2, "잏"); }
				if(choSung.equals("ㅈ")) {pstmt.setString(1, "자"); pstmt.setString(2, "짛"); }
				if(choSung.equals("ㅊ")) {pstmt.setString(1, "차"); pstmt.setString(2, "칳"); }
				if(choSung.equals("ㅋ")) {pstmt.setString(1, "카"); pstmt.setString(2, "킿"); }
				if(choSung.equals("ㅌ")) {pstmt.setString(1, "타"); pstmt.setString(2, "팋"); }
				if(choSung.equals("ㅍ")) {pstmt.setString(1, "파"); pstmt.setString(2, "핗"); }
				if(choSung.equals("ㅎ")) {pstmt.setString(1, "하"); pstmt.setString(2, "힣"); }
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RegisterBean bean = new RegisterBean();
	    		bean.setMedicine_Idx(rs.getInt("medicine_Idx"));
	    		bean.setMedicineName(rs.getString("medicineName"));
	    		bean.setManufactureName(rs.getString("manufactureName"));
	    		bean.setIngrediant(rs.getString("ingrediant"));
	    		bean.setMedicine_Efficacy(rs.getString("medicine_Efficacy"));
	    		bean.setDosage(rs.getString("dosage"));
	    		bean.setNtk(rs.getString("ntk"));
	    		bean.setCaution(rs.getString("caution"));
	    		bean.setWarningThings(rs.getString("warningThings"));
	    		bean.setAdverseReaction(rs.getString("adverseReaction"));
	    		bean.setStorageMethod(rs.getString("storageMethod"));
	    		bean.setAppearance(rs.getString("appearance"));
	    		bean.setImage(rs.getString("image"));
	    		bean.setDosageForm(rs.getString("dosageForm"));
	    		bean.setEfficacy(rs.getString("efficacy"));
	    		bean.setSymptom(rs.getString("symptom"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<RegisterBean> getSympList(String prodName, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			if (prodName.equals("null") || prodName.equals("")) {
				sql = "select * from medicininfo limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  medicininfo where medicineName" + " like ?  limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + prodName + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RegisterBean bean = new RegisterBean();
	    		bean.setMedicine_Idx(rs.getInt("medicine_Idx"));
	    		bean.setMedicineName(rs.getString("medicineName"));
	    		bean.setManufactureName(rs.getString("manufactureName"));
	    		bean.setIngrediant(rs.getString("ingrediant"));
	    		bean.setMedicine_Efficacy(rs.getString("medicine_Efficacy"));
	    		bean.setDosage(rs.getString("dosage"));
	    		bean.setNtk(rs.getString("ntk"));
	    		bean.setCaution(rs.getString("caution"));
	    		bean.setWarningThings(rs.getString("warningThings"));
	    		bean.setAdverseReaction(rs.getString("adverseReaction"));
	    		bean.setStorageMethod(rs.getString("storageMethod"));
	    		bean.setAppearance(rs.getString("appearance"));
	    		bean.setImage(rs.getString("image"));
	    		bean.setDosageForm(rs.getString("dosageForm"));
	    		bean.setEfficacy(rs.getString("efficacy"));
	    		bean.setSymptom(rs.getString("symptom"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	public Vector<RegisterBean> getAppearanceList(String prodName, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			if (prodName.equals("null") || prodName.equals("")) {
				sql = "select * from medicininfo limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  medicininfo where medicineName" + " like ?  limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + prodName + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RegisterBean bean = new RegisterBean();
	    		bean.setMedicine_Idx(rs.getInt("medicine_Idx"));
	    		bean.setMedicineName(rs.getString("medicineName"));
	    		bean.setManufactureName(rs.getString("manufactureName"));
	    		bean.setIngrediant(rs.getString("ingrediant"));
	    		bean.setMedicine_Efficacy(rs.getString("medicine_Efficacy"));
	    		bean.setDosage(rs.getString("dosage"));
	    		bean.setNtk(rs.getString("ntk"));
	    		bean.setCaution(rs.getString("caution"));
	    		bean.setWarningThings(rs.getString("warningThings"));
	    		bean.setAdverseReaction(rs.getString("adverseReaction"));
	    		bean.setStorageMethod(rs.getString("storageMethod"));
	    		bean.setAppearance(rs.getString("appearance"));
	    		bean.setImage(rs.getString("image"));
	    		bean.setDosageForm(rs.getString("dosageForm"));
	    		bean.setEfficacy(rs.getString("efficacy"));
	    		bean.setSymptom(rs.getString("symptom"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	   //총 게시물수
	   public int getTotalCount(String prodName) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      int totalCount = 0;
	      try {
	         con = pool.getConnection();
	         if (prodName.equals("null") || prodName.equals("")) { //검색창에 아무것도 안 써 있을 경우
	            sql = "select count(medicine_Idx) from medicininfo";
	            pstmt = con.prepareStatement(sql);
	         } else {
	            sql = "select count(medicine_Idx) from medicininfo where medicineName" + " like ? ";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, "%" + prodName+ "%");
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
	   // 게시물 리턴
	   public RegisterBean getBoard(int num) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      RegisterBean bean = new RegisterBean();
	      try {
	         con = pool.getConnection();
	         sql = "select * from medicininfo where medicine_Idx=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
		    		bean.setMedicine_Idx(rs.getInt("medicine_Idx"));
		    		bean.setMedicineName(rs.getString("medicineName"));
		    		bean.setManufactureName(rs.getString("manufactureName"));
		    		bean.setIngrediant(rs.getString("ingrediant"));
		    		bean.setMedicine_Efficacy(rs.getString("medicine_Efficacy"));
		    		bean.setDosage(rs.getString("dosage"));
		    		bean.setNtk(rs.getString("ntk"));
		    		bean.setCaution(rs.getString("caution"));
		    		bean.setWarningThings(rs.getString("warningThings"));
		    		bean.setAdverseReaction(rs.getString("adverseReaction"));
		    		bean.setStorageMethod(rs.getString("storageMethod"));
		    		bean.setAppearance(rs.getString("appearance"));
		    		bean.setImage(rs.getString("image"));
		    		bean.setDosageForm(rs.getString("dosageForm"));
		    		bean.setEfficacy(rs.getString("efficacy"));
		    		bean.setSymptom(rs.getString("symptom"));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return bean;
	   }
	   
}
