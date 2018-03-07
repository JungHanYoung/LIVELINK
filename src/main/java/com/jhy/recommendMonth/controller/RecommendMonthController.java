package com.jhy.recommendMonth.controller;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhy.admin.service.AdminService;
import com.jhy.recommendMonth.service.RecommendMonthService;

@Controller
public class RecommendMonthController {
	
	/*@Autowired
	private RecommendMonthService recommendMonthService;
	@Autowired
	private AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(RecommendMonthController.class);
	
	@RequestMapping(value="/monthbook", method=RequestMethod.GET)
	public String monthBook(Locale locale, Model model, @RequestParam Map map) {
		
		String pageNo = (String)(map.get("pageNo")!=null?map.get("pageNo"):"1");
		int startNo = ((Integer.parseInt(pageNo))-1)*10;
		map.put("startNo", startNo);
		
		List<Map> monthbooks = recommendMonthService.select(map);
		
		List<Map> month_pre = recommendMonthService.select_pre(map);
		List<List> month_pres = new ArrayList<List>();
		for(int i = 0 ; i < month_pre.size()-4 ; i+=4) {
			List<Map> month_pre_p = month_pre.subList(i, i+4);
			month_pres.add(month_pre_p);
		}
		
		int total_cnt = recommendMonthService.total_cnt();
		List<Map> m = adminService.selectOne();
		model.addAttribute("admin_recom", m);
		model.addAttribute("monthbooklist", monthbooks);
		model.addAttribute("month_pres", month_pres);
		
		model.addAttribute("total_cnt", total_cnt);
		return "/monthbook/monthbook";
		
	}*/
	
}
