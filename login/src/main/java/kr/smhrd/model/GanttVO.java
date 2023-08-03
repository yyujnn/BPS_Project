package kr.smhrd.model;

import java.math.BigDecimal;

public class GanttVO extends MemberVO {

	// 필드명을 데이터베이스 테이블의 컬럼명이랑 일치 시키기
	private String GANTT_ID;
	private String TITLE;
	private String START_DATE;
	private int DUR;
	private String GT_TYPE;
	private String GT_PARENT;
	private BigDecimal PROGRESS;
	private String USER_ID;

	public GanttVO(String GANTT_ID, String TITLE, String START_DATE, int DUR, String GT_TYPE, String GT_PARENT,
			BigDecimal PROGRESS, String USER_ID) {
		super();
		this.GANTT_ID = GANTT_ID;
		this.TITLE = TITLE;
		this.START_DATE = START_DATE;
		this.DUR = DUR;
		this.GT_TYPE = GT_TYPE;
		this.GT_PARENT = GT_PARENT;
		this.PROGRESS = PROGRESS;
		this.USER_ID=USER_ID;
	}

	public BigDecimal getPROGRESS() {
		return PROGRESS;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String USER_ID) {
		this.USER_ID = USER_ID;
	}

	public void setPROGRESS(BigDecimal PROGRESS) {
		this.PROGRESS = PROGRESS;
	}

	public String getGANTT_ID() {
		return GANTT_ID;
	}

	public void setGANTT_ID(String GANTT_ID) {
		this.GANTT_ID = GANTT_ID;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String TITLE) {
		this.TITLE = TITLE;
	}

	public String getSTART_DATE() {
		return START_DATE;
	}

	public void setSTART_DATE(String START_DATE) {
		this.START_DATE = START_DATE;
	}

	public int getDUR() {
		return DUR;
	}

	public void setDUR(int DUR) {
		this.DUR = DUR;
	}

	public String getGT_TYPE() {
		return GT_TYPE;
	}

	public void setGT_TYPE(String GT_TYPE) {
		this.GT_TYPE = GT_TYPE;
	}

	public String getGT_PARENT() {
		return GT_PARENT;
	}

	public void setGT_PARENT(String GT_PARENT) {
		this.GT_PARENT = GT_PARENT;
	}

	public GanttVO() {
	}



}
