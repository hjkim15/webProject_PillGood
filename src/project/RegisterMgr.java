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
			System.out.println("Error : Ŀ�ؼ� ���� ����");
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
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "�L"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "�J"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "ī"); pstmt.setString(2, "�i"); }
				if(choSung.equals("��")) {pstmt.setString(1, "Ÿ"); pstmt.setString(2, "�M"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "��"); }
				if(choSung.equals("��")) {pstmt.setString(1, "��"); pstmt.setString(2, "�R"); }
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
	   //�� �Խù���
	   public int getTotalCount(String prodName) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      int totalCount = 0;
	      try {
	         con = pool.getConnection();
	         if (prodName.equals("null") || prodName.equals("")) { //�˻�â�� �ƹ��͵� �� �� ���� ���
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
	   // �Խù� ����
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
