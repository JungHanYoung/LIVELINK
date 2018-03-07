package com.jhy.searchLib.service;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double x1 = 10;
		double x2 = 20;
		
		double y1 = 30;
		double y2 = 40;
		
		double height = x2-x1;
		double weight = y2-y1;
		
		double distance = height*height + weight*weight;

		distance = Math.sqrt(distance);
		System.out.println(distance);

	}

}
