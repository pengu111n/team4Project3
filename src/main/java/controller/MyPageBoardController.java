package controller;

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

        model.addAttribute("list", service.getList(memNo));

    }

}
