package controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import domain.OldBoardVO;
import service.OldBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private OldBoardService oldBoardService;

	@RequestMapping(value = "/list")
	public void boardList(Model model) throws Exception {
		logger.info("// /board/list");

		List<OldBoardVO> list = oldBoardService.selectBoardList();

		logger.info("// list.toString()=" + list.toString());

		model.addAttribute("list", list);
	}

}
