package controller;

import domain.MemberVO;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.MyPageBoardService;

import javax.inject.Inject;

@Controller
@Log4j
@RequestMapping(value = "/mypage/board")
public class MyPageBoardController {

    @Inject
    private MyPageBoardService service;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(@RequestParam("memNo") int memNo, Model model) throws Exception {

        // memNo으로 member를 불러오고,
        MemberVO loginMem = service.findByMemNo(memNo);
        System.out.println("MyPageBoardController.list");
        System.out.println("loginMem = " + loginMem);

        // 해당 member의 rank를 가져온다.
        Integer loginMemRank = loginMem.getRank();

        if (loginMemRank == 1) {
            // rank가 1(일반회원)이면 일반회원 작성글 관리 페이지를 보여준다.
            model.addAttribute("generalList", service.getGeneralList(memNo));
            // model.addAttribute("list", service.getList(memNo));
        } else {
            // rank가 2(기업회원)이면 기업회원 작성글 관리 페이지를 보여준다.
            model.addAttribute("businessList", service.getBusinessList(memNo));
        }


    }

}
