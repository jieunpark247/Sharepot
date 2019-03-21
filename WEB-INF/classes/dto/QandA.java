package dto;

import java.sql.Timestamp;

public class QandA {
	private int qna_no;
	private int member_id;
	private String title;
	private String content;
	private Timestamp date;
	private int hits;
	private int isAns;
	
	
	public QandA(int qna_no, int member_id, String title, String content, Timestamp date, int hits, int isAns) {
		super();
		this.qna_no = qna_no;
		this.member_id = member_id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hits = hits;
		this.isAns = isAns;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
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
	public int getIsAns() {
		return isAns;
	}
	public void setIsAns(int isAns) {
		this.isAns = isAns;
	}
	
	
	
}
