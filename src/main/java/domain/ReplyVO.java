package domain;

import java.util.Date;

public class ReplyVO {
  private Integer replyNo;
  private Integer boardNo;
  private String replyContent;
  private String regDate;
  private String updateDate;
  private String nickName;



  public Integer getReplyNo() {
    return replyNo;
  }

  public ReplyVO setReplyNo(Integer replyNo) {
    this.replyNo = replyNo;
    return this;
  }

  public Integer getBoardNo() {
    return boardNo;
  }

  public ReplyVO setBoardNo(Integer boardNo) {
    this.boardNo = boardNo;
    return this;
  }

  public String getReplyContent() {
    return replyContent;
  }

  public ReplyVO setReplyContent(String replyContent) {
    this.replyContent = replyContent;
    return this;
  }

  public String getRegDate() {
    return regDate;
  }

  public ReplyVO setRegDate(String regDate) {
    this.regDate = regDate;
    return this;
  }

  public String getUpdateDate() {
    return updateDate;
  }

  public ReplyVO setUpdateDate(String updateDate) {
    this.updateDate = updateDate;
    return this;
  }


  public String getNickName() {
    return nickName;
  }

  public ReplyVO setNickName(String nickName) {
    this.nickName = nickName;
    return this;
  }
}
