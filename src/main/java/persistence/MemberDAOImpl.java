package persistence;

import domain.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class MemberDAOImpl implements MemberDAO{

    @Inject
    private SqlSession session;

    private static String namespace = "mapper.MemberMapper";

    @Override
    public void create(MemberVO vo)throws Exception{
        session.insert(namespace + ".create", vo);
    }

    @Override
    public void update(MemberVO vo) throws Exception {
        session.update(namespace + ".update", vo);
    }

    @Override
    public void delete(Integer memno) throws Exception {
        session.delete(namespace + ".delete", memno);
    }

    @Override
    public void login(MemberVO vo) throws Exception {
        session.selectOne(namespace + ".login", vo);
    }

    @Override
    public int idCheck(String id) throws Exception {
        int cnt = session.selectOne(namespace + ".idCheck", id);
        return cnt;
    }


}
