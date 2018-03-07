package com.jhy.searchLib.dataresource;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;
 
public class XmlParser {
   
   public static final String key = "556b6856756a686f35354f66667357";
 
    public XmlParser() {
        try {
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
    	
        URL url = new URL(getURLParam());
        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        
        //int i = 1;
        String tag = null;
        int event_type = xpp.getEventType();
        HashMap<String, String> map = new HashMap<String, String>();
       
        Sql sql = new Sql();
        StringBuffer sb = new StringBuffer();
        while (event_type != XmlPullParser.END_DOCUMENT) {
        	
            if (event_type == XmlPullParser.START_TAG) {
                tag = xpp.getName();    
                
            } else if (event_type == XmlPullParser.TEXT) {
               if(xpp.getText().equals("\n")) {
                  
               }else if(tag.equals("FCLTY_NM")) {
            	   map.put("libraryName", xpp.getText());
               }else if(tag.equals("GU_NM")) {
            	   System.out.println(xpp.getText());
            	   sb.append(xpp.getText()).append(" ");
               }else if(tag.equals("HNR_NAM")){
            	   System.out.println(xpp.getText());
            	   sb.append(xpp.getText()).append(" ");
               }else if(tag.equals("MASTERNO")){
            	   System.out.println(xpp.getText());
            	   sb.append(xpp.getText());
               }else if(tag.equals("SLAVENO")){
            	   System.out.println(xpp.getText());
            	   if(xpp.getText().trim().length()!=0) {
            		   sb.append("-").append(xpp.getText());
            	   }else {
            		   System.out.println("없음");
            	   }
               }
                	/*else { { if(tag.equals("HMPG_CN")) {
                }
                	map.put("URL", xpp.getText());
                }else if(tag.equals("LNG")) {
                	map.put("Log", xpp.getText());
                }else if(tag.equals("LAT")) {
                	map.put("Lat", xpp.getText());
                }*/
            } else if (event_type == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                if (tag.equals("row")) {
                	//sql.insert(map);
                	map.put("address_old", sb.toString());
                	System.out.println(map.get("address_old"));
                	sql.update(map);
                	map.clear();
                	sb = new StringBuffer();
                }
            }
            event_type = xpp.next();
        }
       
    }
    
    public static String getURLParam(){
       
        String url = String.format("http://openapi.seoul.go.kr:8088/%s/xml/GeoInfoLibraryWGS/1/123", key);
        return url;
    }
 
}