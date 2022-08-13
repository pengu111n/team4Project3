package domain;

import java.util.Date;

public class ReplyVO {

  private Integer replyNo;
  private Integer boardNo;
  private String replyConetent;
  private Date regDate;
  private Date updateDate;

  public Integer replyNo() {
    return replyNo;
  }

  public ReplyVO setReplyNo(Integer replyNo) {
    this.replyNo = replyNo;
    return this;
  }

  public Integer boardNo() {
    return boardNo;
  }

  public ReplyVO setBoardNo(Integer boardNo) {
    this.boardNo = boardNo;
    return this;
  }

  public String replyConetent() {
    return replyConetent;
  }

  public ReplyVO setReplyConetent(String replyConetent) {
    this.replyConetent = replyConetent;
    return this;
  }

  public Date regDate() {
    return regDate;
  }

  public ReplyVO setRegDate(Date regDate) {
    this.regDate = regDate;
    return this;
  }

  public Date updateDate() {
    return updateDate;
  }

  public ReplyVO setUpdateDate(Date updateDate) {
    this.updateDate = updateDate;
    return this;
  }
}
