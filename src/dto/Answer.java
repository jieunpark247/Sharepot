package dto;

import java.sql.Timestamp;

public class Answer {
	private int comment_no;
	private int qna_no;
	private Timestamp date;
	private String content;
	private int manager_id;
	private int ref;
	
	
	public Answer(int comment_no, int qna_no, Timestamp date, String content, int manager_id, int ref) {
		super();
		this.comment_no = comment_no;
		this.qna_no = qna_no;
		this.date = date;
		this.content = content;
		this.manager_id = manager_id;
		this.ref = ref;
	}
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	
	
}
