package mapper;


import domain.Criteria;
import domain.QNAVO;
import domain.SearchCriteria;

import java.util.List;

public interface QNAMapper {

    public void create(QNAVO vo) throws Exception;

    public QNAVO read(Integer qnaNo) throws Exception;

    public void update(QNAVO vo) throws Exception;

    public void delete(Integer qnaNo) throws Exception;

    public List<QNAVO> listAll() throws Exception;

	public List<QNAVO> listCriteria(Criteria cri) throws Exception;

	public List<QNAVO> listQNA(Criteria cri) throws Exception;

	public int listCount() throws Exception;

	public void answer(QNAVO vo) throws Exception;

	/*
	 * public List<QNAVO> listPage(int page) throws Exception;
	 * 
	 * public List<QNAVO> listCriteria(Criteria cri) throws Exception;
	 * 
	 * public int countPaging(Criteria cri) throws Exception;
	 */


    /*public List<NoticeVO> listCriteria(Criteria cri) throws Exception;*/

    /*public int countPaging(Criteria cri) throws Exception;*/

    // use for dynamic sql

    /*public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception;*/


}
