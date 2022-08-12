package controller;

import domain.MemberVO;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.MemberService;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/users/*")
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Inject
    private MemberService service;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(MemberVO member, Model model) throws Exception {
        logger.info("register get ...........");
    }
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(MemberVO member, @RequestParam("email2")String email2, @RequestParam(value = "email3",defaultValue = "" ,required = false)String email3 ,RedirectAttributes rttr) throws Exception {
        String cryptPW = BCrypt.hashpw(member.getPw(), BCrypt.gensalt());
        member.setPw(cryptPW);
        member.setEmail(member.getEmail()+"@"+email2+email3);
    logger.info("regist post..........");
    logger.info(member.toString());

    try {
        service.regist(member);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/";
    } catch (Exception e){
        rttr.addFlashAttribute("msg", "FAIL");
        return "redirect:/users/register";
    }
}

//    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("memno") Integer memno, RedirectAttributes rttr) throws Exception{
        service.remove(memno);
        rttr.addFlashAttribute("msg","SUCCESS");
        return "redirect:/" ;
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(MemberVO member, Model model)throws Exception{

        model.addAttribute(service);
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(MemberVO member, RedirectAttributes rttr)throws Exception{
        logger.info("mod post..........");

        service.modify(member);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/";
    }
    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    @ResponseBody
    public int idCheck(@RequestParam("id") String id) throws Exception {
        int result = service.idCheck(id);

        return result;
    }



}
