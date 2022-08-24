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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/mypage/member")
public class MyPageMemberController {

    private static final Logger logger = LoggerFactory.getLogger(MyPageMemberController.class);

    @Inject
    private MyPageMemberService service;

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public void get(@RequestParam("memNo") int memNo, Model model) throws Exception {

        logger.info("/get");

        model.addAttribute(service.get(memNo));

    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("memno") int memno, RedirectAttributes rttr) throws Exception {

        service.remove(memno);

        rttr.addFlashAttribute("result", "success");

        return "redirect:/";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(int memNo, Model model) throws Exception {

        model.addAttribute(service.get(memNo));

    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(MemberVO member, RedirectAttributes rttr, HttpServletRequest request) throws Exception {

        logger.info("modify: " + member);

        service.modify(member);
        MemberVO vo = service.get(member.getMemNo());

        rttr.addFlashAttribute("result", "success");
        HttpSession session = request.getSession();
        session.setAttribute("login", vo);
        return "redirect:/mypage/member/get?memNo="+Integer.toString(member.getMemNo());
    }

}
