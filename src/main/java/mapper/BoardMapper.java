package mapper;

import java.util.List;

import domain.OldBoardVO;

public interface BoardMapper {
	List<OldBoardVO> selectBoardList() throws Exception;
}
