package service;

import domain.MemberVO;
import domain.LoginVO;

public interface MemberService {

    public MemberVO login(LoginVO vo) throws Exception;

}
