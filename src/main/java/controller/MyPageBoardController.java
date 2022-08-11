package controller;

import mapper.MyPageBoardMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.MyPageBoardService;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/mypage/board")
public class MyPageBoardController {

    private static final Logger logger = LoggerFactory.getLogger(MyPageBoardController.class);

    @Inject
    private MyPageBoardService service;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(Model model) throws Exception {

        logger.info("show all list......");
        model.addAttribute("list", service.getList());

    }

}
