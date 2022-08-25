package service;

import domain.BoardVO;
import domain.CboardVO;
import domain.MemberVO;

import java.util.List;

public interface MyPageBoardService {

    public List<BoardVO> getGeneralList(int memNo);

    public List<CboardVO> getBusinessList(int memNo);

    public MemberVO findByMemNo(Integer memNo) throws Exception;

}
