package manager;

import java.sql.Timestamp;

public class ManagerOfferDTO {

	int history_no;
	String member_id;
	String offer_no;
	String date;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	int amount;
	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOffer_no() {
		return offer_no;
	}
	public void setOffer_no(String offer_no) {
		this.offer_no = offer_no;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
