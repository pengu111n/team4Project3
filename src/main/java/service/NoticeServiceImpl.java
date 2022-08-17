package service;

import domain.Criteria;
import domain.NoticeVO;
import mapper.NoticeMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
//@Configuration
@MapperScan("mapper")
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;
// 해당 레드라인은 신경 꺼도 상관 없음

    @Override
    public void create(NoticeVO vo) throws Exception {
        noticeMapper.create(vo);
    }

    @Override
    public NoticeVO read(Integer noticeNo) throws Exception {
        return noticeMapper.read(noticeNo);
    }

    @Override
    public void update(NoticeVO vo) throws Exception {
        noticeMapper.update(vo);
    }

    @Override
    public void delete(Integer noticeNo) throws Exception {
        noticeMapper.delete(noticeNo);
    }

    //???
    @Override
    public List<NoticeVO> listAll() throws Exception {
        return noticeMapper.listAll();
    }

    @Override
    public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
        return noticeMapper.listCriteria(cri);
    }

    @Override
    public int listCountCriteria(Criteria cri) throws Exception {
        return noticeMapper.countPaging(cri);
    }

//    @Override
//    public int countPaging(Criteria cri) throws Exception {
//        return noticeMapper.selectOne(cri);
//    }
//
//    @Override
//    public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception {
//        return noticeMapper.selectList(cri);
//    }



}
