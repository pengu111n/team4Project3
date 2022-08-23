package domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;

@ToString
@Getter
@Setter
public class MemberVO {
    private Integer memno;
    @NotNull(message = "닉네임를 입력해주세요.")
    private String nickname;

    @NotNull(message = "아이디를 입력해주세요.")
    private String id;
    @NotNull(message = "비밀번호를 입력해주세요.")
    private String pw;
    private String phonenum;
    private String email;
    private String address;
    private String companyNo;
    private String birth;
    private Integer rank;
    private String name;
    private Integer auth;
    private String filename;

}
