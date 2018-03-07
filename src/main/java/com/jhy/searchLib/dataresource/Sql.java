package com.jhy.searchLib.dataresource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Sql {
   String url_db = "jdbc:mysql://192.168.2.19:3306/libsearch";
   String id_db = "jhy";
   String password_db = "1234";
   Connection conn = null;
   
   public Sql() {//('author','libname','pubyear','publisher','detaillib','title') 
      try {
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(url_db, id_db, password_db);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public void insert(HashMap<String, String> map) {
	   
	   String sql = "INSERT INTO library(libraryName,URL,Log,Lat) VALUES(?,?,?,?)";
      try {
         PreparedStatement pst = conn.prepareStatement(sql);
        	 pst.setString(1,(String)map.get("libraryName"));
        	 pst.setString(2,(String)map.get("URL"));
        	 pst.setString(3,(String)map.get("Log"));
        	pst.setString(4,(String)map.get("Lat"));
        	pst.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public void update(HashMap<String, String> map) {
	  String sql = "UPDATE library SET address_old=? WHERE libraryName=?";
      try {
    	  PreparedStatement pst = conn.prepareStatement(sql);
    	  System.out.println(map.get("address_old")+" 확인");
    	  pst.setString(1,(String)map.get("address_old"));
    	  System.out.println(map.get("libraryName")+" 확인");
    	  pst.setString(2,(String)map.get("libraryName"));
    	  System.out.println(pst.executeUpdate());
      }catch(Exception e) { 
         e.printStackTrace();
      }
   }
}