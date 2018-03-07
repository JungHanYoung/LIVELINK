package com.jhy.recommendMonth.dataresource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Sql {
   String url_db = "jdbc:mysql://127.0.0.1:3306/libsearch";
   String id_db = "root";
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
   
   public void insert(ArrayList<HashMap> list) {//(libname,pubyear,publisher,detaillib,title)
//	   String sql = null;
//	   if(list.size() < 6) {
//		   String.format("INSERT INTO searchlibposition(libname,pubyear,publisher,detaillib,title) "
//		            + "VALUES('%s','%s','%s','%s','%s')", list.get(0),list.get(1),list.get(2),list.get(3),list.get(4));
//	   }else{
//		   sql = String.format("INSERT INTO searchlibposition(author,libname,pubyear,publisher,detaillib,title) "
//		            + "VALUES('%s','%s','%s','%s','%s','%s')", list.get(0),list.get(1),list.get(2),list.get(3),list.get(4),list.get(5));
//	   }
	   String sql = "INSERT INTO recom_month_book(bookname,author,publisher,recom_month) VALUES(?,?,?,?)";
      try {
         PreparedStatement pst = conn.prepareStatement(sql);
         for(HashMap map : list) {
        	 pst.setString(1,(String)map.get("bookname"));
        	 pst.setString(2,(String)map.get("author"));
        	 pst.setString(3,(String)map.get("publisher"));
        	 pst.setString(4,(String)map.get("recom_month"));
        	 pst.executeUpdate();
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
}