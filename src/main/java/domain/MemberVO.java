package domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class MemberVO {
    @Getter
    @Setter
    private Integer memno;
    @Getter
    @Setter
    private String nickname;
    @Getter
    @Setter
    private String id;
    @Getter
    @Setter
    private String pw;
    @Getter
    @Setter
    private String phonenum;
    @Getter
    @Setter
    private String email;
    @Getter
    @Setter
    private String address;
    @Getter
    @Setter
    private String companyNo;
    @Getter
    @Setter
    private Date birth;
    @Getter
    @Setter
    private Integer rank;



}
