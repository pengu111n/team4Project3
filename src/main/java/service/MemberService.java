package service;

import java.util.Date;

import domain.MemberVO;
import dto.LoginDTO;


public interface MemberService {

	public MemberVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String id, String sessionId, Date next)throws Exception;

	public MemberVO checkLoginBefore(String value);

	public MemberVO checkMemberWithSessionKey(String value);
}




