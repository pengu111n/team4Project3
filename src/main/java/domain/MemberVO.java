package domain;

public class MemberVO {
	private Integer memno;
	private String nickname;
	private String id;
	private Integer phonenum;
	private String pw;
	private String name;
	private String address;
	private String companyno;
	private Integer birth;
	private String memimg;
	private Integer rank;
	public Integer getMemno() {
		return memno;
	}
	public void setMemno(Integer memno) {
		this.memno = memno;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(Integer phonenum) {
		this.phonenum = phonenum;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCompanyno() {
		return companyno;
	}
	public void setCompanyno(String companyno) {
		this.companyno = companyno;
	}
	public Integer getBirth() {
		return birth;
	}
	public void setBirth(Integer birth) {
		this.birth = birth;
	}
	public String getMemimg() {
		return memimg;
	}
	public void setMemimg(String memimg) {
		this.memimg = memimg;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "MemberVO [memno=" + memno + ", nickname=" + nickname + ", id=" + id + ", phonenum=" + phonenum + ", pw="
				+ pw + ", name=" + name + ", address=" + address + ", companyno=" + companyno + ", birth=" + birth
				+ ", memimg=" + memimg + ", rank=" + rank + "]";
	}



}