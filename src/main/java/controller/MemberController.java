package controller;


import domain.MemberVO;
import domain.LoginDTO;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Param;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import service.MemberService;
import util.MediaUtils;
import util.UploadFileUtils;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;


@Controller
@RequestMapping("/member")
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Inject
    private MemberService service;

    @Resource(name = "uploadPath")
    private String uploadPath;


    private UploadFileUtils uploadFileUtils;




    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
    }


    // 로그인 처리하는 부분

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void loginPOST(LoginDTO dto, HttpServletRequest request, HttpSession session, Model model) throws Exception {
//        String savedPW = service.findById(id);
//        boolean match = BCrypt.checkpw(pw, savedPW);

        MemberVO vo = service.login(dto);
        System.out.println("MemberController.loginPOST");
        System.out.println("vo = " + vo);

        if (vo == null) {
            model.addAttribute("msg","사용자ID와 비밀번호를 확인하세요.");
            logger.info("널");
            return;
        }

        model.addAttribute("memberVO", vo);

        if (dto.isUseCookie()) { //dto클래스 안에 useCookie 항목에 폼에서 넘어온 쿠키사용여부가 들어있음)
            //쿠키사용에 체크되어있으면
            int amount = 60 * 60 * 24 * 7;

            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

            service.keepLogin(vo.getId(), session.getId(), sessionLimit);
        }

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request,
                         HttpServletResponse response, HttpSession session) throws Exception {

        //login 처리를 담당하는 사용자 정보를 담고있는 객체를 가져옴
        Object obj = session.getAttribute("login");

        if (obj != null) {
            MemberVO vo = (MemberVO) obj;

            session.removeAttribute("login");
            session.invalidate();

            //쿠키를 가져와보고
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

            if (loginCookie != null) { //쿠키가 존재하는 경우(이전 로그인 때 생성쿠키 존재)
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);

                service.keepLogin(vo.getId(), session.getId(), new Date());
            }
        }

        return "/home";
    }


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(MemberVO member, Model model) throws Exception {
        logger.info("register get ...........");
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(MemberVO member, @RequestParam("email2") String email2, @RequestParam(value = "email3", defaultValue = "", required = false) String email3
            , RedirectAttributes rttr, @RequestParam("yy") String yy, @RequestParam("mm") String mm, @RequestParam("dd") String dd, HttpServletRequest req) throws Exception {
        // String cryptPW = BCrypt.hashpw(member.getPw(), BCrypt.gensalt());
        // member.setPw(cryptPW);
        member.setEmail(member.getEmail() + "@" + email2 + email3);
        int ddd = Integer.parseInt(dd);
        String dddd = String.format("%02d", ddd);
        member.setBirth(yy + "." + mm + "." + dddd);

        StringBuffer url = req.getRequestURL();
        String local = url.toString();

        logger.info("regist post..........");
        logger.info(member.toString());

        try {
            service.regist(member, local.substring(0, 21));
            rttr.addFlashAttribute("msg", "SUCCESS");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "FAIL");
            return "redirect:/member/register";
        }
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("memno") Integer memno, RedirectAttributes rttr) throws Exception {
        service.remove(memno);
        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(MemberVO member, Model model) throws Exception {

        model.addAttribute(service);
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(MemberVO member, RedirectAttributes rttr) throws Exception {
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

    @RequestMapping(value = "/nickNameCheck", method = RequestMethod.POST)
    @ResponseBody
    public int nicknameCheck(@RequestParam("nickName") String nickName) throws Exception {
        int result = service.nicknameCheck(nickName);

        return result;
    }

    @RequestMapping(value = "confirmEmail", method = RequestMethod.GET)
    public String emailConfirm(@Param("email") String email, @Param("authKey") String authKey, Model model, HttpServletRequest req) throws Exception {

        service.memberAuth(email, authKey);
        model.addAttribute("memberEmail", email);

        HttpSession session =  req.getSession();
        MemberVO vo = (MemberVO)session.getAttribute("login");
        if(vo != null){
            vo.setAuth(1);
            session.setAttribute("login", vo);
        }

        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping(value = "/register/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
        logger.info("originalName : " + file.getOriginalFilename());
        logger.info("size : " + file.getSize());
        logger.info("contentType : " + file.getContentType());

        String uploadFile = uploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());

        if (uploadFile != null) {
            ResponseEntity<String> result = new ResponseEntity<String>(uploadFile, HttpStatus.OK);
            return result;
        } else {
            ResponseEntity<String> result = new ResponseEntity<String>(uploadFile, HttpStatus.BAD_REQUEST);
            return result;
        }
    }

    @ResponseBody
    @RequestMapping("/register/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName, MemberVO vo) throws Exception {

        InputStream in = null;
        ResponseEntity<byte[]> entity = null;

        logger.info("FILE NAME: " + fileName);

        try {

            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

            MediaType mType = MediaUtils.getMediaType(formatName);

            HttpHeaders headers = new HttpHeaders();

            in = new FileInputStream(uploadPath + fileName);

            if (mType != null) {
                headers.setContentType(mType);
            } else {

                fileName = fileName.substring(fileName.indexOf("_") + 1);
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.add("Content-Disposition", "attachment; filename=\"" +
                        new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
            }

            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
                    headers,
                    HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close();
        }
        return entity;
    }

    @ResponseBody
    @RequestMapping(value = "/register/deleteFile", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {

        logger.info("delete file: " + fileName);
        //  /2022/07/20/s_ejklsjkle_파일명.jpg
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

        MediaType mType = MediaUtils.getMediaType(formatName);

        if (mType != null) {

            String front = fileName.substring(0, 12);  // /2022/07/20/
            String end = fileName.substring(14);      // ejklsjkle_파일명.jpg
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();  //서버에 올라간 파일을 지운다
        }

        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();


        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(value = "/register/deleteAllFiles", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {

        logger.info("delete all files: " + files);

        if (files == null || files.length == 0) {
            return new ResponseEntity<String>("deleted", HttpStatus.OK);
        }

        for (String fileName : files) {
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

            MediaType mType = MediaUtils.getMediaType(formatName);

            if (mType != null) {

                String front = fileName.substring(0, 12);
                String end = fileName.substring(14);
                new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
            }

            new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

    @RequestMapping(value = "/authPlease")
    public String authPlease(){

        return "/member/auth";
    }

}

