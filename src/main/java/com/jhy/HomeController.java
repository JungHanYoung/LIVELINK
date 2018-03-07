package com.jhy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhy.admin.service.AdminService;
import com.jhy.newBook.service.newBookService;
import com.jhy.recommendMonth.service.RecommendMonthService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private RecommendMonthService recommendMonthService;
	@Autowired
	private newBookService newBookService;
	@Autowired
	private AdminService adminService; 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam Map map) {
		
		logger.info("welcome to LIVELINK : {}", locale);
		
		//怨듭��궗�빆遺�遺�
		List<Map> notice_list = adminService.select_noticebyhome();
		model.addAttribute("notice", notice_list);
		
		//�썡媛꾩텛泥�
		List<Map> month_pre = recommendMonthService.select_pre(map);
		List<List> month_pres = new ArrayList<List>();
		for(int i = 0 ; i < month_pre.size()-4 ; i+=4) {
			List<Map> month_pre_p = month_pre.subList(i, i+4);
			month_pres.add(month_pre_p);
		}
		model.addAttribute("month_pres", month_pres);
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str_date = dayTime.format(new Date());
		String str_month = str_date.substring(5,7);
		int int_month = Integer.parseInt(str_month);
		int_month++;
		String str_month1 = String.valueOf(int_month);
		map.put("cur_month1", str_month);		//�빐�떦�썡
		map.put("cur_month2", str_month1);		//�빐�떦�썡�뿉�꽌 �떎�쓬�떖
		List newBooks = newBookService.select(map);
		List<List> slidelist = new ArrayList<List>();
		
		for(int i = 0 ; i < newBooks.size() - 4 ; i += 4){
			List slidebook = newBooks.subList(i, i + 4);
			slidelist.add(slidebook);
		}
		model.addAttribute("slidelist", slidelist);
		return "home";
	}
	
}
