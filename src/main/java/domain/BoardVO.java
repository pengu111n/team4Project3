package domain;

import java.util.Date;

public class BoardVO {
	private Integer boardNo;
	private String id;

	private String nickname;

	private int memNo;



	public void setId(String id) {
		this.id = id;
	}

	private String title;
	private Date regDate;
	private Date modifiedDate;
	private String category;
	private String address;
	private int area;
	private String startDate;
	private String endDate;
	private String budget;
	private String part;
	private String require;
	private String image;
	private int view_count;

	public Integer getBoardNo() {
		return boardNo;
	}
	public String getId() {
		return id;
	}
	public String getNickname() {
		return nickname;
	}
	public int getMemNo() {
		return memNo;
	}

	public String getTitle() {
		return title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public String getCategory() {
		return category;
	}
	public String getAddress() {
		return address;
	}
	public int getArea() {
		return area;
	}
	public String getStartDate() {
		return startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public String getBudget() {
		return budget;
	}
	public String getPart() {
		return part;
	}
	public String getRequire() {
		return require;
	}
	public String getImage() {
		return image;
	}
	public int getView_count() {
		return view_count;
	}


	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public void setRequire(String require) {
		this.require = require;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
}
