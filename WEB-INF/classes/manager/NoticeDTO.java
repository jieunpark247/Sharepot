package manager;

import java.sql.Timestamp;

public class NoticeDTO {
	private int notice_no;
	private String manager_id;
	private String title; 
	private String content; 
	private Timestamp date;
	private int hits;
	
	public int getNotice_no() {
		return notice_no;
	}


	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}


	public String getManager_id() {
		return manager_id;
	}


	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Timestamp getDate() {
		return date;
	}


	public void setDate(Timestamp date) {
		this.date = date;
	}


	public int getHits() {
		return hits;
	}


	public void setHits(int hits) {
		this.hits = hits;
	}
	
}
