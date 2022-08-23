package domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@ToString
@Getter
@Setter
public class MemberVO {
    private Integer memno;
    
    private String nickname;

    
    private String id;
    
    private String pw;
    private String phonenum;
    private String email;
    private String address;
    private String companyNo;
    private String birth;
    private Integer rank;
    private String name;
    private Integer auth;
    private String fullname;

}

