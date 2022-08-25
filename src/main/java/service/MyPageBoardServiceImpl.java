package service;

import domain.BoardVO;
import domain.CboardVO;
import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.MyPageBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class MyPageBoardServiceImpl implements MyPageBoardService {

    @Setter(onMethod_ = @Autowired)
    private MyPageBoardMapper mapper;

    @Override
    public List<BoardVO> getGeneralList(int memNo) {
        return mapper.getGeneralList(memNo);
    }

    @Override
    public List<CboardVO> getBusinessList(int memNo) {
        return mapper.getBusinessList(memNo);
    }

    @Override
    public MemberVO findByMemNo(Integer memNo) throws Exception {
        MemberVO loginMember = mapper.findByMemNo(memNo);
        return loginMember;
    }

}
