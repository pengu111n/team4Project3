package service;

import domain.Criteria;
import domain.NoticeVO;
import domain.QNAVO;
import mapper.QNAMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
//@Configuration
@MapperScan("mapper")
public class QNAServiceImpl implements QNAService {

    @Autowired
    private QNAMapper qnaMapper;
// 해당 레드라인은 신경 꺼도 상관 없음

    @Override
    public void create(QNAVO vo) throws Exception {
        qnaMapper.create(vo);
    }

    @Override
    public QNAVO read(Integer qnaNo) throws Exception {
        return qnaMapper.read(qnaNo);
    }

    @Override
    public void update(QNAVO vo) throws Exception {
        qnaMapper.update(vo);
    }

    @Override
    public void delete(Integer qnaNo) throws Exception {
        qnaMapper.delete(qnaNo);
    }


    @Override
    public List<QNAVO> listAll() throws Exception {
        return qnaMapper.listAll();
    }

    @Override
    @Transactional
    public List<QNAVO> listQNA(Criteria cri) throws Exception {
        return qnaMapper.listQNA(cri);
    }

    @Override
    public int listCount() throws Exception {
        return qnaMapper.listCount();
    }

    @Override
    public void answer(QNAVO vo) throws Exception {
        qnaMapper.answer(vo);
    }


}
