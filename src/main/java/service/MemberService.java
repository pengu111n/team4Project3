package service;

import domain.MemberVO;
import org.apache.ibatis.annotations.Param;

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

	public void attachImg(String fullName)throws Exception;
	public List<String> getAttachImg(Integer memno)throws Exception;

	public void deleteImg(Integer memno)throws Exception;

	public void replaceImg(String fullName, Integer memno)throws Exception;
}
