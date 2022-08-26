package service;


import domain.LoginDTO;
import domain.MemberVO;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

public interface MemberService {


	public void regist(MemberVO vo, String local) throws Exception;

	public void modify(MemberVO vo) throws  Exception;

	public void remove(Integer memNo) throws  Exception;
  
	public int idCheck(String id) throws Exception;

	public int nicknameCheck(String nickName) throws Exception;


	public void memberAuth(String email, String authKey) throws Exception;

	public List<String> getAttachImg(Integer memNo)throws Exception;

	public void deleteImg(Integer memNo)throws Exception;

	public void replaceImg(String fullName, Integer memNo)throws Exception;
  
  public MemberVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String id, String sessionId, Date next)throws Exception;

	public MemberVO checkLoginBefore(String value);

	public MemberVO checkMemberWithSessionKey(String value);

	public String findById(String id) throws Exception;
}

