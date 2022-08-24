package mapper;

import domain.CbSearchCriteria;
import domain.CboardVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CboardMapper {

    //게시물 목록
    public List<CboardVO> listCboard(CbSearchCriteria scri) throws Exception;

    public int listCount(CbSearchCriteria scri) throws Exception;

    //게시물 작성
    public void writeCboard(CboardVO cboard) throws Exception;

    //게시물 조회
    public CboardVO readCboard(Integer cbno) throws Exception;

    //게시물 수정
    public void modifyCboard(CboardVO cboard) throws Exception;

    //게시물 삭제
    public void deleteCboard(int cbno) throws Exception;

    //첨부파일
    public void addAttach(String fullName)throws Exception;

    public List<String> getAttach(Integer cbno)throws Exception;

    public void deleteAttach(Integer cbno)throws Exception;

    public void replaceAttach(@Param("fullName")String fullName, @Param("cbno")Integer cbno)throws Exception;

    public void replaceAttach(Map<String, Object> paramMap);



}