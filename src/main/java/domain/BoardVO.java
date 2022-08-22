package domain;

import lombok.Data;

@Data
public class BoardVO {
	private Integer boardNo;
	private String id;
	private String nickname;
	private int memNo;
	private String title;
	private String regDate;
	private String modifiedDate;
	private String category;
	private String address;
	private int area;
	private String startDate;
	private String endDate;
	private String budget;
	private String part;
	private String require;
	private String[] image;
	private int view_count;
}