package kr.smhrd.model;

public class MemberVO {
	
	// 필드명을 데이터베이스 테이블의 컬럼명이랑 일치 시키기
	private String email;
	private String pw;
	private String tel;
	private String address;
	
	public MemberVO(String email, String pw, String tel, String address) {
		super();
		this.email = email;
		this.pw = pw;
		this.tel = tel;
		this.address = address;
	}
	// 기본생성자
	public MemberVO() {
	}

	// getter, setter method
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
	
	

}
