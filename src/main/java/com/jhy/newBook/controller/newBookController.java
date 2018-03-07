package com.jhy.newBook.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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

import com.jhy.newBook.service.newBookService;

@Controller
public class newBookController {
	
	@Autowired
	newBookService newBookService;
	
	/*@RequestMapping(value = "/newBook", method = RequestMethod.GET)
	public String newBook(Locale locale, Model model, @RequestParam Map map) {
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		String str_date = dayTime.format(new Date());
		String str_month = str_date.substring(5,7);
		int int_month = Integer.parseInt(str_month);
		int_month++;
		String str_month1 = String.valueOf(int_month);
		map.put("cur_month1", str_month);
		map.put("cur_month2", str_month1);
		List newBooks = newBookService.select(map);
		List<List> slidelist = new ArrayList<List>();
		
		for(int i = 0 ; i < newBooks.size() - 4 ; i += 4){
			List slidebook = newBooks.subList(i, i + 4);
			slidelist.add(slidebook);
		}
		model.addAttribute("newBooks", newBooks);
		model.addAttribute("slidelist", slidelist);
		model.addAttribute("total_cnt", newBooks.size());
		model.addAttribute("dot_cnt", slidelist.size());
		return "newbook/newBook";
		
	}*/
	
	@RequestMapping(value = "/detailBook", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model, @RequestParam("seq") int seq) {
		
		List detailBook = newBookService.select2(seq);
		
		model.addAttribute("detailBook",detailBook );
		
		return "newbook/detailBook";
	}

}
