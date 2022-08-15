package service;

import domain.BoardVO;
import domain.Criteria;
import domain.SearchCriteria;
import mapper.BoardMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
//@Configuration
@MapperScan("mapper")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Transactional
	@Override
	public void create(BoardVO board) throws Exception {
		boardMapper.create(board);
		String[] files = board.getImage();

		if(files == null) { return; }

		for (String fileName : files) {
			boardMapper.addAttach(fileName);
		}
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return boardMapper.read(bno);
	}

	@Transactional
	@Override
	public void update(BoardVO board) throws Exception {

		boardMapper.update(board);
		Integer boardNo = board.getBoardNo();

		boardMapper.deleteAttach(boardNo);

		String[] files = board.getImage();

		if(files == null) { return; }

		for (String fileName : files) {
			boardMapper.replaceAttach(fileName, boardNo);
		}
	}

	@Transactional
	@Override
	public void delete(Integer bno) throws Exception {
		boardMapper.delete(bno);
		boardMapper.deleteAttach(bno);

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

	@Override
	public List<String> getAttach(Integer bno) throws Exception {

		return boardMapper.getAttach(bno);
	}

	@Override
	public void deleteAttach(Integer bno) throws Exception {
		boardMapper.deleteAttach(bno);
	}
	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);

		boardMapper.replaceAttach(fullName,bno);

	}
}
