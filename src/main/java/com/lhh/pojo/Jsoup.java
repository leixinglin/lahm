package com.lhh.pojo;

public class Jsoup {
	private int id;
	private String name;
	private String price;
	private String webUrl;
	private String imgUrl;
	private String brand;
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Jsoup(String name, String price, String webUrl, String imgUrl, String brand) {
		super();
		this.name = name;
		this.price = price;
		this.webUrl = webUrl;
		this.imgUrl = imgUrl;
		this.brand = brand;
	}
	private String date;
	private int sales;
	
	public Jsoup() {
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getWebUrl() {
		return webUrl;
	}
	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
}
