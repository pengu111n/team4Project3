package mapper;

import java.util.List;

import domain.BoardVO;

public interface BoardMapper {
	List<BoardVO> selectBoardList() throws Exception;
}
