package com.mvc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "teacher")
public class Teacher {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String teachername;
	private String gender;
	private String address;
	private String city;
	private String state;
	private String country;

	private String classess;
	private String subjects;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getClassess() {
		return classess;
	}

	public void setClassess(String classess) {
		this.classess = classess;
	}

	public String getSubjects() {
		return subjects;
	}

	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", teachername=" + teachername + ", gender=" + gender + ", address=" + address
				+ ", city=" + city + ", state=" + state + ", country=" + country + ", classess=" + classess
				+ ", subjects=" + subjects + "]";
	}

	public Teacher(int id, String teachername, String gender, String address, String city, String state,
			String country, String classess, String subjects) {
		super();
		this.id = id;
		this.teachername = teachername;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
		this.classess = classess;
		this.subjects = subjects;
	}

	public Teacher() {
		super();
	}

}
