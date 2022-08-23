package controller;

import domain.Criteria;
import domain.NoticeVO;
/*import domain.MemberVO;*/
import domain.PageMaker;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.NoticeService;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping(value = "/notice/*")
public class NoticeController {

    private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

    @Inject
    private NoticeService service;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(NoticeVO notice, Model model) throws Exception {
        logger.info("register get ...........");

         /*  if(memberVO.rank != 3) {

        }
        */

    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(NoticeVO notice, RedirectAttributes rttr) throws Exception {

        logger.info("regist post..........");
        logger.info(notice.toString());

        service.create(notice);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/notice/list";

      /*  if(memberVO.rank != 3){

        }*/

    }

//    }

  /*  @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    public void listAll(Model model) throws Exception {
        logger.info("show all list......................");
        model.addAttribute("list", service.listAll());
    }*/

/*	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.info(cri.toString());

		model.addAttribute("list", service.listCriteria(cri));  // 게시판의 글 리스트
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);  // 게시판 하단의 페이징 관련, 이전페이지, 페이지 링크 , 다음 페이지

		return "/notice/listPage";
	}*/

    @RequestMapping(value = "/listCri", method = RequestMethod.GET)
    public void listAll(Criteria cri, Model model) throws Exception {
        logger.info("show list Page with Criteria......................");
        model.addAttribute("list", service.listCriteria(cri));
    }

  /*  @RequestMapping(value = "/listPage", method = RequestMethod.GET)
    public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
        logger.info(cri.toString());

        model.addAttribute("list", service.listCriteria(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);

        pageMaker.setTotalCount(service.listCountCriteria(cri));

        model.addAttribute("pageMaker", pageMaker);
    }*/

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Criteria cri, Model model) throws Exception {

        model.addAttribute("list", service.listNotice(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.listCount());

        model.addAttribute("pageMaker", pageMaker);

        return "notice/list";
    }


    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
        model.addAttribute(service.read(noticeNo));
    }


    // POST > GET로 바꿔도 안돌아가네 ?
    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String remove(@RequestParam("noticeNo") Integer noticeNo, RedirectAttributes rttr) throws Exception {
        service.delete(noticeNo);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/notice/list";

         /*  if(memberVO.rank != 3){

        }*/

    }


    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(NoticeVO notice, Model model) throws Exception {

        model.addAttribute(service);

         /*  if(memberVO.rank != 3){

        }*/

    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(NoticeVO notice, RedirectAttributes rttr) throws Exception {
        logger.info("mod post..........");

        service.update(notice);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/notice/list";

         /*  if(memberVO.rank != 3){

        }*/

    }


/*    @RequestMapping(value = "/readPage", method = RequestMethod.GET)
    public void read(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
        model.addAttribute(service.read(noticeNo));
    }


    @RequestMapping(value = "/removePage", method = RequestMethod.POST)
    public String remove(@RequestParam("noticeNo") int noticeNo, Criteria cri, RedirectAttributes rttr) throws Exception {
        service.delete(noticeNo);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/notice/listPage";*/
    /* }
     */
/*    @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
    public void modifyPagingGET(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") Criteria cri, Model model)
            throws Exception {
        model.addAttribute(service.read(noticeNo));
    }*/



	
/*
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) throws Exception {
		int result = service.idCheck(id);

		return result;
	}
*/

}
