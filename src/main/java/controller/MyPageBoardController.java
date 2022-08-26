package controller;

import domain.Criteria;
import domain.MemberVO;
import domain.PageMaker;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.BoardService;
import service.MyPageBoardService;

import javax.inject.Inject;

@Controller
@Log4j
@RequestMapping(value = "/mypage/board")
public class MyPageBoardController {

    @Inject
    private MyPageBoardService myPageBoardService;

    @Inject
    private BoardService boardService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(@RequestParam("memNo") int memNo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

        // 상세 페이지 출력
        model.addAttribute("list", boardService.listCriteria(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.listCountCriteria(cri));
        model.addAttribute("pageMaker", pageMaker);


        // 리스트 출력
        MemberVO loginMem = myPageBoardService.findByMemNo(memNo);
        Integer loginMemRank = loginMem.getRank();

        if (loginMemRank == 1) {
            model.addAttribute("generalList", myPageBoardService.getGeneralList(memNo));
        } else {
            model.addAttribute("businessList", myPageBoardService.getBusinessList(memNo));
        }

    }

//    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
//    public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//
//        logger.info(cri.toString());
//
//        model.addAttribute("list", boardService.listCriteria(cri));
//
//
//        PageMaker pageMaker = new PageMaker();
//        pageMaker.setCri(cri);
//
//        pageMaker.setTotalCount(boardService.listCountCriteria(cri));
//
//        model.addAttribute("pageMaker", pageMaker);
//    }

}
