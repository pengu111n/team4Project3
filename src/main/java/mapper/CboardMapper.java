package mapper;

import java.util.List;

import domain.CboardVO;
import domain.CbCriteria;

public interface CboardMapper {

    //게시물 목록
    public List<CboardVO> listCboard(CbCriteria cri) throws Exception;

    public int listCount() throws Exception;

    //게시물 작성
    public void writeCboard(CboardVO cboard) throws Exception;

    //게시물 조회
    public CboardVO readCboard(Integer cbno) throws Exception;

    //게시물 수정
    public void modifyCboard(CboardVO cboard) throws Exception;

    //게시물 삭제
    public void deleteCboard(int cbno) throws Exception;




}