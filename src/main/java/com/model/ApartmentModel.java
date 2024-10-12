package com.model;

public class ApartmentModel {
	private int id;
	private String name;
    private String location;
    private int numberOfRooms;
    private double price;
    private String imageUrl;
    

	public ApartmentModel() {
		// TODO Auto-generated constructor stub
	}

	public ApartmentModel(int id, String name, String location, int numberOfRooms, double price, String imageUrl) {
		super();
		this.id = id;
		this.name = name;
		this.location = location;
		this.numberOfRooms = numberOfRooms;
		this.price = price;
		this.imageUrl = imageUrl;
	}
	
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getLocation() {
		return location;
	}

	public int getNumberOfRooms() {
		return numberOfRooms;
	}

	public double getPrice() {
		return price;
	}

	public String getImageUrl() {
		return imageUrl;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setNumberOfRooms(int numberOfRooms) {
		this.numberOfRooms = numberOfRooms;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	

}
