package interceptor;

import domain.MemberVO;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import service.MemberService;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RememberInterceptor extends HandlerInterceptorAdapter {

    @Inject
    private MemberService service;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        HttpSession session = request.getSession();
        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        if (loginCookie != null) {
            MemberVO memberVO = service.checkLoginBefore(loginCookie.getValue());
            if (memberVO != null)
                session.setAttribute("login", memberVO);
        }

        return true;
    }






}
