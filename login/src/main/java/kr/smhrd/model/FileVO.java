package kr.smhrd.model;

public class FileVO {

	private String ac_id;
	private String post_id;
	private String file_name;
	private String real_file_name;

	public FileVO() {
	}

	public FileVO(String ac_id, String post_id, String file_name, String real_file_name) {
		super();
		this.ac_id = ac_id;
		this.post_id = post_id;
		this.file_name = file_name;
		this.real_file_name = real_file_name;
	}

	public String getAc_id() {
		return ac_id;
	}

	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getReal_file_name() {
		return real_file_name;
	}

	public void setReal_file_name(String real_file_name) {
		this.real_file_name = real_file_name;
	}

}
