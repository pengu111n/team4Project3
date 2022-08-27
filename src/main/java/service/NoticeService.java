package service;

import domain.Criteria;
import domain.NoticeVO;
import domain.SearchCriteria;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface NoticeService {
    public void create(NoticeVO vo) throws Exception;

    public NoticeVO read(Integer noticeNo) throws Exception;

    public void update(NoticeVO vo) throws Exception;

    public void delete(Integer noticeNo) throws Exception;

    public List<NoticeVO> listAll() throws Exception;

    public List<NoticeVO> listCriteria(Criteria cri) throws Exception;


    public List<NoticeVO> listNotice(Criteria cri) throws Exception;

    public int listCount() throws Exception;


}
