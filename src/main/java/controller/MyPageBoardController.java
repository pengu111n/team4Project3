package controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.MyPageBoardService;

@Controller
@Log4j
@RequestMapping(value = "/mypage/board")
public class MyPageBoardController {

    private MyPageBoardService service;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(int memNo, Model model) {

        log.info("list");

        model.addAttribute("list", service.getList(memNo));

    }

}
