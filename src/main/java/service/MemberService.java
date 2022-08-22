package service;

import domain.MemberVO;
import domain.LoginDTO;

public interface MemberService {

    public MemberVO login(LoginDTO dto) throws Exception;

}
