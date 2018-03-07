package com.jhy.customerService.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jhy.admin.service.AdminService;
import com.jhy.customerService.service.qnaService;

@Controller
public class qnaController {

	@Autowired
	qnaService qnaService;
	@Autowired
	private AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(qnaController.class);

	@RequestMapping(value = "/qnalist", method = RequestMethod.GET)
	public String qnalist(Locale locale, Model model, @RequestParam Map map) {
		
		String pageNo = (String)(map.get("pNum")!=null?map.get("pNum"):"1");
		int startNo = ((Integer.parseInt(pageNo))-1)*10;
		map.put("startNo", startNo);
		
		
		
		int pNum = ((Integer.parseInt(pageNo)));
		int firstPage = pNum -((pNum-1)%10);
		int endPage = firstPage + 9;
		List qnalists = qnaService.select(map);	


		int total_cnt = qnaService.total_cnt(map);
		int page_cnt = (total_cnt%10==0)?total_cnt/10:total_cnt/10+1;
		endPage = (page_cnt>endPage)?endPage:page_cnt;
		

		model.addAttribute("qnalists", qnalists);	
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("pageNo",pageNo);

		
		return "customerservice/qnalist";
	}	
	
	@RequestMapping(value = "/qnaview", method = RequestMethod.GET)
	public String qnaview(Locale locale, Model model, @RequestParam Map map, @RequestParam("qnaSeq") int qnaSeq) {
      
		List qnaviews = qnaService.selectSpec(qnaSeq);
		System.out.println(qnaviews);
		System.out.println(((Map) qnaviews.get(0)).get("is_secret"));
	/*	if(((Map) qnaviews.get(0)).get("is_secret")=="Y") {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/");
			return "common/secret_alert";
			
		}*/
		model.addAttribute("qnaviews",qnaviews );
		
		return "customerservice/qnaview";
	}	

	
	
	
	@RequestMapping(value = "/qnawrite", method = RequestMethod.GET)
	public String qnawrite(Locale locale, Model model, @RequestParam Map map) {
		return "customerservice/qnawrite"; 
	}	

	@RequestMapping(value = "/qnaregister", method = RequestMethod.POST)
	public String qnaregister(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		
		System.out.println("여기까지");
		map.put("userid", session.getAttribute("userid"));
			
		int qna = qnaService.write(map);
		System.out.println(map);
		System.out.println("qna!!!!!!!!!!!!!!!!!!!!!!!!"+qna);
		
		if(qna>0) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/");
			return "common/common_alert";
		}
		else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/join");
			return "common/common_alert"; 
		}
	}	
	
	
	@RequestMapping(value = "/qnaedit", method = RequestMethod.GET)
	public String qnaedit(Locale locale, Model model, @RequestParam Map map, @RequestParam("qnaSeq") int qnaSeq) {
		List qnaviews = qnaService.selectSpec(qnaSeq);
		model.addAttribute("qnaviews",qnaviews );
		
		return "customerservice/qnaedit"; 
	}	
	
	@RequestMapping(value = "/qnaupdate", method = RequestMethod.POST)
	public String qnaupdate(Locale locale, Model model, @RequestParam Map map) {

		
		int qna = qnaService.qnaupdate(map);
		
		if(qna>0) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/");
			return "common/common_alert";
		}
		else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/join");
			return "common/common_alert"; 
		}
	}	

	

	@RequestMapping(value = "/qnadelete", method = RequestMethod.GET)
	public String qnadelete(Locale locale, Model model, @RequestParam Map map,@RequestParam("qnaSeq") int qnaSeq) {

		int qna = qnaService.qnadelete(map);
		
		if(qna>0) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/");
			return "common/common_alert";
		}
		else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/join");
			return "common/common_alert"; 
		}
	}	

	@RequestMapping(value = "/checkqnapw", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String checkqnapw(Locale locale, Model model, @RequestParam Map map ,HttpServletRequest req) throws UnsupportedEncodingException { 
		
		req.setCharacterEncoding("UTF-8");

		List<Map> checkqnapw = qnaService.checkqnapw(map);
		System.out.println(checkqnapw);
		String pw = (String) ((Map) checkqnapw.get(0)).get("secret_pw");
			
		System.out.println(pw);
		
		return new Gson().toJson(pw);
		
	}	

	@RequestMapping(value="/notice_detail", method=RequestMethod.GET)
	public String notice_detail(Locale locale, Model model, @RequestParam Map<String, Object> map) {
		
		List<Map> notice_piece = adminService.select_noticebyseq(map);
		model.addAttribute("notice", notice_piece);
		
		return "/admin/notice_detail";
	}
	
}
