package com.tour.dto;

import java.sql.Timestamp;

public class TourVO {
	private String country;
	private String video;
	private String youtuber;
	private String title;
	private int num;
	private Timestamp writedate;
	
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getYoutuber() {
		return youtuber;
	}
	public void setYoutuber(String youtuber) {
		this.youtuber = youtuber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
