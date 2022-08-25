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

        MemberVO loginMem = service.findByMemNo(memNo);
        Integer loginMemRank = loginMem.getRank();

        if (loginMemRank == 1) {
            model.addAttribute("generalList", service.getGeneralList(memNo));
        } else {
            model.addAttribute("businessList", service.getBusinessList(memNo));
        }

    }

}
