package service;

import domain.MemberVO;

public interface MyPageMemberService {

    public MemberVO get(Long memno);

    public boolean modify(MemberVO member);

    public boolean remove(Long memno);

}
