 package com.jhy.review.controller;

import java.io.File;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhy.review.service.reviewService;
import com.jhy.searchBook.service.searchBookService;

@Controller
public class reviewController {
	
	@Autowired
	reviewService reviewService;
	
	@Autowired
	searchBookService searchBookService;
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(Locale locale, Model model, @RequestParam Map map) {
		
		String pageNo = (String)(map.get("pNum")!=null?map.get("pNum"):"1");
		int startNo = ((Integer.parseInt(pageNo))-1)*10;
		map.put("startNo", startNo);
		
		int pNum = ((Integer.parseInt(pageNo)));
		int firstPage = pNum -((pNum-1)%10);
		int endPage = firstPage + 9;
		List reviews = reviewService.select(map);	

		int total_cnt = reviewService.selectCnt(map);
		int page_cnt = (total_cnt%10==0)?total_cnt/10:total_cnt/10+1;
		endPage = (page_cnt>endPage)?endPage:page_cnt;

		model.addAttribute("reviews", reviews);	
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("pageNo",pageNo);
		
		return "review/review";
		
	}
	
	private static final Logger logger = LoggerFactory.getLogger(reviewController.class);
	
	@RequestMapping(value = "/registReview", method = RequestMethod.POST)
	public String registReview(Locale locale, Model model, @RequestParam Map<String, Object> map, HttpSession sess) {
		
		map.put("userseq", sess.getAttribute("userseq"));
		
		Map<String, Object> KyuMin = new HashMap<String, Object>();
		KyuMin.put("content",map.get("content"));
		KyuMin.put("m_seq",map.get("userseq"));
		KyuMin.put("s_seq",map.get("s_seq"));
		KyuMin.put("stars",map.get("stars"));
		
		
		System.out.println(KyuMin);
		//review m_seq s_seq content
	
		
			if(reviewService.regist(KyuMin)>0) {
				model.addAttribute("success_flag", "Y");
				model.addAttribute("forward_url", "/review");
				
			}else {
				model.addAttribute("success_flag", "N");
				model.addAttribute("forward_url", "/writeReview");
				
			}
		
		return "/common/common_alert";
	}
	/*// Specify name of a specific view that will be used to display the error:
	@ExceptionHandler({SQLException.class,DataAccessException.class})
	public String databaseError(HttpServletRequest req, Exception ex) {
		// Nothing to do.  Returns the logical view name of an error page, passed
		// to the view-resolver(s) in usual way.
		// Note that the exception is NOT available to this view (it is not added
		// to the model) but see "Extending ExceptionHandlerExceptionResolver"
		// below.
		System.out.println(req.getRequestURL());
		System.out.println(ex.getMessage());
		for(StackTraceElement ste:ex.getStackTrace()) {
			System.out.println(ste);
		}
	 	return "/";
	}*/
	
	@RequestMapping(value = "/writeReview", method = RequestMethod.GET)
	public String writeReview(Locale locale, Model model, @RequestParam("seq") int seq) {
		
		List detailSearchBook = searchBookService.detail(seq);
		model.addAttribute("detailSearchBook", detailSearchBook);
		return "review/writeReview";
		
	}
	
	@RequestMapping(value = "/detailReview", method = RequestMethod.GET)
	public String detailReview(Locale locale, Model model, @RequestParam Map map) {
		
		List reviews = reviewService.select3(map);
		model.addAttribute("reviews", reviews);
		return "review/detailReview";
		
	}
	
	@RequestMapping(value = "/reviewedit", method = RequestMethod.GET)
	public String reviewedit(Locale locale, Model model, @RequestParam Map map) {
		
			List reviews = reviewService.select3(map);
			model.addAttribute("reviews",reviews);
			
			return "review/reviewedit"; 
		
		
	}	
	
	@RequestMapping(value = "/reviewupdate", method = RequestMethod.POST)
	public String reviewupdate(Locale locale, Model model, @RequestParam Map map) {

		
		int review = reviewService.reviewupdate(map);
		
		if(review>0) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/myReview");
			return "common/common_alert";
		}
		else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/reviewedit");
			return "common/common_alert"; 
		}
	}

	

	@RequestMapping(value = "/reviewdelete", method = RequestMethod.GET)
	public String reviewdelete(Locale locale, Model model, @RequestParam Map map) {

		int qna = reviewService.reviewdelete(map);
		
		if(qna>0) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/review");
			return "common/common_alert";
		}
		else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/review");
			return "common/common_alert"; 
		}
	}	

}
