package mapper;

import domain.MemberVO;

public interface MyPageMemberMapper {

    public MemberVO read(int memno);

    public int delete(int memno);

    public int update(MemberVO member);

}
