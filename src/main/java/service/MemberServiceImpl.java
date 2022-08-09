package service;


import domain.MemberVO;
import mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import persistence.MemberDAO;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
//@Configuration
//@MapperScan("mapper")
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;


	@Override
	public void regist(MemberVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void modify(MemberVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(Integer memno) throws Exception {
		dao.delete(memno);
	}

	@Override
	public String login(MemberVO vo, HttpSession session) throws Exception {
		dao.login(vo);
		if(dao != null){
			session.setAttribute("authUser", dao);
		}
	return null;
	}

	@Override
	public void logout(HttpSession session) {

	}

	@Override
	public int idCheck(String id) throws Exception {
		int cnt = dao.idCheck(id);
		return cnt;
	}
}
