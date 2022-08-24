package controller;

import domain.Criteria;
import domain.QNAVO;
import domain.PageMaker;
/*import domain.MemberVO;*/

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.QNAService;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/qna/*")
public class QNAController {

    private static final Logger logger = LoggerFactory.getLogger(QNAController.class);

    @Inject
    private QNAService service;


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(QNAVO qna, Model model) throws Exception {
        logger.info("register get ...........");
        // if(memberVO.login여부 == on){
        //
        // }
        qna.setStatus(0);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(QNAVO qna, RedirectAttributes rttr) throws Exception {

        logger.info("regist post..........");
        logger.info(qna.toString());

        // if(memberVO.login여부 == on){
        //       service.create(qna);
        //        rttr.addFlashAttribute("msg", "SUCCESS");
        //        qna.setStatus(0);
        //        return "redirect:/qna/list";
        // } else {
        //   return "redirect:/users/errorNotLogin
        // }


        service.create(qna);
        rttr.addFlashAttribute("msg", "SUCCESS");
        qna.setStatus(0);
        return "redirect:/qna/list";
    }

//    }

    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    public void listAll(Model model) throws Exception {
        logger.info("show all list......................");
        model.addAttribute("list", service.listAll());
    }


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Criteria cri, Model model) throws Exception {

        model.addAttribute("list", service.listQNA(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.listCount());

        model.addAttribute("pageMaker", pageMaker);

        return "qna/list";
    }


    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("qnaNo") int qnaNo, Model model) throws Exception {
        // if(memberVO.rank == 3 || memberVO.nickname == qnaVO.nickname){
        //    model.addAttribute(service.read(qnaNo));
        // } else {
        //      return "redirect:/users/errorNotAdmin
        // }

        // void라 리턴이 안들어갈건데 어떻게 바꿔야될라나 ?
        model.addAttribute(service.read(qnaNo));
    }


    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String remove(@RequestParam("qnaNo") Integer qnaNo, RedirectAttributes rttr) throws Exception {

        // if(memberVO.rank == 3 || memberVO.nickname == qnaVO.nickname){
        //    service.delete(qnaNo);
        // } else {
        //      return "redirect:/users/errorNotAdmin
        // }


        service.delete(qnaNo);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/qna/list";
    }


    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(QNAVO qna, Model model) throws Exception {

        // if(memberVO.rank == 3 || memberVO.nickname == qnaVO.nickname){
        //        model.addAttribute(service);
        // } else {
        //      return "redirect:/users/errorNotAdmin
        // }

        model.addAttribute(service);
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(QNAVO qna, RedirectAttributes rttr) throws Exception {
        logger.info("mod post..........");

        // if(memberVO.rank == 3 || memberVO.nickname == qnaVO.nickname){
        //        service.update(qna);
        //        rttr.addFlashAttribute("msg", "SUCCESS");
        //        return "redirect:/qna/list";
        // } else {
        //      return "redirect:/users/errorNotAdmin
        // }


        service.update(qna);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/qna/list";
    }


    @RequestMapping(value = "/answer", method = RequestMethod.GET)
    public void answerGET(QNAVO qna, Model model) throws Exception {


        // if(memberVO.rank == 3){
        //      qna.setStatus(1);
        //      model.addAttribute(service);
        // } else {
        //      return "redirect:/users/errorNotAdmin
        // }

        qna.setStatus(1);
        model.addAttribute(service);
    }

    @RequestMapping(value = "/answer", method = RequestMethod.POST)
    public String answerPOST(QNAVO qna, RedirectAttributes rttr) throws Exception {
        logger.info("answer post..........");

        // if(memberVO.rank == 3){
        //        service.answer(qna);
        //        rttr.addFlashAttribute("msg", "SUCCESS");
        //        qna.setStatus(1);
        //        return "redirect:/qna/list";
        // } else {
        //      return "redirect:/users/errorNotAdmin
        // }


        service.answer(qna);
        rttr.addFlashAttribute("msg", "SUCCESS");
        qna.setStatus(1);
        return "redirect:/qna/list";
    }


}
