package service;


import domain.MemberVO;
import mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import util.MailUtils;
import util.TempKey;


import javax.servlet.http.HttpSession;

@Service
//@Configuration
//@MapperScan("mapper")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public void regist(MemberVO vo) throws Exception {
		mapper.create(vo);

		String key = new TempKey().getKey(20);
		mapper.createAuth(vo.getEmail(), key);
		MailUtils mailUtils = new MailUtils(mailSender);
		mailUtils.setSubject("[당신의 인테리어에 대한 고민을 보다 쉽게! 인테리어 프렌드 인프! 인증 이메일 입니다.]");
		mailUtils.setText("" +
				"<h1>메일인증</h1>" +
				"<br/>"+vo.getNickname()+"님 "+
				"<br/>ICEWATER에 회원가입해주셔서 감사합니다."+
				"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
				"<a href='http://localhost:8080/member/registerEmail?email=" + vo.getEmail() +
				"&key=" + key +
				"' target='_blank'>이메일 인증 확인</a>");
	}

	@Override
	public void modify(MemberVO vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public void remove(Integer memno) throws Exception {
		mapper.delete(memno);
	}

	@Override
	public String login(MemberVO vo, HttpSession session) throws Exception {
		mapper.login(vo);
		if(mapper != null){
			session.setAttribute("authUser", mapper);
		}
	return null;
	}

	@Override
	public void logout(HttpSession session) {

	}

	@Override
	public int idCheck(String id) throws Exception {
		int cnt = mapper.idCheck(id);
		return cnt;
	}

	@Override
	public void createAuth(String memberEmail, String authKey) throws Exception {

	}

	@Override
	public void memberAuth(String memberEmail) throws Exception {

	}
}
