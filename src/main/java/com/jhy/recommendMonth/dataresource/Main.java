package com.jhy.recommendMonth.dataresource;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i = 1 ; i <= 12 ; i++) {
			new XmlParser(i);
		}
	}
}