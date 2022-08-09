import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import domain.BoardVO;
import domain.Criteria;
import domain.SearchCriteria;
import persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;

	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

	@Test
	public void testCreate() throws Exception {

		BoardVO board = new BoardVO();
		board.setBoardNo(1);
		board.setTitle("테스트코드 타이틀");
		board.setCategory("테스트코드 카테고리");
		board.setRegDate("2002-02-02");
		board.setModifiedDate("2002-02-02");
		board.setAddress("테스트코드 주소");
		board.setArea(111);
		board.setStartDate("2002-02-02");
		board.setEndDate("2002-02-02");
		board.setBudget("테스트코드 예산");
		board.setPart("테스트코드 파트");
		board.setRequire("테스트코드 요구사항");
		board.setImage("테스트코드 이미지");
		dao.create(board);
	}

	@Test
	public void testRead() throws Exception {

		logger.info(dao.read(29).toString());
	}

	@Test
	public void testUpdate() throws Exception {

		BoardVO board = new BoardVO();
		board.setBoardNo(28);
		board.setTitle("테스트코드 수정 타이틀");
		board.setCategory("테스트코드 수정 카테고리");
		board.setAddress("테스트코드 수정 주소");
		board.setModifiedDate("2003-03-03");
		board.setArea(111);
		board.setStartDate("2002-02-02");
		board.setEndDate("2002-02-02");
		board.setBudget("테스트코드 수정 예산");
		board.setPart("테스트코드 수정 파트");
		board.setRequire("테스트코드 수정 요구사항");
		board.setImage("테스트코드 수정 이미지");
		dao.update(board);
	}

	@Test
	public void testDelete() throws Exception {

		dao.delete(28);
	}

	@Test
	public void testListAll() throws Exception {

		logger.info(dao.listAll().toString());

	}


}
