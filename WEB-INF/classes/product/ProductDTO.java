package product;

import java.util.Date;

public class ProductDTO {
	private int item_no;
	private String item_name;
	private String img;
	private int state;
	private String location;
	private int cost;
	private Date date;
	private int count;
	private boolean interest_state;
	private String interest_state_img = "images/heartEmpty.png";
	
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public boolean getInterest_state() {
		return interest_state;
	}
	public void setInterest_state(boolean interest_state) {
		
		if(interest_state == true) {
			setInterest_state_img("images/heartFull.png");
		}else {
			setInterest_state_img("images/heartEmpty.png");
		}
		
		this.interest_state = interest_state;
	}
	
	public String getInterest_state_img() {
		return interest_state_img;
	}
	
	public void setInterest_state_img(String interest_state_img) {
		this.interest_state_img = interest_state_img;
	}
}
