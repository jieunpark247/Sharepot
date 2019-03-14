package manager;

import java.sql.Timestamp;

public class rentDTO {
	private String item_name;
	private int rent_id;
	private Timestamp return_date;
	private Timestamp rent_date;
	private int state;	
	private int fee;
	private int member_id;


	public String getItem_name() {
		return item_name;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
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

	public Timestamp getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Timestamp return_date) {
		this.return_date = return_date;
	}

	public Timestamp getRent_date() {
		return rent_date;
	}

	public void setRent_date(Timestamp rent_date) {
		this.rent_date = rent_date;
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
