package com.jhy.searchBook.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.google.gson.Gson;
import com.jhy.searchBook.dataresource.Api_EduLibraryBook;
import com.jhy.searchBook.service.searchBookService;
import com.jhy.review.service.reviewService;

@Controller
public class searchBookController {
	
	@Autowired
	private searchBookService searchBookService;
	@Autowired
	private reviewService reviewService;
	
	@RequestMapping(value = "/searchBook", method = RequestMethod.GET)
	public String searchBook(Locale locale, Model model, @RequestParam Map map) {
		
		
		
		List searchBooks = searchBookService.select(map);
		model.addAttribute("searchBooks", searchBooks);		
		
		return "searchbook/searchbook";
		
	}
	
	
	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
	public String detailBook(Locale locale, Model model, @RequestParam Map<String,Object> map) {
		
		System.out.println(map.get("lat"));
		System.out.println(map.get("lng"));
		
		String pageNo = (String)(map.get("pNum")!=null?map.get("pNum"):"1");
		
		
		int startNo = ((Integer.parseInt(pageNo))-1)*10;
		
		map.put("startNo", startNo);
		
		
		
		int pNum = ((Integer.parseInt(pageNo)));
	
		int firstPage = pNum -((pNum-1)%10);
		int endPage = firstPage + 9;
		
		List<Map<String,Object>> searchBooks = searchBookService.select(map);
		
		int total_cnt = searchBookService.total_cnt(map);
		
		int page_cnt = (total_cnt%10==0)?total_cnt/10:total_cnt/10+1;
		endPage = (page_cnt>endPage)?endPage:page_cnt;
		
		model.addAttribute("searchBooks", searchBooks);	
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("page_cnt",page_cnt);

		return "searchbook/searchbook";
		
	}
	
	
	@RequestMapping(value = "/detailSearchBook", method = RequestMethod.GET)
	public String detailSearchBook(Locale locale, Model model, @RequestParam("seq") int seq) {
		
		List<Map<String, Object>> detailSearchBook = searchBookService.detail(seq);
		List<Map<String, Object>> reviews_by_book = reviewService.selectbys_seq(seq);
		List<Map<String, Object>> book_stars = reviewService.stars_by_book(seq);
		int sum = 0;
		for(Map<String, Object> map : book_stars) {
			sum += Integer.parseInt(map.get("count").toString());
		}
		model.addAttribute("detailSearchBook",detailSearchBook );
		model.addAttribute("reviews", reviews_by_book);
		model.addAttribute("book_stars", book_stars);
		model.addAttribute("review_sum", sum);
		return "searchbook/detailSearchBook";
	}
	
	@RequestMapping(value = "/searchbookajax", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String searchbookajax(Locale locale, @RequestParam Map<String, Object> map, HttpServletRequest req) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		String pNumStr = (String)map.get("pNum");
		String pageNo = (String)(pNumStr.length()!=0?map.get("pNum"):"1");
		
		int startNo = ((Integer.parseInt(pageNo))-1)*10;
		
		map.put("startNo", startNo);
		
		int pNum = ((Integer.parseInt(pageNo)));
	
		int firstPage = pNum -((pNum-1)%10);
		int endPage = firstPage + 9;
		
		List searchBooks = searchBookService.select(map);
		
		int total_cnt = searchBookService.total_cnt(map);
		
		int page_cnt = (total_cnt%10==0)?total_cnt/10:total_cnt/10+1;
		endPage = (page_cnt>endPage)?endPage:page_cnt;
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("searchBooks", searchBooks);
		model.put("total_cnt", total_cnt);
		model.put("endPage", endPage);
		model.put("page_cnt", page_cnt);
		
		
		/*model.addAttribute("searchBooks", searchBooks);	
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("page_cnt",page_cnt);*/
		return new Gson().toJson(model);
	}
	
}







