package com.jhy.member.controller;

import java.io.File;

import java.io.IOException;

import java.io.PrintWriter;

import java.text.DateFormat;

import java.util.ArrayList;

import java.util.Date;

import java.util.HashMap;

import java.util.List;

import java.util.Locale;

import java.util.Map;

import javax.lang.model.util.Elements;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;


import org.jsoup.Jsoup;

import org.jsoup.nodes.Document;

import org.jsoup.nodes.Element;


import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jhy.customerService.service.qnaService;
import com.jhy.etc.util.SHA256;
import com.jhy.member.dao.MemberDao;

import com.jhy.member.service.MemberService;
import com.jhy.recommendMonth.service.RecommendMonthService;
import com.jhy.searchBook.service.searchBookService;

@Controller

@RequestMapping(value = "/member")

public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Value("${file.upload.path}")

	private String fileUploadPath;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "/Login", method = RequestMethod.GET)

	public String registForm(Locale locale, Model model, @RequestParam Map map) {

		return "member/Login";

	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)

	public String join(Locale locale, Model model, @RequestParam Map map) {


		return "member/join";

	}

	@RequestMapping(value = "/wellcom", method = RequestMethod.GET)

	public String wellcom(Locale locale, Model model, @RequestParam Map map) {

		return "member/wellcom";

	}
	
	

	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(Locale locale, Model model, @RequestParam Map map) {

		String id = (String) map.get("id");
		
		String getID = memberService.idCheck(id);
		
		return getID;

	}
	
	@RequestMapping(value = "/logincheck", method = RequestMethod.POST) // logincheck라는 신호가 오면 
	public String logincheck(Locale locale, Model model, @RequestParam Map map, HttpSession sess) { //해당 메소드를 실행가게 된다
		
		map.put("pw", SHA256.encryptSHA256((String) map.get("pw")));
		Map memberInfo = memberService.logincheck(map);				//데이터에서 가져온 값 , Service에서는 데이터값을 긁어온다
		
		if(memberInfo != null) { // 데이터에 있는 값이 널이 아니면, 즉 값이 있다면 즉 로그인이 성공이된다면
			sess.setAttribute("userid", (String)memberInfo.get("id")); // 데이터에 있는 값을 userid라는 값으로 세션을 유지시킨다 
			sess.setAttribute("userseq", memberInfo.get("seq")); // 데이터에 있는 값을 userseq라는 값으로 세션을 유지시킨다 
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/");
			return "common/login_alert"; //로그인 성공시 home 으로 리턴한다
			
		} else { //입력값과 데이터에 있는 값이 다르다면
			model.addAttribute("success_flag", "N"); //모델은 값을 뿌리는데 즉 N의 속성을 가진 success_flag을 뿌린다 	//N을 success_flag이름으로 저장
			model.addAttribute("forward_url", "/member/Login");// /member/Login 경로를 forward_url이름으로 저장
			return "common/login_alert";
		}
	}
	
	@RequestMapping(value = "/memberRegist", method = RequestMethod.POST)
	public String memberRegist(Locale locale, Model model, @RequestParam Map map) {

		map.put("pw", SHA256.encryptSHA256((String) map.get("pw")));
		
	/*	map.put("age", Integer.parseInt((String) map.get("age")));
		map.put("tel", Integer.parseInt((String) map.get("tel")));
		map.put("pw", Integer.parseInt((String) map.get("addrnum")));

	*/
		
			
		int member = memberService.memberRegist(map);
		if(member>0) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/");
			return "common/join_alert"; //로그인 성공시 home 으로 리턴한다
		}
		else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/join");
			return "common/join_alert";
		}

	}
	

	@RequestMapping(value = "/logout")
	public String logout(Locale locale, Model model, @RequestParam Map map, HttpSession sess) {
		
		sess.invalidate();
		model.addAttribute("success_flag", "N");
		model.addAttribute("forward_url", "/member/Login");
		return "common/logout_alert";

	}
	
	@RequestMapping(value = "/emailcheckform")
	public String emailcheckform(Locale locale, Model model, @RequestParam Map map) {
		return "/member/emailcheckform";
	}
	
	/*@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(Locale locale, Model model, @RequestParam Map map) {

		try {

			if (memberService.delete(map) == 1) {

				return "1";

			} else {

				return "0";

			}

		} catch (Exception e) {

			logger.error("★★★★★★★★★★★★★★★★★★★", e);

			return "0";

		}

	}*/

	/*@RequestMapping(value = "/updateForm", method = RequestMethod.GET)

	public String updateForm(Locale locale, Model model, @RequestParam Map map) {

		model.addAttribute("member", (Map) memberService.select(map).get(0));

		return "member/updateForm";

	}*/

	/*@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Locale locale, Model model, @RequestParam Map map) {
		try {
			if (memberService.update(map) == 1) {
				logger.info("Welcome MemberInsertTest! The client locale is {}.", locale);

				model.addAttribute("success_flag", "Y");

				model.addAttribute("forward_url", "/");
			} else {
				model.addAttribute("success_flag", "N");

				model.addAttribute("forward_url", "/");
			}
		} catch (Exception e) {
			logger.error("★★★★★★★★★★★★★★★★★★★", e);

			model.addAttribute("success_flag", "N");

			model.addAttribute("forward_url", "/");

		}
		return "common/common_alert";
	}*/
	//뿌리는거 //
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	 public String reservation(Locale locale, Model model, @RequestParam Map map,HttpSession sess) {
	
	  map.put("m_seq", (int)sess.getAttribute("userseq"));  //map에 m_seq를 넣는다.
	  int memnum = memberService.insertreser(map);//s_seq, m_seq 값들을 넣는것 
	  
	  return "redirect:/member/myreservation";
	  
	 }
	 //뿌리는거 //
	 @RequestMapping(value = "/myreservation", method = RequestMethod.GET)
 	public String myreservation(Locale locale, Model model, @RequestParam Map map,HttpSession sess) {
	 
	 	String pageNo = (String)(map.get("pNum")!=null?map.get("pNum"):"1");
		int startNo = ((Integer.parseInt(pageNo))-1)*10;
		map.put("startNo", startNo);
		
		map.put("m_seq", (int)sess.getAttribute("userseq"));
		List resrvationbook = memberService.reservation(map);
		
		int pNum = ((Integer.parseInt(pageNo)));
		int firstPage = pNum -((pNum-1)%10);
		int endPage = firstPage + 9;

		int total_cnt = memberService.total_cnt(map);
		int page_cnt = (total_cnt%10==0)?total_cnt/10:total_cnt/10+1;
		endPage = (page_cnt>endPage)?endPage:page_cnt;
		
		model.addAttribute("resrvationbook", resrvationbook);	
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("pageNo",pageNo);


		return "/mypage/myreservation";
	 } 
	
	
	 
	 
	//reservationbook myreservation에 담길것을 담아놨다! 나는 이제 이 리스트를
	//써야하는데 
		
	
	//insert 자료의 뿌림이 시작되기 전에 먼저 데이터에 들어가있어여 하고 그 데이터를 바탕으로 자료를 뿌린다.
	
	//아이디찾기화면
	@RequestMapping(value = "/searchIDForm", method = RequestMethod.GET)
	public String searchIDForm(Locale locale, Model model, @RequestParam Map map) {
		return "/member/searchID";
	}
	//아이디찾기처리
	@RequestMapping(value="/searchID", method = RequestMethod.POST)
	public String searchID(Locale locale, Model model, @RequestParam Map map) {
		//map - name, email
		List<Map<String, Object>> member = memberService.select(map);
		model.addAttribute("id", member.get(0).get("id"));
		return "/member/resultsearchID";
	}
	
	@RequestMapping(value="/changepwform")
	public String changepwform(Locale locale, Model model, @RequestParam Map map) {
		//map - name, email
		
		return "/member/changepwform";
	}
	
	@RequestMapping(value="/changePw", method = RequestMethod.POST)
	public String changepw(Locale locale, Model model, @RequestParam Map map, HttpSession sess) {
		
		try{
			map.put("id", sess.getAttribute("tempid"));
			map.put("pw", SHA256.encryptSHA256((String) map.get("password")));
			System.out.println(map);
			if(memberService.updatepw(map)>0) {
				System.out.println("변경성공");
			}else {
				System.out.println("변경실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sess.removeAttribute("tempid");
		}
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/deletebook", method = RequestMethod.GET)
	public String deletebook(Locale locale, Model model, @RequestParam Map map,HttpSession sess) {

		memberService.deletebook(map);
		return "redirect:/member/myreservation";
		
	}
	
}


