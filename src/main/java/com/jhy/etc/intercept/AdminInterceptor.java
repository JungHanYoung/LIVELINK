package com.jhy.etc.intercept;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter; 
public class AdminInterceptor extends HandlerInterceptorAdapter{ 
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		try { 
			HttpSession sess = request.getSession();
			//logininfo 세션값이 널일경우 
			if(sess.getAttribute("userid") != null )
			{ //로그인페이지로 	redirect 
				if(((String)sess.getAttribute("userid")).equals("admin")) {
					return true;
				}
				response.sendRedirect("/error/noadmin");
				return false;
			}else {
				response.sendRedirect("/error/nologin");
				return false;
			}
		} catch (Exception e) { 
			e.printStackTrace();
			return false;
		}
	}
}









