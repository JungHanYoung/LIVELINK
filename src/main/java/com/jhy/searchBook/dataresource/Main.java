package com.jhy.searchBook.dataresource;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i = 1 ; i <= 20 ; i++) {
			new XmlParser(i);
			System.out.println("도서관들페이지1완료");
		}
	}

}
