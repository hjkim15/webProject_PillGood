package project;

public class MemberBean {
private int user_Idx;
private String userId;
private String pw;
private String name;
private String email;
private int gender;
private String nickname;
private String symptom[];
private int userType;
private String birth;
private String img;

public void setUser_Idx(int user_Idx) {
   this.user_Idx = user_Idx;
}
public int getUser_Idx() {
   return user_Idx;
}
public void setUserId(String userId) {
   this.userId = userId;
}
public String getUserId() {
   return userId;
}
public void setPw(String pw) {
   this.pw = pw;
}
public String getPw() {
   return pw;
}
public void setName(String name) {
   this.name = name;
}
public String getName() {
   return name;
}
public void setEmail(String email) {
   this.email = email;
}
public String getEmail() {
   return email;
}
public void setGender(int gender) {
   this.gender = gender;
}
public int getGender() {
   return gender;
}
public void setNickname(String nickname) {
   this.nickname = nickname;
}
public String getNickname() {
   return nickname;
}
public void setSymptom(String[] symptom) {
   this.symptom = symptom;
}
public String[] getSymptom() {
   return symptom;
}
public void setUserType(int userType) {
   this.userType = userType;
}
public int getUserType() {
   return userType;
}
public void setBirth(String birth) {
   this.birth = birth;
}
public String getBirth() {
   return birth;
}
public void setImg(String img) {
	   this.img = img;
	}
	public String getImg() {
	   return this.img;
	}
}