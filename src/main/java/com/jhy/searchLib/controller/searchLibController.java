package com.jhy.searchLib.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.jhy.member.service.MemberService;
import com.jhy.searchLib.service.searchLibService;


@Controller
public class searchLibController {

	@Autowired
	searchLibService searchLibService;
	@Autowired
	MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(searchLibController.class);

	@RequestMapping(value = "/searchlib", method = RequestMethod.GET)
	public String searchlib(Locale locale, Model model, @RequestParam Map map) {

		return "searchlib/searchlib";
	}

	@RequestMapping(value = "searchlib/search", produces = "application/text; charset=utf8", method = RequestMethod.GET)
	@ResponseBody
	public String search(Locale locale, Model model, @RequestParam Map map, @RequestParam(value = "myLat") String myLat,
			@RequestParam(value = "myLng") String myLng) {
		
		double mlat = Double.valueOf(myLat).doubleValue();
		double mlng = Double.valueOf(myLng).doubleValue();

		List<Map> locationList = searchLibService.search(map);

		Map<Double, Integer> distanceList = new LinkedHashMap<>();

		for (int i = 0; i <= 117; i++) {
			Map listlist = locationList.get(i);
			String log = listlist.get("Log").toString();
			double llog = Double.valueOf(log).doubleValue();
			String lat = listlist.get("Lat").toString();
			double llat = Double.valueOf(lat).doubleValue();

			double height = mlat - llat;
			double weight = mlng - llog;

			double distance = height * height + weight * weight;

			distance = Math.sqrt(distance);

			distanceList.put(distance, i+1);
		}

		TreeMap<Double, Integer> tMap = new TreeMap<Double, Integer>(distanceList);
		System.out.println(tMap);
		List<String> listli = new ArrayList(tMap.values());
		
		Collection c = tMap.values();
		Iterator itr = c.iterator();
		
		List finalList = new ArrayList();
		Map jsonMap = new HashMap();
		List<Object> jsonlist = new ArrayList<Object>();
		for (int i = 0; i < 5; i++) {
			String thenumber = String.valueOf(listli.get(i));
			int number = Integer.parseInt(thenumber);
			Map listlis = locationList.get(number-1);
			
			String Log = listlis.get("Log").toString();
			String Lat = listlis.get("Lat").toString();
			String libraryName = listlis.get("libraryName").toString();
			String URL = listlis.get("URL").toString();
			String libraryNumber = listlis.get("libraryNumber").toString();
			
			
			
			jsonMap.put("libraryLocationLog" + (i+1), Log);
			jsonMap.put("libraryLocationLat" + (i+1), Lat);
			jsonMap.put("libraryName" + (i+1), libraryName);
			jsonMap.put("libraryURL" + (i+1), URL);
			jsonMap.put("libraryNumber" + (i+1), libraryNumber);
		}
		
		return new Gson().toJson(jsonMap);
	}
	
	
	
	
	@RequestMapping(value = "searchlib/insertFavorit", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String insert(Locale locale, Model model, @RequestParam Map map, @RequestParam(value = "libraryNumber") String libraryNumber, HttpServletRequest requ, HttpSession session) throws UnsupportedEncodingException {
		Map jsonMap = new HashMap();

		if((session.getAttribute("userid"))==null) {
			jsonMap.put("fail","1");
			return new Gson().toJson(jsonMap); 
		}
		
		List<Map> lib_seq = memberService.myFavorite(map);
		
		for(int i=0; i<lib_seq.size(); i++) {
			String lib = (lib_seq.get(i).get("lib_seq")).toString();
			if(lib.equals(libraryNumber)) {
				jsonMap.put("fail","2");
				return new Gson().toJson(jsonMap); 
			}
		}
		
		requ.setCharacterEncoding("UTF-8");
		String userid = (String) session.getAttribute("userid");
		map.put("userid", userid);
		System.out.println(userid);
		
		List<Map> member = searchLibService.select(map);
		Map newMember = member.get(0);
		
		
		
/*		String str_m_seq = member.get(0).toString();
		int m_seq = Integer.parseInt(str_m_seq);
		
		System.out.println("111111111111111111111");
		System.out.println(m_seq);
		
					int number = Integer.parseInt(thenumber);

*/
		
		map.put("m_seq", newMember.get("seq"));
		map.put("lib_seq", libraryNumber);

		int myLib = searchLibService.insertFavorit(map);
		
		if(myLib>0){
			jsonMap.put("fail","0");
			return new Gson().toJson(jsonMap); 
		}
		
		else {
			jsonMap.put("fail","1");
			return new Gson().toJson(jsonMap); 
		}

	}

}
