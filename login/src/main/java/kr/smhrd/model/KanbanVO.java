package kr.smhrd.model;

public class KanbanVO {
	private String project_ID;
	private String project_com;
	private String project_name;
	private String project_start;
	private String project_end;
	private String user_id;

	public KanbanVO() {

	}

	public KanbanVO(String project_ID, String project_com, String project_name, String project_start, String project_end,
			String kanban_id, String kanban_color, String user_id) {
		super();
		this.project_ID = project_ID;
		this.project_com = project_com;
		this.project_name = project_name;
		this.project_start = project_start;
		this.project_end = project_end;
		this.user_id = user_id;
	}

	public String getProject_ID() {
		return project_ID;
	}

	public void setProject_ID(String project_ID) {
		this.project_ID = project_ID;
	}

	public String getProject_com() {
		return project_com;
	}

	public void setProject_com(String project_com) {
		this.project_com = project_com;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProject_start() {
		return project_start;
	}

	public void setProject_start(String project_start) {
		this.project_start = project_start;
	}

	public String getProject_end() {
		return project_end;
	}

	public void setProject_end(String project_end) {
		this.project_end = project_end;
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
