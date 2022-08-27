package controller;

import domain.Criteria;
import domain.PageMaker;
import domain.MemberVO;

import domain.QNAVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.QNAService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/qna/*")
public class QNAController {

    private static final Logger logger = LoggerFactory.getLogger(QNAController.class);

    @Inject
    private QNAService service;


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(QNAVO qna, Model model) throws Exception {
        logger.info("register get ...........");

        qna.setStatus(0);

    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(QNAVO qna, RedirectAttributes rttr, HttpServletRequest request, Model model) throws Exception {

        logger.info("regist post..........");
        logger.info(qna.toString());

        HttpSession session = request.getSession();
        MemberVO vo = (MemberVO) session.getAttribute("login");
        if (vo.getRank() == null) {
            return "redirect:/users/notLogin";
        } else {

            service.create(qna);

            rttr.addFlashAttribute("msg", "SUCCESS");
            qna.setStatus(0);
            return "redirect:/qna/list";
        }
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
    public void read(int qnaNo, Model model, HttpServletRequest request) throws Exception {


        QNAVO qnavo = service.read(qnaNo);
        HttpSession session = request.getSession();
        MemberVO membervo = (MemberVO) session.getAttribute("login");

        System.out.println(qnavo);

        if (membervo.getRank() != 3 || qnavo.getNickName() != membervo.getNickName()) {

        } else if (membervo.getRank() == 3 || qnavo.getNickName() == membervo.getNickName()) {
            model.addAttribute(service.read(qnaNo));
        }

    }
/*

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(int qnaNo, Model model, HttpServletRequest request) throws Exception {


        model.addAttribute(service.read(qnaNo));



    }

    */

    /*QNAVO qnavo = service.read(qnaNo);

        model.addAttribute("qnaAtt", qnavo);

        System.out.println();

    HttpSession session = request.getSession();
    MemberVO vo = (MemberVO) session.getAttribute("login");
    QNAVO qnaread = (QNAVO) session.getAttribute("qnaAtt");
        if (vo.getRank() != 3 || qnaread.getNickName() != vo.getNickName() ) {
        return "redirect:/users/notAdmin";
    }
        return null;*/



       /* @RequestMapping(value = "/read", method = RequestMethod.GET)
        public void read(@RequestParam("qnaNo") int qnaNo, QNAVO qna, MemberVO member, Model model, HttpServletRequest request) throws Exception {


            HttpSession session = request.getSession();
            MemberVO vo = (MemberVO) session.getAttribute("login");

            System.out.println(qna.getNickName());

            if (vo.getRank() != 3 || qna.getNickName() != vo.getNickName()) {

            } else {
                model.addAttribute(service.read(qnaNo));
            }*/





/*    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("qnaNo") int qnaNo, QNAVO qna, MemberVO member, Model model) throws Exception {
        if(member.getRank() == 3 || member.getMemNo() == qna.getMemno()){
            model.addAttribute(service.read(qnaNo));
        } else {
            return "redirect:/users/error_common";
        }

        // void라 리턴이 안들어갈건데 어떻게 바꿔야될라나 ?
        model.addAttribute(service.read(qnaNo));
    }
    */


    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String remove(@RequestParam("qnaNo") Integer qnaNo, QNAVO qna, MemberVO member, RedirectAttributes rttr, HttpServletRequest request) throws Exception {


        HttpSession session = request.getSession();
        MemberVO vo = (MemberVO) session.getAttribute("login");
        if (vo.getRank() != 3) {
            return "redirect:/users/notAdmin";
        } else {


            service.delete(qnaNo);
            rttr.addFlashAttribute("msg", "SUCCESS");
            return "redirect:/qna/list";
        }

    }


/*    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String remove(@RequestParam("qnaNo") Integer qnaNo, RedirectAttributes rttr) throws Exception {

        // if(memberVO.rank == 3 || memberVO.nickname == qnaVO.nickname){
        //    service.delete(qnaNo);
        // } else {
        //      return "redirect:/users/errorNotAdmin
        // }


        service.delete(qnaNo);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/qna/list";
    }*/


    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(@RequestParam("qnaNo") int qnaNo, Model model, HttpServletRequest request) throws Exception {


        model.addAttribute("qna", service.read(qnaNo));
    }


    /*  model.addAttribute(service);  */






/*    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(QNAVO qna, Model model) throws Exception {

        // if(memberVO.rank == 3 || memberVO.nickname == qnaVO.nickname){
        //        model.addAttribute(service);
        // } else {
        //      return "redirect:/users/errorNotAdmin
        // }

        model.addAttribute(service);
    }*/


    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(QNAVO qna, MemberVO member, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
        logger.info("mod post..........");


        HttpSession session = request.getSession();
        MemberVO vo = (MemberVO) session.getAttribute("login");
        if (vo.getRank() != 3) {
            return "redirect:/users/notAdmin";
        } else {
            service.update(qna);
            rttr.addFlashAttribute("msg", "SUCCESS");
            return "redirect:/qna/list";
        }




/*        service.update(qna);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/qna/list";*/
    }


    @RequestMapping(value = "/answer", method = RequestMethod.GET)
    public void answerGET(QNAVO qna, int qnaNo, Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("qna", service.read(qnaNo));

    }


    /*@RequestMapping(value = "/answer", method = RequestMethod.GET)
    public String answerGET(QNAVO qna, MemberVO member, Model model) throws Exception {


        if (member.getRank() == 3) {

            model.addAttribute(service);
            qna.setStatus(1);
        } else {
            return "redirect:/users/errorNotAdmin";
        }

        *//* return null 추가했음. *//*
        return null;
    }
*/

    @RequestMapping(value = "/answer", method = RequestMethod.POST)
    public String answerPOST(QNAVO qna, MemberVO member, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
        logger.info("answer post..........");


        HttpSession session = request.getSession();
        MemberVO vo = (MemberVO) session.getAttribute("login");
        if (vo.getRank() != 3) {
            return "redirect:/users/notAdmin";
        } else {
            service.answer(qna);
            rttr.addFlashAttribute("msg", "SUCCESS");
            qna.setStatus(1);
            return "redirect:/qna/list";
        }

    }




   /* @RequestMapping(value = "/answer", method = RequestMethod.POST)
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
    }*/


}
