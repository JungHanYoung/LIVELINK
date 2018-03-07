package com.celab.bookmanage_business;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
	 
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;
	 
public class PharmParser {

	public PharmParser() {
	        try {
	            apiParserSearch();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	public void apiParserSearch() throws Exception {
		URL url = new URL(getURLParam(null));
	 
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		factory.setNamespaceAware(true);
		XmlPullParser xpp = factory.newPullParser();
		
	    BufferedInputStream bis = new BufferedInputStream(url.openStream());
	    xpp.setInput(bis, "utf-8");
	        
	    String tag = null;
	    int event_type = xpp.getEventType();
	        
	    ArrayList<String> list = new ArrayList<String>();
	        
	    String addr = null;
	    while (event_type != XmlPullParser.END_DOCUMENT) {
	    	
	    	
	    	if(event_type == XmlPullParser.START_DOCUMENT) {
	    		
           
	          } else if(event_type == XmlPullParser.START_TAG) {
	        	  
	        	  tag = xpp.getName();
	              
	              
	          } else if(event_type == XmlPullParser.END_TAG) {
	        	  
	        	 tag = xpp.getName();
	        	   
	              
	          } else if(event_type == XmlPullParser.TEXT) {
	        	  if(xpp.getText().equals("\n")) {
	        		 
	        	  }
	        	  else if(tag.equals("TITLE")){
	                    addr = xpp.getText();                   
	                    list.add(addr);
	                }
	             
	          }
	    	event_type = xpp.next();
	         }
	         printList(list);
	}
	    	
	    	
	    	
	  
	 private void printList(ArrayList<String> list){
		 for(String entity : list){
			 System.out.println(entity);
			 }     
		 }
	    
	 private String getURLParam(String search){
		 String url = "http://openAPI.seoul.go.kr:8088/49635977796a686f36334a6a424366/xml/SeoulLibRecommend/1/5/";
		 if(search != null){
	        url = url+"/"+search;
	        }
	        return url;
	    }
	 
	    public static void main(String[] args) {
	        // TODO Auto-generated method stub
	        new PharmParser();
	    }
	 
	}

