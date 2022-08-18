package mapper;

import domain.MemberVO;
import domain.LoginVO;

public interface MemberMapper {

    public MemberVO login(LoginVO vo) throws Exception;

}
