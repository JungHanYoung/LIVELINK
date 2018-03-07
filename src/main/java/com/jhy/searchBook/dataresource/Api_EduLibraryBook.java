package com.jhy.searchBook.dataresource;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class Api_EduLibraryBook{
	
	public static void main(String[] args) throws IOException{
		
		List<Map> bookList = Api_EduLibraryBook.api_call("도둑", "MB", "2");
		for(Map map : bookList) {
			System.out.println(map);
		}
		
	}
	
	public static List<Map> api_call(String title, String manageCd, String pageNo) throws IOException {
		
		StringBuilder urlBuilder = new StringBuilder("http://openapi-lib.sen.go.kr/openapi/service/lib/openApi"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=OiftM1cuGiV6hXoyR2jWJq79WlW6YqHU25HwyFkaIzsjqsFh78vU8M1fgwhYcdWjExTSi%2FH2J9tvL6HaKDm8cw%3D%3D"); /*인증키*/
	    urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode(title, "UTF-8")); /*도서제목검색어 (*필수항목*)*/
	    urlBuilder.append("&" + URLEncoder.encode("manageCd","UTF-8") + "=" + URLEncoder.encode(manageCd, "UTF-8")); /*도서관코드(*필수항목*)*/
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*출력건수*/
	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*출력페이지*/
	    URL url = new URL(urlBuilder.toString());
	    
		try {
			XmlPullParserFactory xmlFactory = XmlPullParserFactory.newInstance();
			xmlFactory.setNamespaceAware(true);
			XmlPullParser xpp = xmlFactory.newPullParser();
			BufferedInputStream bis = new BufferedInputStream(url.openStream());
			xpp.setInput(bis, "utf-8");
			
			String tag = null;
			int event_type = xpp.getEventType();
			
			List<Map> bookList = new ArrayList<Map>(); 
			Map<String, Object> temp = new HashMap<String, Object>();
			while(event_type != XmlPullParser.END_DOCUMENT) {
				if(event_type == XmlPullParser.START_TAG) {
					tag = xpp.getName();
				} else if(event_type == XmlPullParser.TEXT) {
					if(tag.equals("author")) {	// 태그이름으로 필터링 하는 과정 
						//... 처리기
						
						temp.put("author", xpp.getText());
						//System.out.println(temp);
					} 
				} else if(event_type == XmlPullParser.END_TAG) {
					tag = xpp.getName();
					if(tag.equals("item")) {
						bookList.add(temp);
						temp = new HashMap<String,Object>();
					}
				}
				event_type = xpp.next();
			}
			return bookList;
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	
}
