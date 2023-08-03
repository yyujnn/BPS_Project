package kr.smhrd.model;

public class MemberVO {

	// 필드명을 데이터베이스 테이블의 컬럼명이랑 일치 시키기
	private String USER_ID;
	private String USER_PW;
	private String USER_NAME;

	public MemberVO(String USER_ID, String USER_PW, String USER_NAME) {
		super();
		this.USER_ID = USER_ID;
		this.USER_PW = USER_PW;
		this.USER_NAME = USER_NAME;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String USER_ID) {
		this.USER_ID = USER_ID;
	}
	public String getUSER_PW() {
		return USER_PW;
	}
	public void setUSER_PW(String USER_PW) {
		this.USER_PW = USER_PW;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String USER_NAME) {
		this.USER_NAME = USER_NAME;
	}
	// 기본생성자
	public MemberVO() {
	}

}
