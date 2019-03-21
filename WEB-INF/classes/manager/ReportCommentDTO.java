package manager;

import java.sql.Timestamp;

public class ReportCommentDTO {
	private int comment_no;
	private int  manager_id;
	private int  report_no;
	private String content;
	private Timestamp date;
	private int ref;
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
}
