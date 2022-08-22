package mapper;

import domain.MemberVO;
import domain.LoginDTO;

public interface MemberMapper {

    public MemberVO login(LoginDTO vo);

}
