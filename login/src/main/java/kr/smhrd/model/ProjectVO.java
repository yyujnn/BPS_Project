package kr.smhrd.model;

public class ProjectVO extends MemberVO {

	private String PROJECT_ID;
	private String USER_ID;
	private String PROJECT_NAME;
	private String PROJECT_COM;
	private String PROJECT_START;
	private String PROJETCT_END;

	public ProjectVO(String PROJECT_ID, String USER_ID, String PROJECT_NAME, String PROJECT_COM, String PROJECT_START,
			String PROJETCT_END) {
		super();
		this.PROJECT_ID = PROJECT_ID;
		this.USER_ID = USER_ID;
		this.PROJECT_NAME = PROJECT_NAME;
		this.PROJECT_COM = PROJECT_COM;
		this.PROJECT_START = PROJECT_START;
		this.PROJETCT_END = PROJETCT_END;
	}

	// 기본생성자
	public ProjectVO() {
	}

	public String getPROJECT_ID() {
		return PROJECT_ID;
	}

	public void setPROJECT_ID(String PROJECT_ID) {
		this.PROJECT_ID = PROJECT_ID;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String USER_ID) {
		this.USER_ID = USER_ID;
	}

	public String getPROJECT_NAME() {
		return PROJECT_NAME;
	}

	public void setPROJECT_NAME(String PROJECT_NAME) {
		this.PROJECT_NAME = PROJECT_NAME;
	}

	public String getPROJECT_COM() {
		return PROJECT_COM;
	}

	public void setPROJECT_COM(String PROJECT_COM) {
		this.PROJECT_COM = PROJECT_COM;
	}

	public String getPROJECT_START() {
		return PROJECT_START;
	}

	public void setPROJECT_START(String PROJECT_START) {
		this.PROJECT_START = PROJECT_START;
	}

	public String getPROJETCT_END() {
		return PROJETCT_END;
	}

	public void setPROJETCT_END(String PROJETCT_END) {
		this.PROJETCT_END = PROJETCT_END;
	}

}
