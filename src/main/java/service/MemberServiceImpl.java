package service;


import domain.MemberVO;
import mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.servlet.http.HttpSession;

@Service
//@Configuration
//@MapperScan("mapper")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;


	@Override
	public void regist(MemberVO vo) throws Exception {
		mapper.create(vo);
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
}
