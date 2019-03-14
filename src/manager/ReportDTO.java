package manager;

import java.sql.Timestamp;

public class ReportDTO {
	private int report_no;
	private int member_id;
	private String title;
	private String content; 
	private String report_option; 
	private Timestamp date ;
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
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
	public String getReport_option() {
		return report_option;
	}
	public void setReport_option(String report_option) {
		this.report_option = report_option;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
