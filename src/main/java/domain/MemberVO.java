package domain;

import lombok.Data;

@Data
public class MemberVO {

    private Long memno;
    private String nickname;
    private String id;
    private String phonenum;
    private String email;
    private String pw;
    private String name;
    private String address;
    private String companyno;
    private Integer birth;
    private Integer rank;

}