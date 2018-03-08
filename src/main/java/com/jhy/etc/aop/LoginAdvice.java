package com.jhy.etc.aop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
@Aspect
public class LoginAdvice {
	
	
	// 사용 포인트컷 정리
	@Pointcut("execution(* com.jhy.myPage.controller.myPageController.myFavorite(..))")
	public void advice() {}
	
	@Pointcut("execution(* com.jhy.myPage.controller.myPageController.myReview(..))")
	private void myReviewAdvice() {	}
	
	@Pointcut("execution(* com.jhy.searchLib.controller.searchLibController.insert(..))")
	private void fav_lib_insert() { }
	
	
	// 겹치는 포인트컷 설정
	@Pointcut("advice() || myReviewAdvice() || fav_lib_insert()")
	private void advice_myReviewAdvice() { }
	
	
	//어드바이스 설정
	@Before("advice_myReviewAdvice()")
	public void checkSession(JoinPoint joinPoint) throws Throwable {
		
		System.out.println("LoginAdvice -- Around...");

		// HttpServletRequest req = null;
		// Object[] ob = joinPoint.getArgs();
		// if (ob[0] instanceof HttpServletRequest) {
		// req = (HttpServletRequest) ob[0];
		// }

		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		HttpServletResponse response = sra.getResponse();

		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		System.out.println("SESSION ID IS " + session.getId());
		System.out.println(uri);
		Object ret;
		if(session.getAttribute("userid") != null) {
			System.out.println("user session exist - userid : " + session.getAttribute("userid"));
		} else {
			System.out.println("user session not exist");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('로그인을 해주세요!')");
			pw.println("location.href='/'");
			pw.println("</script>");
			pw.flush();	// 해당 시점에 javascript 적용
			pw.close();
		}
		
		
	}
	
	/*@Around("myReviewAdvice()")
	public Object myReviewAround(ProceedingJoinPoint joinPoint) throws Throwable {
		
		System.out.println("-- myReview Around Test --");
		
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userid") != null) {
			return joinPoint.proceed();
		} else {
			HttpServletResponse response = sra.getResponse();
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('myReviewAround Test')");
			pw.println("location.href='/'");
			pw.println("</script>");
			pw.flush();
			pw.close();
			return null;
			
		}
		
	}*/
	/*
	 *com.jhy.searchLib.controller.searchLibController.insert(..) - /searchlib/insertFavorit
	 *com.jhy.myPage.controller.myPageController.changeMyForm(..) - /changeMyForm
	 *com.jhy.myPage.controller.myPageController.myReview(..) - /myReview
	 *com.jhy.myPage.controller.myPageController.myFavorite(..) - /myFavorite
	 */
}
