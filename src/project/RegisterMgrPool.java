package project;

import java.util.*;
import java.sql.*;

public class RegisterMgrPool {
   private DBConnectionMgr pool = null;
   
   public String[] showEfficacy;
   
   public RegisterMgrPool() {
	   try {
		   pool = DBConnectionMgr.getInstance();
	   }catch(Exception e) {
		   System.out.println("Error : 커네션 얻어오기 실패");
	   }
   }
   
   public Vector<RegisterBean> getRegisterList(){
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<RegisterBean> vlist = new Vector<RegisterBean>();
	    try {
	    	conn = pool.getConnection();
	    	String strQuery = "select * from medicininfo";
	    	stmt = conn.createStatement();
	    	rs = stmt.executeQuery(strQuery);
	    	while(rs.next()) {
	    		RegisterBean regBean = new RegisterBean();
	    		regBean.setMedicine_Idx(rs.getInt("medicine_Idx"));
	    		regBean.setMedicineName(rs.getString("medicineName"));
	    		regBean.setManufactureName(rs.getString("manufactureName"));
	    		regBean.setIngrediant(rs.getString("ingrediant"));
	    		regBean.setMedicine_Efficacy(rs.getString("medicine_Efficacy"));
	    		regBean.setDosage(rs.getString("dosage"));
	    		regBean.setNtk(rs.getString("ntk"));
	    		regBean.setCaution(rs.getString("caution"));
	    		regBean.setWarningThings(rs.getString("warningThings"));
	    		regBean.setAdverseReaction(rs.getString("adverseReaction"));
	    		regBean.setStorageMethod(rs.getString("storageMethod"));
	    		regBean.setAppearance(rs.getString("appearance"));
	    		regBean.setImage(rs.getString("image"));
	    		regBean.setDosageForm(rs.getString("dosageForm"));
	    		regBean.setEfficacy(rs.getString("efficacy"));
	    		regBean.setSymptom(rs.getString("symptom"));
	    		vlist.add(regBean);
	    	}
	    }catch(Exception ex) {
	    	System.out.println("Exception" + ex);
	    }finally {
	    	pool.freeConnection(conn);
	    }
	    return vlist;
   }
   
}
