package com.jhy.searchBook.dataresource;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;
 
public class XmlParser {
   
   public static final String key = "OiftM1cuGiV6hXoyR2jWJq79WlW6YqHU25HwyFkaIzsjqsFh78vU8M1fgwhYcdWjExTSi%2FH2J9tvL6HaKDm8cw%3D%3D";
   private static int pageNo = 0;
   public Sql sql = null;
    public XmlParser(int pageNo) {
        try {
        	this.pageNo = pageNo;
        	sql = new Sql();
            apiParserSearch();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
 
    /**
     * 
     * @throws Exception
     */
    public void apiParserSearch() throws Exception {
       for(char c = 'A' ; c <= 'X' ; c++) {
          URL url = new URL(getURLParam(c));
            
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            factory.setNamespaceAware(true);
            XmlPullParser xpp = factory.newPullParser();
            BufferedInputStream bis = new BufferedInputStream(url.openStream());
            xpp.setInput(bis, "utf-8");
            
            String tag = null;
            int event_type = xpp.getEventType();            //event_type : xml
            Map<String, Object> item = new HashMap<String, Object>();
            //HashMap<String, String> list2 = new HashMap<String, String>();
            
            while (event_type != XmlPullParser.END_DOCUMENT) {   //
                if (event_type == XmlPullParser.START_TAG) {
                    tag = xpp.getName();                  //
                } else if (event_type == XmlPullParser.TEXT) {
                    //System.out.println(xpp.getText());
                   if(xpp.getText().equals("\n")) {
                      
                   }else if(tag.equals("libName")){            //
                	   item.put("libname",xpp.getText());
                    }else if(tag.equals("shelfLocName")) {
                    	String str = xpp.getText();
                    	str = str.replace("'","\\'");
                    	item.put("detaillib", str);
                    }else if(tag.equals("title")) {
                       String str = xpp.getText();
                       str = str.replace("'","\\'");

                       item.put("title" ,str);
                    }else if(tag.equals("author")) {
                    	String str = xpp.getText();
                    	str = str.replace("'","\\'");
                    	item.put("author", str);
                    }else if(tag.equals("publisher")) {
                    	String str = xpp.getText();
                    	str = str.replace("'","\\'");
                    	item.put("publisher", str);
                    }else if(tag.equals("pubYear")) {
                    	String str = xpp.getText();
                    	str = str.replace("'","\\'");
                    	item.put("pubyear", str);
                    }
                } else if (event_type == XmlPullParser.END_TAG) {
                    tag = xpp.getName();
                    if (tag.equals("item")) {
                    	System.out.println("인서트준비");
                    	System.out.println(item);
                    	sql.insert(item);
                        item.clear();
                    }
                }
                event_type = xpp.next();
            }
            StringBuffer sb = new StringBuffer();
            sb.append("M").append(c).append("완료");
            System.out.println(sb.toString());
       }
    }
    
    public static String getURLParam(char ch){
       
        String url = String.format("http://openapi-lib.sen.go.kr/openapi/service/lib/openApi?serviceKey=%s&pageNo=%d&numOfRows=1000&manageCd=M%c&title=",key,pageNo,ch);
        return url;
    }
 
}