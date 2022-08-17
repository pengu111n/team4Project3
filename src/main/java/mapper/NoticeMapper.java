package mapper;


import domain.Criteria;
import domain.NoticeVO;
import domain.SearchCriteria;

import java.util.List;

public interface NoticeMapper {

    public void create(NoticeVO vo) throws Exception;

    public NoticeVO read(Integer noticeNo) throws Exception;

    public void update(NoticeVO vo) throws Exception;

    public void delete(Integer noticeNo) throws Exception;

    public List<NoticeVO> listAll() throws Exception;

    public List<NoticeVO> listPage(int page) throws Exception;

    public List<NoticeVO> listCriteria(Criteria cri) throws Exception;

    public int countPaging(Criteria cri) throws Exception;


    /*public List<NoticeVO> listCriteria(Criteria cri) throws Exception;*/

    /*public int countPaging(Criteria cri) throws Exception;*/

    // use for dynamic sql

    /*public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception;*/


}
