package mapper;

import java.util.Date;
import java.util.Map;

import domain.MemberVO;
import dto.LoginDTO;

public interface MemberMapper {
	/* public List<UserVO> login() throws Exception; */

	public MemberVO login(LoginDTO dto) throws Exception;


	public void keepLogin(String id, String sessionId, Date next) ;

	public void keepLogin(Map<String, Object> paramMap);

	//static MemberVO selectSession(String sessionId) {
	// TODO Auto-generated method stub
	//return null;
	//}


	//public void keepLogin(String sessionId, Date limitTime, String account);
	// TODO Auto-generated method stub

	public MemberVO checkLoginBefore(String value);

	public MemberVO checkMemberWithSessionKey(String value);



	//public void update(String string, Map<String, Object> paramMap);










	/*
	 * public static void update(String string, Map<String, Object> paramMap) { //
	 * TODO Auto-generated method stub
	 *
	 * }
	 *
	 *
	 * public static MemberVO selectOne(String string, String value) { // TODO
	 * Auto-generated method stub return null; }
	 */



	/* public void insertUser(UserVO user) throws Exception; */


	/* public void keepLogin(String sessionId, Date limitDate, String account); */
	/*
	 * public void keepLogin(String id, String sessionId, Date next );
	 *
	 * public MemberVO checkMemberWithSessionKey(String value);
	 */

}



