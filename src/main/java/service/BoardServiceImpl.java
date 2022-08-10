package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import domain.OldBoardVO;
import mapper.BoardMapper;

@Service
//@Configuration
//@MapperScan("mapper")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	@Transactional
	public List<OldBoardVO> selectBoardList() throws Exception {
		return boardMapper.selectBoardList();
	}

}
