package com.jhy.myPage.controller;

import java.io.File;



import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

import com.jhy.etc.util.SHA256;
import com.jhy.member.service.MemberService;
import com.jhy.review.service.reviewService;
import com.jhy.searchBook.service.searchBookService;
import com.jhy.searchLib.service.searchLibService;


@Controller
public class myPageController {

	@Autowired
	MemberService memberService;
	@Autowired
	reviewService reviewService;
	@Autowired
	searchBookService searchBookService;
	
	@RequestMapping(value = "/changeMyForm", method = RequestMethod.GET)
	public String changeMyForm(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		map.put("seq", session.getAttribute("userseq"));
		List myForm = memberService.select(map); 
		
		model.addAttribute("myForm",myForm);
	
		return "/mypage/changeMyForm";
	}
	
/*	@RequestMapping(value = "/myReview", method = RequestMethod.GET)
	public String mydetail(Locale locale, Model model, @RequestParam Map map) {
		
		Map detailForm = memberService.select2(map);  
		
		List myReview = memberService.selectMyReview(detailForm);
		
		model.addAttribute("myReview",myReview);
		
		return "/mypage/myReview";
	}*/
	  
	@RequestMapping(value = "/myReview", method = RequestMethod.GET)
	public String myReview(Locale locale, Model model, @RequestParam Map map, HttpSession sess) {
		int userseq = (int)sess.getAttribute("userseq");
		map.put("seq",userseq);
		
		String pageNo = (String)(map.get("pNum")!=null?map.get("pNum"):"1");
		int startNo = ((Integer.parseInt(pageNo))-1)*10;
		map.put("startNo", startNo);
		
		
		
		int pNum = ((Integer.parseInt(pageNo)));
	
		int firstPage = pNum -((pNum-1)%10);
		int endPage = firstPage + 9;
		
		
		 
		List reviews = reviewService.selectMyReview(map);	


		int total_cnt = reviewService.selectCnt(map);
		int page_cnt = (total_cnt%10==0)?total_cnt/10:total_cnt/10+1;
		endPage = (page_cnt>endPage)?endPage:page_cnt;
		

		model.addAttribute("reviews", reviews);	
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("page_cnt",page_cnt);

		
		return "/mypage/myReview";
		
	}
	
	@RequestMapping(value = "/reviseReview", method = RequestMethod.GET)
	public String reviseReview(Locale locale, Model model, @RequestParam Map map) {
		
		List reviews = reviewService.select3(map);
		model.addAttribute("reviews", reviews);
		return "/mypage/reviseReview";
		
	}
	
	
	
	/*@RequestMapping(value = "/reviseReview", method = RequestMethod.GET)
	public String reviseReview(Locale locale, Model model, @RequestParam Map map, @RequestParam("seq") int title_seq) {
		System.out.println("title_seq媛� �옒 �뱾�뼱�솕�뒓吏� �솗�씤 : " + title_seq );
		map.put("sequ", title_seq);
		List reviseReview =  searchBookService.select2(map); 
		List reviseReview2 = reviewService.select2(map);
			System.out.println(map.get("sequ"));
		List reviseReview =  reviewService.select2(map); 
			Map  reviseReview2 = searchBookService.revise(reviseReview);
		
		String rv1 = (String)((Map) revise.get(0)).get("s_seq");
		System.out.println(rv1);
		map.put("s_seq",rv1);
		
		Map reviseReview2 = searchBookService.revise(revise); // searchBookMapper.xml
		((Map)reviseReview2.get(0)).get("title"); // title 而щ읆�쓽 媛��옣 �쐞�쓽 媛� 怨좊Ⅴ湲� 
		 	
		model.addAttribute("reviseReview", reviseReview);	
		model.addAttribute("reviseReview2", reviseReview2);
		return "/mypage/reviseReview";
	}*/
	
	@RequestMapping(value = "/myFavorite", method = RequestMethod.GET)
	public String myFavorite(Locale locale, Model model, @RequestParam Map map,HttpSession sess) {
		
		//Map m_seq = memberService.select2(map);
		map.put("m_seq", sess.getAttribute("userseq"));

		List<Map> lib_seq = memberService.myFavorite(map);
		System.out.println(lib_seq);
		
		List<List<Map>> superMyLib = new ArrayList<List<Map>>();
		List<Map> myLib=null;
		for(int i=0; i<lib_seq.size(); i++) {
			
			myLib = memberService.myLib((Map) lib_seq.get(i));
			//System.out.println(myLib);
			superMyLib.add(myLib);
			
			//System.out.println(myLib2);
		}
		
		System.out.println(myLib);

		System.out.println(superMyLib);
		model.addAttribute("myLib",superMyLib);

		
		//List myLib = memberService.myLib(lib_seq);
		
		return "/mypage/myFavorite";
	}


	@RequestMapping(value = "/deleteMyLib", method = RequestMethod.GET)
	public String deleteMyLib(Locale locale, Model model, @RequestParam Map map) {
		
		System.out.println(map);
		int myLib = memberService.deleteMyLib(map);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!"+myLib);
		
		return "forward:/myFavorite";
		
	
	}
	
	@RequestMapping(value = "/updateMyInfo", method = RequestMethod.POST)
	public String updateMyInfo(Locale locale, Model model, @RequestParam Map map) {
		
		map.put("pw", SHA256.encryptSHA256((String) map.get("pw")));
		
		memberService.update(map);
		
		return "home";
	}
	
	@RequestMapping(value = "/updateMyReview", method = RequestMethod.POST)
	public String updateMyReview(Locale locale, Model model, @RequestParam Map map, HttpSession sess) {
		
		reviewService.update(map);
		String userid = (String)sess.getAttribute("userid");
		return "redirect:/myReview?id="+userid;
	}
	
	
	@RequestMapping(value = "/myreservation", method = RequestMethod.GET)

	public String reservation(Locale locale, Model model, @RequestParam Map map) {

		return "/mypage/myreservation";

	}
	
/*	@RequestMapping(value="/revisereview")
	public String revisereview(Locale locale, Model model, @RequestParam Map map) {
		
		//map -> "seq": 由щ럭踰덊샇
		List<Map<String, Integer>> review = reviewService.select(map);
		//由ъ뒪�듃濡� 諛쏆�留� seq濡� 寃��깋�븯湲곕븣臾몄뿉 由щ럭�뒗 1媛쒕�� 諛쏄쾶�맂�떎.
		//[{seq:... , m_seq:... , s_seq:..., ... }]
		int s_seq = review.get(0).get("s_seq");
		//map.put("s_seq", s_seq);
		//List<Map<String, String>> book = searchBookService.detail(map);
		List<Map<String, String>> book = searchBookService.detail(s_seq);
		String title = book.get(0).get("title");
		model.addAttribute("title", title);
		model.addAttribute("review", review.get(0));
		return "/mypage/reviewrevise";
		// JSP	
		//${title} 梨낆젣紐�
		//${review.content} 由щ럭�궡�슜
	}*/
}









