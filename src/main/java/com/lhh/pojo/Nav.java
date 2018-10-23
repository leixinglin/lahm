package com.lhh.pojo;

import java.io.Serializable;

public class Nav implements Serializable{
	private int id;
	private String title;
	private String href;
	public Nav() {
		super();
	}
	public Nav(int id, String title, String href) {
		super();
		this.id = id;
		this.title = title;
		this.href = href;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
}
