package service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import domain.MemberVO;
import dto.LoginDTO;
import mapper.MemberMapper;

//@Configuration
@Service

public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberMapper mapper;

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return mapper.login(dto);
	}
	@Override
	public void keepLogin(String id, String sessionId, Date next) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);


		mapper.keepLogin(paramMap);

	}

	@Override
	public MemberVO checkLoginBefore(String value) {

		return mapper.checkMemberWithSessionKey(value);
	}
	@Override
	public MemberVO checkMemberWithSessionKey(String value) {
		return mapper.checkMemberWithSessionKey(value);
	}
}







/*
 * @Override public void keepLogin(String id, String sessionId, Date next)
 * throws Exception {
 *
 * MemberMapper.keepLogin(id, sessionId, next);
 *
 * }
 */

//@Override
//public void keepLogin(String uid, String sessionId, Date next) {
//Map<String, Object> paramMap = new HashMap<String, Object>();
//paramMap.put("uid", uid);
//paramMap.put("sessionId", sessionId);
//paramMap.put("next", next);

//MemberMapper.update(namespace + ".keepLogin", paramMap);



//@Override
//public MemberVO checkMemberWithSessionKey(String value) {
//return MemberMapper.selectOne(namespace +".checkUserWithSessionKey", value)




/*
 * @Transactional
 *
 * public List<MemberVO> login() throws Exception { return MemberMapper.login();
 * }
 *
 *
 * @Override public void insertUser(MemberVO user) throws Exception {
 * MemberMapper.insertUser(user); }
 *
 *
 *
 * @Override public MemberVO checkMemberWithSessionKey(String value) { return
 * Session.selectOne(namespace +".checkMemberWithSessionKey", value); }
 *
 *
 *
 * @Override public MemberVO checkLoginBefore(String value) { // TODO
 * //Auto-generated method stub return
 * session.selectOne(namespace+".checkMemberWithSessionKey" , value); }
 *
 *
 *
 * @Override public void login(MemberVO vo) throws Exception { // TODO
 * Auto-generated method stub
 */





/*
 * @Override public void keepLogin(String Id, String sessionId, Date next)
 * throws Exception { // TODO Auto-generated method stub
 * memberMapper.keepLogin(Id, sessionId, next);
 *
 *
 */

/*
 * @Override public MemberVO checkLoginBefore(String value) {
 *
 * return memberMapper.checkUserWithSessionId(value);
 *
 * }
 */
