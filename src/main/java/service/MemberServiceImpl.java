package service;


import domain.MemberVO;
import mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.inject.Inject;
import java.util.List;

@Service
//@Configuration
//@MapperScan("mapper")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper memberMapper;
	@Inject
	private SqlSession session;
	private static String namespace = "mapper.MemberMapper";

	@Override
	public void create(MemberVO memberVO) throws Exception{
		session.insert(namespace + ".create", memberVO);
	}

}
