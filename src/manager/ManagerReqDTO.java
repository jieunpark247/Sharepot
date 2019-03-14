package manager;

public class ManagerReqDTO {

	private int recommend_no;			
	private String member_id;			
	private String name;		
	private String content;		
	private String recommend_date;		
	private int hits;
	public int getRecommend_no() {
		return recommend_no;
	}
	public void setRecommend_no(int recommend_no) {
		this.recommend_no = recommend_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getRecommend_date() {
		return recommend_date;
	}
	public void setRecommend_date(String recommend_date) {
		this.recommend_date = recommend_date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
		


	
	
}
