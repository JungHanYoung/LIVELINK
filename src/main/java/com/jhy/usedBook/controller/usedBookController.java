package com.jhy.usedBook.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.jhy.usedBook.service.usedBookService;

@Controller
public class usedBookController {

	@Autowired
	usedBookService usedBookService;
	
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	
	private static final Logger logger = LoggerFactory.getLogger(usedBookController.class);

	@RequestMapping(value = "/usedbook", method = RequestMethod.GET)
	public String usedbook(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		
		String pageNo = (String)(map.get("pNum")!=null?map.get("pNum"):"1");
		int startNo = ((Integer.parseInt(pageNo))-1)*12;
		int total_cnt = usedBookService.total_cnt(map);
		map.put("startNo", startNo);
		map.put("total_cnt", total_cnt);
		
		int pNum = ((Integer.parseInt(pageNo)));
		int firstPage = pNum -((pNum-1)%10);
		int endPage = firstPage + 9;
		
		List<Map> usedbooklists_pre = usedBookService.select(map);
		List<List> usedbooklists_pres = new ArrayList<List>();
		
		for(int i = 0 ; i < usedbooklists_pre.size() ; i+=6) {
			List<Map> usedbooklists_pre_p = usedbooklists_pre.subList(i, i+6);
			System.out.println(usedbooklists_pre.subList(i, i+6));
			usedbooklists_pres.add(usedbooklists_pre_p);
		}
		
		int page_cnt = (total_cnt%12==0)?total_cnt/12:total_cnt/12+1;
		endPage = (page_cnt>endPage)?endPage:page_cnt;
		
		model.addAttribute("usedbooklists_pres", usedbooklists_pres);
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("pageNo",pageNo);
		
		return "usedbook/usedbook";
	}
	
	
	@RequestMapping(value = "/usedbookwrite", method = RequestMethod.GET)
	public String usedbookwrite(Locale locale, Model model, @RequestParam Map map) {
		return "usedbook/usedbookwrite"; 
	}	
	
	
	@RequestMapping(value = "/usedbookedit", method = RequestMethod.GET)
	public String usedbookedit(Locale locale, Model model, @RequestParam Map map, @RequestParam("seq") int seq) {
		
		List usedbooklists = usedBookService.selectSpec(map);	
		model.addAttribute("usedbooklists", usedbooklists);	

		
		return "usedbook/usedbookedit"; 
	}	
	
	@RequestMapping(value = "/usedbookupdate", method = RequestMethod.POST)
	public String usedbookupdate(Locale locale, Model model, @RequestParam Map map) {
		
		int use = usedBookService.update(map);	

		if(use>0) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/usedbook");
			return "common/common_alert";
		}
		else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/usedbook");
			return "common/common_alert"; 
		}
	}	
	
	
	@RequestMapping(value = "/usedbookview", method = RequestMethod.GET)
	public String usedbookview(Locale locale, Model model, @RequestParam Map map, @RequestParam("seq") int seq) {
		
		List usedbooklists = usedBookService.selectSpec(map);	
		model.addAttribute("usedbooklists", usedbooklists);	

		
		return "usedbook/usedbookview"; 
		
		
		
	}	

	@RequestMapping(value = "/usedbookregister", method = RequestMethod.POST)
	public String usedbookregister(Locale locale, Model model, @RequestParam Map map, HttpSession session,
			@RequestParam(value="file") MultipartFile file) {
		
		try {
			//파일정보셋팅
			
						
			String originalFileName = file.getOriginalFilename();
			
			if(originalFileName!="") {
				
				String fName = file.getOriginalFilename().substring(0,originalFileName.lastIndexOf("."));
				String fType = file.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
					
				String newFileName = fName + "_"+ System.currentTimeMillis() + fType; 
				File newFile = new File(fileUploadPath + newFileName);
				file.transferTo(newFile);
				map.put("o_file_name",originalFileName);
				map.put("n_file_name",newFileName);
			}
			
			else {
				model.addAttribute("success_flag", "N");
				model.addAttribute("forward_url", "/usedbook");		
			}
			
			map.put("userid", session.getAttribute("userid"));
			/*String freight = map.get("freight_row").toString();
			String s_seq = map.get("s_seq_row").toString();
			String m_seq = map.get("m_seq_row").toString();
			String price = map.get("price_row").toString();
			int freight1 = Integer.parseInt(freight);
			int s_seq1 = Integer.parseInt(s_seq);
			int m_seq1 = Integer.parseInt(m_seq);
			int price1 = Integer.parseInt(price);
			
			map.put("freight", freight1);
			map.put("s_seq", s_seq1);
			map.put("m_seq", m_seq1);
			map.put("price", price1);*/
			
			int use = usedBookService.write(map);
			
			if(use>0) {
				model.addAttribute("success_flag", "Y");
				model.addAttribute("forward_url", "/usedbook");
				return "common/common_alert";
			}
			else {
				model.addAttribute("success_flag", "N");
				model.addAttribute("forward_url", "/usedbook");
				return "common/common_alert"; 
			}
		} catch(Exception e) {
			logger.error("�쁿�쁿�쁿�쁿�쁿�쁿�쁿�쁿�쁿�쁿�쁿�쁿", e);
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/usedbook");
		}
		
		
		
		return "common/common_alert";
		
		
	}
		
	
	
	
	

	
	
	@RequestMapping(value = "/usedbookdelete", method = RequestMethod.GET)
	public String usedbookdelete(Locale locale, Model model, @RequestParam Map map) {
		
		int use = usedBookService.delete(map);	

		if(use>0) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/usedbook");
			return "common/common_alert";
		}
		else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/usedbook");
			return "common/common_alert"; 
		}
	}	
	
	@RequestMapping(value="/infiniteUsedbook",method=RequestMethod.POST, produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String infiniteUsedbook(Locale locale, @RequestParam Map<String, Object> map) {
		//pageNum, title
		int startNo = (map.get("pageNum")==null?1:Integer.parseInt(map.get("pageNum").toString()));
		startNo = (startNo-1)*12;
		map.put("startNo", startNo);
		List<Map> addUsedBook = usedBookService.select(map);
		List<List<Map>> addUsedBook_list = new ArrayList<List<Map>>();
		int i = 1;
		while(addUsedBook.size() > 6*i) {
			List<Map> sublist = addUsedBook.subList((i-1)*6, i*6-1);
			addUsedBook_list.add(sublist);
			i++;
		}
		addUsedBook_list.add(addUsedBook.subList((i-1)*6, addUsedBook.size()));
		return new Gson().toJson(addUsedBook_list);
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/usedbooksearch", method = RequestMethod.GET)
	public String usedbooksearch(Locale locale, Model model, @RequestParam Map map) {
		
		String pageNo = (String)(map.get("pNum")!=null?map.get("pNum"):"1");
		int startNo = ((Integer.parseInt(pageNo))-1)*12;
		map.put("startNo", startNo);
		
		int pNum = ((Integer.parseInt(pageNo)));
		int firstPage = pNum -((pNum-1)%10);
		int endPage = firstPage + 9;
		
		List<Map> usedbooklists = usedBookService.search(map);

		int total_cnt = usedBookService.total_cnt(map);
		int page_cnt = (total_cnt%12==0)?total_cnt/12:total_cnt/12+1;
		endPage = (page_cnt>endPage)?endPage:page_cnt;
		
		model.addAttribute("usedbooklists", usedbooklists);
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("pageNo",pageNo);
		
		return "usedbook/searchusedbook"; 
		
	}

}
