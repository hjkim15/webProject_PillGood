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
	
	//https://www.clien.net/service/board/kin/8445582 참고
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

				if(choSung.equals("ㄱ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㄱ | ㄲ )' "
							+ "OR medicineName  >= '가' AND medicineName  < '나' ) ORDER BY medicineName limit ?,?";
				}
			if(choSung.equals("ㄴ")) {
				sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㄴ | ㄴ )' "
						+ "OR medicineName  >= '나' AND medicineName  < '다' ) ORDER BY medicineName limit ?,?";
				}
			if(choSung.equals("ㄷ")) {
				sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㄷ | ㄸ )' "
						+ "OR medicineName  >= '다' AND medicineName  < '라' ) ORDER BY medicineName limit ?,?";
				}
				if(choSung.equals("ㄹ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㄹ | ㄹ )' "
							+ "OR medicineName  >= '라' AND medicineName  < '마' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("ㅁ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅁ | ㅁ )' "
							+ "OR medicineName  >= '마' AND medicineName  < '바' ) ORDER BY medicineName limit ?,?";
				}
				if(choSung.equals("ㅂ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅂ | ㅃ )' "
							+ "OR medicineName  >= '바' AND medicineName  < '사' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("ㅅ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅅ | ㅆ )' "
							+ "OR medicineName  >= '사' AND medicineName  < '아' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("ㅇ")) {		
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅇ | ㅇ )' "
						+ "OR medicineName  >= '아' AND medicineName  < '자' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("ㅈ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅈ | ㅉ )' "
							+ "OR medicineName  >= '자' AND medicineName  < '차' ) ORDER BY medicineName limit ?,?";
					}
				if(choSung.equals("ㅊ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅊ | ㅊ )' "
							+ "OR medicineName  >= '차' AND medicineName  < '카' ) ORDER BY medicineName limit ?,?"; }
				if(choSung.equals("ㅋ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅋ | ㅋ )' "
							+ "OR medicineName  >= '카' AND medicineName  < '타' ) ORDER BY medicineName limit ?,?";}
				if(choSung.equals("ㅌ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅌ | ㅌ )' "
							+ "OR medicineName  >= '타' AND medicineName  < '파' ) ORDER BY medicineName limit ?,?";
				}
				if(choSung.equals("ㅍ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅍ | ㅍ )' "
							+ "OR medicineName  >= '파' AND medicineName  < '하' ) ORDER BY medicineName limit ?,?"; }
				if(choSung.equals("ㅎ")) {
					sql = "SELECT * FROM medicininfo WHERE (medicineName RLIKE '^( ㅎ | ㅎ )' "
							+ "OR medicineName  >= '하' ) ORDER BY medicineName limit ? , ?"; }
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
	   
	   public int getChoTotalCount(String choSung) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = null;
		      int totalCount = 0;
		      try {
		         con = pool.getConnection();
		         if (choSung.equals("null") || choSung.equals("")) { //검색창에 아무것도 안 써 있을 경우
		            sql = "select count(medicine_Idx) from medicininfo";
		            pstmt = con.prepareStatement(sql);
		         } else {
						if(choSung.equals("ㄱ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㄱ | ㄲ )' "
									+ "OR medicineName  >= '가' AND medicineName  < '나' )";
						}
					if(choSung.equals("ㄴ")) {
						sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㄴ | ㄴ )' "
								+ "OR medicineName  >= '나' AND medicineName  < '다' )";
						}
					if(choSung.equals("ㄷ")) {
						sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㄷ | ㄸ )' "
								+ "OR medicineName  >= '다' AND medicineName  < '라' )";
						}
						if(choSung.equals("ㄹ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㄹ | ㄹ )' "
									+ "OR medicineName  >= '라' AND medicineName  < '마' )";
							}
						if(choSung.equals("ㅁ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅁ | ㅁ )' "
									+ "OR medicineName  >= '마' AND medicineName  < '바' ) ";
						}
						if(choSung.equals("ㅂ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅂ | ㅃ )' "
									+ "OR medicineName  >= '바' AND medicineName  < '사' ) ";
							}
						if(choSung.equals("ㅅ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅅ | ㅆ )' "
									+ "OR medicineName  >= '사' AND medicineName  < '아' ) ";
							}
						if(choSung.equals("ㅇ")) {		
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅇ | ㅇ )' "
								+ "OR medicineName  >= '아' AND medicineName  < '자' ) ";
							}
						if(choSung.equals("ㅈ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅈ | ㅉ )' "
									+ "OR medicineName  >= '자' AND medicineName  < '차' )";
							}
						if(choSung.equals("ㅊ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅊ | ㅊ )' "
									+ "OR medicineName  >= '차' AND medicineName  < '카' ) "; }
						if(choSung.equals("ㅋ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅋ | ㅋ )' "
									+ "OR medicineName  >= '카' AND medicineName  < '타' ) ";}
						if(choSung.equals("ㅌ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅌ | ㅌ )' "
									+ "OR medicineName  >= '타' AND medicineName  < '파' ) ";
						}
						if(choSung.equals("ㅍ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅍ | ㅍ )' "
									+ "OR medicineName  >= '파' AND medicineName  < '하' )"; }
						if(choSung.equals("ㅎ")) {
							sql = "SELECT count(medicine_Idx) FROM medicininfo WHERE (medicineName RLIKE '^( ㅎ | ㅎ )' "
									+ "OR medicineName  >= '하' )"; }
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
		         if (symptom.equals("null") || symptom.equals("")) { //검색창에 아무것도 안 써 있을 경우
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
		         if (efficacy.equals("null") || efficacy.equals("")) { //검색창에 아무것도 안 써 있을 경우
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
