package controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import domain.MemberVO;
import dto.LoginDTO;
import service.MemberService;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("/member")
public class MemberController {
	@Inject
	private MemberService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
	}


	// 로그인 처리하는 부분

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		MemberVO vo = service.login(dto);

		if (vo == null) {
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

		return "main/index";
	}

}