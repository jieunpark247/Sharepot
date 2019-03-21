package dto;

import java.sql.Timestamp;


public class Rent {
	private int rent_id;
	private int item_no;
	private String item_name;
	private int member_id;
	private Timestamp rent_date;
	private Timestamp return_date;
	private int state;
	private int fee;
	private int item_cost;
	private String img;
	private String location;
	
	public Rent(){
		
	}
	


	public Rent(int rent_id, int item_no, String item_name, int member_id, Timestamp rent_date, Timestamp return_date,
			int state, int fee, int item_cost, String img,String location) {
		super();
		this.rent_id = rent_id;
		this.item_no = item_no;
		this.item_name = item_name;
		this.member_id = member_id;
		this.rent_date = rent_date;
		this.return_date = return_date;
		this.state = state;
		this.fee = fee;
		this.item_cost = item_cost;
		this.img = img;
		this.location=location;
	}
	
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getItem_cost() {
		return item_cost;
	}

	public void setItem_cost(int item_cost) {
		this.item_cost = item_cost;
	}

	public String getItem_name() {
		return item_name;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}


	public int getRent_id() {
		return rent_id;
	}
	public void setRent_id(int rent_id) {
		this.rent_id = rent_id;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
	
	public Timestamp getRent_date() {
		return rent_date;
	}


	public void setRent_date(Timestamp rent_date) {
		this.rent_date = rent_date;
	}


	public Timestamp getReturn_date() {
		return return_date;
	}


	public void setReturn_date(Timestamp return_date) {
		this.return_date = return_date;
	}


	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	
	
}
