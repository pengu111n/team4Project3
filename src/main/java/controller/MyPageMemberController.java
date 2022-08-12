package controller;

import domain.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.MyPageMemberService;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/mypage/member")
public class MyPageMemberController {

    private static final Logger logger = LoggerFactory.getLogger(MyPageMemberController.class);

    @Inject
    private MyPageMemberService service;

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public void get(@RequestParam("memno") Long memno, Model model) throws Exception {

        logger.info("/get");

        model.addAttribute("memberVO", service.get(memno));

    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("boardNo") Long memno, RedirectAttributes rttr) throws Exception {

        service.remove(memno);

        rttr.addFlashAttribute("result", "success");

        return "redirect:/mypage/member/get";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(Long memno, Model model) throws Exception {

        model.addAttribute(service.remove(memno));

    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(MemberVO member, RedirectAttributes rttr) throws Exception {

        logger.info("modify: " + member);

        service.modify(member);
        rttr.addFlashAttribute("result", "success");

        return "redirect:/mypage/member/get";
    }

}
