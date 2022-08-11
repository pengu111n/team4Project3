package mapper;

import domain.MemberVO;

public interface MyPageMemberMapper {

    public MemberVO read(Long memno);

    public int delete(Long memno);

    public int update(MemberVO member);

}
