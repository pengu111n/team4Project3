package interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import domain.MemberVO;
import service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Inject
	private MemberService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("login") == null) {
			logger.info("current user is not logined");
			saveDest(request);

			response.sendRedirect("/member/login");
			return false;
		}//로그인한 사용자일 경우 Controller 호출
		return true;
	}
	//로그인 페이지 이동 전 , 현재 페이지를 Session에 저장

	private void saveDest(HttpServletRequest req) {

		String uri = req.getRequestURI();

		String query = req.getQueryString();
		//기존 URI 에 parameter가 있을 경우, 이를 포함

		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}

		if (req.getMethod().equals("GET")) {
			logger.info("dest: " + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}


}

/*
	       Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	       if (loginCookie != null) {
	    	   String sessionId = loginCookie.getValue();
	    	   MemberVO member = service.getUserWithSessionId(sessionId);
	    	   if(member!=null) {
	    		   HttpSession session = request.getSession();
	    		   session.setAttribute("login", member);
	    	   }
	       }
		return true;
	    }

	}*/

/*
 * @Override public boolean preHandle(HttpServletRequest request,
 * HttpServletResponse response, Object handler) throws Exception {
 *
 * HttpSession session = request.getSession();
 *
 * if (session.getAttribute("login") == null) {
 *
 * logger.info("current user is not logined");
 *
 * saveDest(request); response.sendRedirect("/user/login"); return false; }
 * return true; } }
 */

// if(session.getAttribute("login") == null){
//
// logger.info("current user is not logined");
// response.sendRedirect("/user/login");
// return false;
// }
