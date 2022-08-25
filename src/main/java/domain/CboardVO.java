package domain;

import java.util.Arrays;
import java.util.Date;

public class CboardVO {
    private Integer cbno;
    private Integer memNo;
    private String nickname;
    private String companyName;
    private String address;

    private String phoneNum;
    private String email;
    private String ctitle;
    private String content;
    private String space;
    private String cnstType;
    private Integer area;
    private String cost;
    private String period;
    private Integer thumbsUp;
    private Date regDate;
    private Date modDate;
    private String[] files;
    public Integer getCbno() {
        return cbno;
    }
    public void setCbno(Integer cbno) {
        this.cbno = cbno;
    }
    public Integer getMemNo() {
        return memNo;
    }
    public void setMemNo(Integer memNo) {
        this.memNo = memNo;
    }
    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public String getCompanyName() {
        return companyName;
    }
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getPhoneNum() { return phoneNum; }

    public void setPhoneNum(String phoneNum) { this.phoneNum = phoneNum; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }
    public String getCtitle() {
        return ctitle;
    }
    public void setCtitle(String ctitle) {
        this.ctitle = ctitle;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getSpace() {
        return space;
    }
    public void setSpace(String space) {
        this.space = space;
    }
    public String getCnstType() {
        return cnstType;
    }
    public void setCnstType(String cnstType) {
        this.cnstType = cnstType;
    }
    public Integer getArea() {
        return area;
    }
    public void setArea(Integer area) {
        this.area = area;
    }
    public String getCost() {
        return cost;
    }
    public void setCost(String cost) {
        this.cost = cost;
    }
    public String getPeriod() {
        return period;
    }
    public void setPeriod(String period) {
        this.period = period;
    }
    public Integer getThumbsUp() {
        return thumbsUp;
    }
    public void setThumbsUp(Integer thumbsUp) {
        this.thumbsUp = thumbsUp;
    }
    public Date getRegDate() {
        return regDate;
    }
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
    public Date getModDate() {
        return modDate;
    }
    public void setModDate(Date modDate) {
        this.modDate = modDate;
    }
    public String[] getFiles() { return files; }
    public void setFiles(String[] files) { this.files = files; }

    @Override
    public String toString() {
        return "CboardVO{" +
                "cbno=" + cbno +
                ", memNo=" + memNo +
                ", nickname='" + nickname + '\'' +
                ", companyName='" + companyName + '\'' +
                ", address='" + address + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", email='" + email + '\'' +
                ", ctitle='" + ctitle + '\'' +
                ", content='" + content + '\'' +
                ", space='" + space + '\'' +
                ", cnstType='" + cnstType + '\'' +
                ", area=" + area +
                ", cost='" + cost + '\'' +
                ", period='" + period + '\'' +
                ", thumbsUp=" + thumbsUp +
                ", regDate=" + regDate +
                ", modDate=" + modDate +
                ", files=" + Arrays.toString(files) +
                '}';
    }
}
