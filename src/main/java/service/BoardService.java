package service;

import java.util.List;

import domain.OldBoardVO;

public interface BoardService {
	List<OldBoardVO> selectBoardList() throws Exception;
}
