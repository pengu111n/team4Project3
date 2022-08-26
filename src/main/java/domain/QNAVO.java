package domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@ToString
public class QNAVO {

    @Getter
    @Setter
    private Integer qnaNo;
    @Getter
    @Setter
    private Integer memNo;
    @Getter
    @Setter
    private String nickName;
    @Getter
    @Setter
    private String category;
    @Getter
    @Setter
    private String qnaTitle;
    @Getter
    @Setter
    private String qnaContent;
    @Getter
    @Setter
    private Date qnaDate;
    @Getter
    @Setter
    private Integer status;
    @Getter
    @Setter
    private String answerContent;



    /*
     * @Getter
     *
     * @Setter private Integer viewcnt;
     */

//    @Override
//    public String toString() {
//        return "NoticeVO [noticeNo=" + noticeNo + ", memno=" + memno + ", nickname=" + nickname + ", noticeTitle=" + noticeTitle
//                + ", noticeContent=" + noticeContent + ", regDate=" + regDate + "]";
//    }


}
