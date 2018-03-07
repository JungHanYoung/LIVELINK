package com.jhy.recommendMonth.dataresource;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;
 
public class XmlParser {
   
   public static final String key = "556b6856756a686f35354f66667357";
 
    public XmlParser(int i) {
        try {
            apiParserSearch(i);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
 
    public void apiParserSearch(int i) throws Exception {
    	
    	//********************************************************
        URL url = new URL(getURLParam());
        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        //********************************************************
        
        //int i = 1;
        String tag = null;
        int event_type = xpp.getEventType();
        HashMap<String, String> map = new HashMap<String, String>();
        ArrayList<HashMap> list = new ArrayList<HashMap>(); 
        Sql sql = new Sql();
        while (event_type != XmlPullParser.END_DOCUMENT) {
            if (event_type == XmlPullParser.START_TAG) {
                tag = xpp.getName();             
            } else if (event_type == XmlPullParser.TEXT) {
               if(xpp.getText().equals("\n")) {
                  
               }else if(tag.equals("BOOK_NM")) {
            	   map.put("bookname", xpp.getText());
                }else if(tag.equals("AUTHOR")) {
                	map.put("author", xpp.getText());
                }else if(tag.equals("PUBLSH")) {
                	map.put("publisher", xpp.getText());
                }else if(tag.equals("MONTH")) {
                	map.put("recom_month", xpp.getText());
                }
            } else if (event_type == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                if (tag.equals("row")) {
                	if((Integer.parseInt((String)map.get("recom_month"))) == i) {
                		
                		list.add(map);
                		map = new HashMap<String, String>();
                	}
                }
                if(list.size() == 5) {
                	sql.insert(list);
                	for(HashMap m : list) {
                		System.out.println((String)m.get("bookname"));
                		System.out.println((String)m.get("author"));
                		System.out.println((String)m.get("publisher"));
                		System.out.println((String)m.get("recom_month"));
                	}
                	System.out.println();
                	break;
                	//list.clear();
                	//i++;
                }
            }
            event_type = xpp.next();
        }
    }
    
    public static String getURLParam(){
       
        String url = String.format("http://openapi.seoul.go.kr:8088/%s/xml/SeoulLibRecommend/1/1000/", key);
        return url;
    }
 
}