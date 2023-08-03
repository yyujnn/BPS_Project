package kr.smhrd.model;

public class CalendarVO {
	private String cd_id;
	private String cd_title;
	private String cd_place;
	private String cd_start_date;
	private String cd_end_date;
	private String cd_content;
	private String user_id;
	

	
	public CalendarVO(String cd_id, String cd_title, String cd_place, String cd_start_date, String cd_end_date,
			String cd_content, String user_id) {
		this.cd_id = cd_id;
		this.cd_title = cd_title;
		this.cd_place = cd_place;
		this.cd_start_date = cd_start_date;
		this.cd_end_date = cd_end_date;
		this.cd_content = cd_content;
		this.user_id = user_id;
	}

	public CalendarVO() {
		// TODO Auto-generated constructor stub
	}

	public String getCd_id() {
		return cd_id;
	}

	public void setCd_id(String cd_id) {
		this.cd_id = cd_id;
	}

	public String getCd_title() {
		return cd_title;
	}

	public void setCd_title(String cd_title) {
		this.cd_title = cd_title;
	}

	public String getCd_place() {
		return cd_place;
	}

	public void setCd_place(String cd_place) {
		this.cd_place = cd_place;
	}

	public String getCd_start_date() {
		return cd_start_date;
	}

	public void setCd_start_date(String cd_start_date) {
		this.cd_start_date = cd_start_date;
	}

	public String getCd_end_date() {
		return cd_end_date;
	}

	public void setCd_end_date(String cd_end_date) {
		this.cd_end_date = cd_end_date;
	}

	public String getCd_content() {
		return cd_content;
	}

	public void setCd_content(String cd_content) {
		this.cd_content = cd_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	}


