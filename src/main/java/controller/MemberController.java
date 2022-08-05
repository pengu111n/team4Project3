package controller;

import domain.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.MemberService;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/users")
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Inject
    private MemberService service;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(MemberVO member, Model model) throws Exception {
        logger.info("register get ...........");
    }
}
