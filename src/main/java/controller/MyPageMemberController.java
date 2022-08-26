package controller;

import domain.MemberVO;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.MyPageMemberService;
import util.MediaUtils;
import util.UploadFileUtils;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

@Controller
@RequestMapping(value = "/mypage/member")
public class MyPageMemberController {

    private static final Logger logger = LoggerFactory.getLogger(MyPageMemberController.class);

    @Inject
    private MyPageMemberService service;

    @Resource(name = "uploadPath")
    private String uploadPath;

    private UploadFileUtils uploadFileUtils;

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public void get(@RequestParam("memNo") int memNo, Model model) throws Exception {

        logger.info("/get");

        model.addAttribute(service.get(memNo));

    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("memNo") int memNo, RedirectAttributes rttr) throws Exception {

        service.remove(memNo);

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
        System.out.println("MyPageMemberController.modifyPOST");
        System.out.println("vo = " + vo);

        rttr.addFlashAttribute("result", "success");
        HttpSession session = request.getSession();
        session.setAttribute("login", vo);
        return "redirect:/mypage/member/get?memNo="+Integer.toString(member.getMemNo());
    }

    @ResponseBody
    @RequestMapping("/modify/displayFile")
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
    @RequestMapping(value = "/modify/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
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
    @RequestMapping(value = "/modify/deleteFile", method = RequestMethod.POST)
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

}
