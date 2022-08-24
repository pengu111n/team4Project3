package service;

import domain.MemberVO;

public interface MyPageMemberService {

    public MemberVO get(int memno);

    public boolean modify(MemberVO member);

    public boolean remove(int memno);


}
