package service;

import domain.MemberVO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MemberService {


	public void regist(MemberVO vo) throws Exception;

	public void modify(MemberVO vo) throws  Exception;

	public void remove(Integer memno) throws  Exception;

	public String login(MemberVO vo, HttpSession session) throws Exception;

	public void logout(HttpSession session) throws Exception;

	public int idCheck(String id) throws Exception;


	public void memberAuth(String email, String authKey) throws Exception;


}
