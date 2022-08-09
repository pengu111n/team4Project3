package persistence;

import domain.MemberVO;

public interface MemberDAO {
    public void create(MemberVO vo) throws Exception;

    public void update(MemberVO vo) throws Exception;

    public void delete(Integer memno) throws Exception;

    public void login(MemberVO vo) throws  Exception;

    public int idCheck(String id) throws Exception;
}
