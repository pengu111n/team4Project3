package service;

import domain.BoardVO;
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
    public List<BoardVO> getList(int memNo) {
        return mapper.getList(memNo);
    }

}
