package service;

import domain.BoardVO;
import domain.Criteria;
import domain.SearchCriteria;
import mapper.BoardMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import persistence.BoardDAO;

import javax.inject.Inject;
import java.util.List;

@Service
//@Configuration
@MapperScan("mapper")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public void create(BoardVO board) throws Exception {
		boardMapper.create(board);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return boardMapper.read(bno);
	}

	@Override
	public void update(BoardVO board) throws Exception {
		boardMapper.update(board);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		boardMapper.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return boardMapper.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return boardMapper.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return boardMapper.countPaging(cri);
	}
}
