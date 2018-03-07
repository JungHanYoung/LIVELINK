package com.jhy.searchBook.dataresource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

public class Sql {
   String url_db = "jdbc:mysql://192.168.2.19/libsearch";
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
   
   public void insert(List<String> list) {
	   String sql = null;
	   if(list.size() < 6) {
		   String.format("INSERT INTO searchedulib(libname,pubyear,publisher,detaillib,title) "
		            + "VALUES('%s','%s','%s','%s','%s')", list.get(0),list.get(1),list.get(2),list.get(3),list.get(4));
	   }else{
		   sql = String.format("INSERT INTO searchedulib(author,libname,pubyear,publisher,detaillib,title) "
		            + "VALUES('%s','%s','%s','%s','%s','%s')", list.get(0),list.get(1),list.get(2),list.get(3),list.get(4),list.get(5));
	   }
      try {
         Statement st = conn.createStatement();
         st.executeUpdate(sql);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   public void insert(Map<String,Object> item) {
	   String sql = null;
	   if(item.size() < 6) {
		   String.format("INSERT INTO searchedulibtest1(libname,pubyear,publisher,detaillib,title) "
		            + "VALUES('%s','%s','%s','%s','%s')", item.get("libname"), item.get("pubyear"), item.get("publisher"), item.get("detaillib"), item.get("title"));
	   }else{
		   sql = String.format("INSERT INTO searchedulibtest1(author,libname,pubyear,publisher,detaillib,title) "
		            + "VALUES('%s','%s','%s','%s','%s','%s')", item.get("author"), item.get("libname"), item.get("pubyear"), item.get("publisher"), item.get("detaillib"), item.get("title"));
	   }
	   System.out.println(sql);
      try {
         Statement st = conn.createStatement();
         if(st.executeUpdate(sql)>0)
        	 System.out.println("INSERT SUCCESS");
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public void update(Map<String, String> map) {
	   String sql = String.format("UPDATE library SET closeon = '%s' WHERE REPLACE(libraryName,' ','') = '%s'",map.get("closeon"),map.get("libraryName"));
	   
      try {
         Statement st = conn.createStatement();
         System.out.println(sql);
         st.executeUpdate(sql);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
}