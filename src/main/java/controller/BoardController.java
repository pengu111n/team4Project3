package controller;

import domain.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.BoardService;

import javax.inject.Inject;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;


	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(BoardVO board, Model model) throws Exception {
		logger.info("writeBoard get ...........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board,  RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(board.toString());

		boardService.regist(board);
		rttr.addFlashAttribute("msg","success");

		return "redirect:/board/list";
	}

	@RequestMapping(value = "/list")
	public void boardList(Model model) throws Exception {
		logger.info("// /board/list");

		List<BoardVO> list = boardService.listAll();

		logger.info("// list.toString()=" + list.toString());

		model.addAttribute("list", list);
	}
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("boardNo") int bno, Model model) throws Exception {

		model.addAttribute(boardService.read(bno));
	}


}
