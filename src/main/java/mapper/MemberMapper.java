package mapper;

import domain.LoginDTO;
import domain.MemberVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;


public interface MemberMapper {
	public void create(MemberVO vo) throws Exception;

	public void update(MemberVO vo) throws Exception;

	public void delete(Integer memno) throws Exception;


	public int idCheck(String id) throws Exception;

	public int nicknameCheck(String nickname) throws Exception;

	public void createAuth(String email, String authKey) throws Exception;
	public void memberAuth(String email, String authKey) throws Exception;

	public void attachImg(String fullName)throws Exception;

	public List<String> getAttachImg(Integer memno)throws Exception;

	public void deleteImg(Integer memno)throws Exception;

	public void replaceImg(@Param("fullName")String fullName, @Param("memno")Integer memno)throws Exception;

	public void replaceImg(Map<String, Object> paramMap);
  
  public MemberVO login(LoginDTO dto) throws Exception;


	public void keepLogin(String id, String sessionId, Date next) ;

	public void keepLogin(Map<String, Object> paramMap);

	public MemberVO checkLoginBefore(String value);

	public MemberVO checkMemberWithSessionKey(String value);

	public String findById(String id) throws Exception;
}

