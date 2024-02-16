package icia.cnd.petmate.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import icia.cnd.petmate.beans.StoreBean;
import icia.cnd.petmate.beans.UserBean;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class JwtIntercepter implements HandlerInterceptor {
	@Autowired
	private JsonWebTokenService jwtService;
	@Autowired
	private ProjectUtils util;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, 
			Object handler) throws Exception {
						
		String userKey = null, message = "API Request(preFlight -> response -> Flight)인 경우 preFlight인 경우 제외";
		boolean result = false;
		if(!req.getMethod().equals("OPTIONS")) {// API Request(preFlight -> response -> Flight)인 경우 preFlight인 경우 제외
			
			if(!req.getMethod().equals("GET")) {
				if(((UserBean)this.util.getAttribute("userInfo")) != null || (StoreBean)this.util.getAttribute("storeInfo") != null) {
					
					if(((UserBean)this.util.getAttribute("userInfo")) != null) {
						userKey = ((UserBean)this.util.getAttribute("userInfo")).getUserId(); 
						System.out.println(((UserBean)this.util.getAttribute("userInfo")));
					} else {
						userKey = ((StoreBean)this.util.getAttribute("storeInfo")).getStoreId();
						System.out.println(((StoreBean)this.util.getAttribute("storeInfo")));
					}
					
					
					
						
					
					/* 통신방식에 따라 JWT 접근방식 달리하기 */
					String jwtToken = 
							req.getRequestURI().split("\\/")[1].equals("view")? 
									req.getParameter("petmateJWT") : req.getHeader("petmateJWT");
					
					System.out.println("Not view" +req.getHeader("petmateJWT"));
					System.out.println("view " +req.getParameter("petmateJWT"));
			
					System.out.println("Intercepter 43 = "+jwtToken);
					
					
					if(jwtToken != null	&& jwtToken.length() > 0) {
						if((result = this.jwtService.tokenExpiredDateCheck(jwtToken, userKey)) == true) {
							message = null;
							result = true;
							System.out.println("preHandle 통과");
						} else message = "Token Error: Token has Expired";
					}else message = "Token Error:Token does Not Exist";
				} else message = "Session Error:보안상 다시 로그인을 해주세요.";	
			}else message = "접근 Error:비정상적인 접근 경로입니다.";
		}else result = true;
		
		if(!result) res.sendRedirect("/Index?"+ message);
		
		return result;
	}

	@Override
	public void postHandle( HttpServletRequest req, HttpServletResponse res,
			Object handler, ModelAndView mav)throws Exception { // Before View Rendering
		//log.info(">>> postHandle <<< ");
	}	

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, 
			Object handler, Exception ex)throws Exception { // After View Rendering
		//log.info(">>> afterComplection <<<");
	}
	
	/* Spring Framework 6.0 지원 현재 Spring Boot 에서 지원 >> postHandle, afterCompletion 실행 과정 없음
	public void afterConcurrentHandlingStarted(HttpServletRequest req, HttpServletResponse res, 
			Object handler, Exception ex) {
	}*/
}