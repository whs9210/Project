package com.champion.mvc01;

public class PlaceDTO {
	String pname;
	String addr;
	Float lat;
	Float lng;
	String category;
	int marked;
	String images;
	int imgnumber;
	String content;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Float getLat() {
		return lat;
	}
	public void setLat(Float lat) {
		this.lat = lat;
	}
	@Override
	public String toString() {
		return "PlaceDTO2 [pname=" + pname + ", addr=" + addr + ", lat=" + lat + ", lng=" + lng + ", category="
				+ category + ", marked=" + marked + ", images=" + images + ", imgnumber=" + imgnumber + ", content="
				+ content + ", getPname()=" + getPname() + ", getAddr()=" + getAddr() + ", getLat()=" + getLat()
				+ ", getImgnumber()=" + getImgnumber() + ", getLng()=" + getLng() + ", getCategory()=" + getCategory()
				+ ", getMarked()=" + getMarked() + ", getImages()=" + getImages() + ", getContent()=" + getContent()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	public int getImgnumber() {
		return imgnumber;
	}
	public void setImgnumber(int imgnumber) {
		this.imgnumber = imgnumber;
	}
	public Float getLng() {
		return lng;
	}
	public void setLng(Float lng) {
		this.lng = lng;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getMarked() {
		return marked;
	}
	public void setMarked(int marked) {
		this.marked = marked;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

	
}
