package com.champion.mvc01;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

public class Search {

	String pname;
	String addr;
	Float lat;
	Float lng;
	
	ArrayList<Float> all = new ArrayList<Float>();
	
	static ArrayList<ArrayList> name = new ArrayList<ArrayList>();
	public void serach(Float lat, Float lng) {
		all.add(lat);
		all.add(lng);
		name.add(all);
	}
	
}
