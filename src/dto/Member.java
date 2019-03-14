package dto;

import java.sql.Timestamp;

public class Member {
	private int member_id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private String birth_date;
	private Timestamp date;
	private boolean email_chek;
	
	
	public Member(int member_id, String name, String pw, String tel, String email, String birth_date, Timestamp date,
			boolean email_chek) {
		super();
		this.member_id = member_id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.birth_date = birth_date;
		this.date = date;
		this.email_chek = email_chek;
	}


	public int getId() {
		return member_id;
	}
	public void setId(int id) {
		this.member_id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}


	public int getMember_id() {
		return member_id;
	}


	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getBirth_date() {
		return birth_date;
	}


	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}


	public Timestamp getDate() {
		return date;
	}


	public void setDate(Timestamp date) {
		this.date = date;
	}


	public boolean isEmail_chek() {
		return email_chek;
	}


	public void setEmail_chek(boolean email_chek) {
		this.email_chek = email_chek;
	}
	
	
	
}
