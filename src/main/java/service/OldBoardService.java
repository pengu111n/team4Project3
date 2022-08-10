package service;

import java.util.List;

import domain.OldBoardVO;

public interface OldBoardService {
	List<OldBoardVO> selectBoardList() throws Exception;
}
