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
	
	//https://www.clien.net/service/board/kin/8445582 ����
	public Vector<RegisterBean> getChoList(String choSung, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			if (choSung.equals("null") || choSung.equals("")) {
				sql = "select * from medicininfo limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {

				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
				}
			if(choSung.equals("��")) {
				sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
						+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
				}
			if(choSung.equals("��")) {
				sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
						+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
				}
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
				}
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("��")) {		
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
						+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' AND medicineName  < 'ī' ) ORDER BY medicineName limit ?,?"; }
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= 'ī' AND medicineName  < 'Ÿ' ) ORDER BY medicineName limit ?,?";}
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= 'Ÿ' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?";
				}
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' AND medicineName  < '��' ) ORDER BY medicineName limit ?,?"; }
				if(choSung.equals("��")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
							+ "OR medicineName  >= '��' ) ORDER BY medicineName limit ? , ?"; }
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
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
	
	public Vector<RegisterBean> getSympList(String symptom, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			if (symptom.equals("null") || symptom.equals("")) {
				sql = "select * from medicininfo limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  medicininfo where symptom" + " like ?  limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + symptom + "%");
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

	public Vector<RegisterBean> getEfficacyList(String efficacy, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			con = pool.getConnection();
			if (efficacy.equals("null") || efficacy.equals("")) {
				sql = "select * from medicininfo limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				System.out.println(efficacy);
				sql = "select * from  medicininfo where efficacy" + " like ?  limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + efficacy + "%");
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
	   
	   public int getChoTotalCount(String choSung) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      int totalCount = 0;
		      try {
		         con = pool.getConnection();
		         if (choSung.equals("null") || choSung.equals("")) { //�˻�â�� �ƹ��͵� �� �� ���� ���
		            sql = "select count(medicine_Idx) from medicininfo";
		            pstmt = con.prepareStatement(sql);
		         } else {
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' AND medicineName  < '��' )";
						}
					if(choSung.equals("��")) {
						sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
								+ "OR medicineName  >= '��' AND medicineName  < '��' )";
						}
					if(choSung.equals("��")) {
						sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
								+ "OR medicineName  >= '��' AND medicineName  < '��' )";
						}
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' AND medicineName  < '��' )";
							}
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' AND medicineName  < '��' ) ";
						}
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' AND medicineName  < '��' ) ";
							}
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' AND medicineName  < '��' ) ";
							}
						if(choSung.equals("��")) {		
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
								+ "OR medicineName  >= '��' AND medicineName  < '��' ) ";
							}
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' AND medicineName  < '��' )";
							}
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' AND medicineName  < 'ī' ) "; }
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= 'ī' AND medicineName  < 'Ÿ' ) ";}
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= 'Ÿ' AND medicineName  < '��' ) ";
						}
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' AND medicineName  < '��' )"; }
						if(choSung.equals("��")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( �� | �� )' "
									+ "OR medicineName  >= '��' )"; }
						pstmt = con.prepareStatement(sql);
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
	   
	   public int getSympTotalCount(String symptom) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      int totalCount = 0;
		      try {
		         con = pool.getConnection();
		         if (symptom.equals("null") || symptom.equals("")) { //�˻�â�� �ƹ��͵� �� �� ���� ���
		            sql = "select count(medicine_Idx) from medicininfo";
		            pstmt = con.prepareStatement(sql);
		         } else {
		            sql = "select count(medicine_Idx) from medicininfo where symptom" + " like ? ";
		            pstmt = con.prepareStatement(sql);
		            pstmt.setString(1, "%" + symptom+ "%");
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
	   
	   
	   public int getEffiTotalCount(String efficacy) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      int totalCount = 0;
		      try {
		         con = pool.getConnection();
		         if (efficacy.equals("null") || efficacy.equals("")) { //�˻�â�� �ƹ��͵� �� �� ���� ���
		            sql = "select count(medicine_Idx) from medicininfo";
		            pstmt = con.prepareStatement(sql);
		         } else {
		            sql = "select count(medicine_Idx) from medicininfo where efficacy" + " like ? ";
		            pstmt = con.prepareStatement(sql);
		            pstmt.setString(1, "%" + efficacy+ "%");
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
