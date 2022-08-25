package service;

import domain.BoardVO;
import domain.Criteria;
import domain.SearchCriteria;

import java.util.List;

public interface BoardService {

	public void create(BoardVO board) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void viewCount(Integer bno) throws Exception;

	public void update(BoardVO board) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

	public List<String> getAttach(Integer bno)throws Exception;

	public void deleteAttach(Integer bno) throws Exception;

	public void replaceAttach(String fullName, Integer bno) throws Exception;
	}
