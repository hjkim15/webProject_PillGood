package project;

public class pharmacistBean {
	private String userId;
	private int pcode;
	private int career;
	
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setCareer(int career) {
		this.career = career;
	}

	public int getCareer() {
		return this.career;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public int getPcode() {
		return this.pcode;
	}
}
