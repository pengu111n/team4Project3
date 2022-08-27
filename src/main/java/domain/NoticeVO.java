package domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@ToString
public class NoticeVO {

    @Getter
    @Setter
    private Integer noticeNo;
    @Getter
    @Setter
    private String noticeTitle;
    @Getter
    @Setter
    private String noticeContent;
    @Getter
    @Setter
    private Date regDate;


}
