package dto;

import java.sql.Timestamp;

public class Offer {
	private int history_no;
	private String name;
	private String img;
	private String location;
	private Timestamp date;
	private int state;
	
	public Offer(int history_no, String name, String img, String location, Timestamp date,int state) {
		super();
		this.history_no = history_no;
		this.name = name;
		this.img = img;
		this.location = location;
		this.date = date;
		this.state=state;
	}


	public int getState() {
		return state;
	}


	public void setState(int state) {
		this.state = state;
	}


	public int getHistory_no() {
		return history_no;
	}


	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public Timestamp getDate() {
		return date;
	}


	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
	
}
