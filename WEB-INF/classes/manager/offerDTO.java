package manager;

import java.sql.Timestamp;

public class offerDTO {
	private int offer_no;
	private String name;
	private String img;
	private String location;
	private int amount;
	public int getOffer_no() {
		return offer_no;
	}
	public void setOffer_no(int offer_no) {
		this.offer_no = offer_no;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}


	
	
}
