package mapper;

import java.util.List;
import java.util.Map;

import domain.BoardVO;
import domain.Criteria;
import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
	public void create(BoardVO vo) throws Exception;

	public BoardVO read(Integer bno) throws Exception;
	public void viewCount(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<BoardVO> listAll() throws Exception;
	public List<BoardVO> listPage(int page) throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;
	public void addAttach(String fullName)throws Exception;
	public List<String> getAttach(Integer bno)throws Exception;

	public void deleteAttach(Integer bno)throws Exception;

	public void replaceAttach(Map<String, Object> paramMap)throws Exception;
	public void replaceAttach(@Param("fullName")String fullName, @Param("boardNo")Integer boardNo)throws Exception;

}
