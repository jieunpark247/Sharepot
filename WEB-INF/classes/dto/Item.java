package dto;

public class Item {
	private int member_id;
	private int item_no;
	private String item_name;
	private int state;
	private String location;
	private String img;
	
	public Item(int member_id, int item_no, String item_name,int state,String location, String img) {
		super();
		this.member_id = member_id;
		this.item_no = item_no;
		this.item_name = item_name;
		this.state= state; 
		this.location = location;
		this.img = img;
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

	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
}
