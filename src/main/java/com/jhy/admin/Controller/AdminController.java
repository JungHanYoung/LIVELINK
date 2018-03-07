package com.jhy.admin.Controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jhy.admin.service.AdminService;
import com.jhy.recommendMonth.service.RecommendMonthService;
import com.jhy.searchBook.service.searchBookService;
import com.jhy.customerService.service.qnaService;
import com.jhy.member.service.MemberService;;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	RecommendMonthService recommendMonthService;
	@Autowired
	private qnaService qnaService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String adminhome(Locale locale, Model model, @RequestParam Map map) {
		
		return "/admin/home";
		
	}
	
	@RequestMapping(value="/qna_ajax",method=RequestMethod.POST, produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String qna_ajax(Locale locale, @RequestParam Map<String, Object> map) {
		//pageNum, title
		int col_num = 10;
		int startNo = Integer.parseInt(map.get("pageNum").toString());
		startNo = (startNo-1)*col_num;
		map.put("startNo", startNo);
		List<Map> addUsedBook = qnaService.select(map);
		return new Gson().toJson(addUsedBook);
	}
	/*@RequestMapping(value="/writeRecom", method=RequestMethod.POST)
	public String writeRecom(Locale locale, Model model, @RequestParam Map map, HttpSession sess) {
		
		try {
			int suc_flag = adminService.writeRecom(map);
			if(suc_flag>0) {
				model.addAttribute("success_flag", "Y");
				model.addAttribute("forward_url", "/admin");
			}else {
				model.addAttribute("success_flag", "N");
				model.addAttribute("forward_url", "/admin/writeRecomForm");
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/admin/writeRecomForm");
		}
		return "/common/common_alert";
		
	}
	
	@RequestMapping(value="/writeRecomForm")
	public String writeRecomForm(Locale locale, Model model, @RequestParam Map map) {
		
		return "/admin/writeRecomForm";
		
	}
	
	@RequestMapping(value="/bringbook",method=RequestMethod.POST, produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String bringbook(Locale locale, Model model, HttpServletRequest request, @RequestParam Map map)  throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		List<Map> booklist = recommendMonthService.select(map);
		
		return new Gson().toJson(booklist);
	}*/
	
	@RequestMapping(value="/searchmonthForm")
	public String searchmonthForm(Locale locale, Model model, @RequestParam Map map) {
		
		model.addAttribute("monthbooklist", recommendMonthService.select(map));
		return "/admin/searchmonthbook";
	}
	
	@RequestMapping(value="/qna")
	public String qna(Locale locale, Model model, @RequestParam Map map) {
		
		List qnalist = qnaService.select(map);
		model.addAttribute("qnalist", qnalist);
		
		return "/admin/qna";
	}
	
	@RequestMapping(value="/replyWriteForm", method=RequestMethod.GET)
	public String replyWriteForm(Locale locale, Model model, @RequestParam int seq) {
		List qna = qnaService.selectSpec(seq);
		model.addAttribute("qna", qna.get(0));
		
		return "/admin/replyWriteForm";
	}
	
	@RequestMapping(value="/replyWrite", method=RequestMethod.POST)
	public String replyWrite(Locale locale, Model model, @RequestParam Map map) {
		try {
			if(qnaService.replyqna(map)>0) {
				model.addAttribute("success_flag", "Y");
				model.addAttribute("forward_url", "/admin");
			}else/*업데이트실패시*/ {
				model.addAttribute("success_flag", "N");
				model.addAttribute("forward_url", "/admin/replyWriteFrom");
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/admin/replyWriteFrom");
		}
		return "/common/common_alert";
	}
	
	@RequestMapping(value="/bringqna", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String bringqna(Locale locale, Model model, @RequestParam Map map) {
		System.out.println(map);
		List qnalist = qnaService.selectBysecret(map);
		
		return new Gson().toJson(qnalist);
	}
	
	@RequestMapping(value="/manage_member", method=RequestMethod.GET)
	public String manageMember(Locale locale, Model model, @RequestParam Map<String, Object> map) {
		String pageNo_str = (String)(map.get("pNum")!=null?map.get("pNum"):"1");
		int pageNo = Integer.parseInt(pageNo_str);
		int startNo = (pageNo-1)*10;
		map.put("startNo", startNo);
		List members = memberService.select(map);
		int total_cnt = memberService.selectCnt(map);
		int page_cnt = total_cnt/10 + (total_cnt%10>0?1:0);
		//pNum = 1; firstpage = 1, endpage = 10 
		//pNum = 2; firstpage = 11, endpage = 20
		model.addAttribute("firstPage", startNo+1);
		model.addAttribute("endPage", pageNo*10>page_cnt?page_cnt:pageNo*10);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("members", members);
		return "/admin/memberManage";
	}
	
	
	
}


