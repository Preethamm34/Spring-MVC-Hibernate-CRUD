package com.mvc.dao;

import java.util.List;

import com.mvc.model.Teacher;

public interface TeacherDao {

	/// ADD
	public void addTeacher(Teacher teach);

	// GET ALL
	public List<Teacher> listTeacher();

	// GET BY ID
	public Teacher getTeacherById(int id);

	// UPDATE OR EDIT
	public void updateTeacher(Teacher teach);

	// DELETE
	public void deleteTeacher(int id);

	// SEARCH
	public List<Teacher> getTeacherByTeacherName(String teachername);

	public List<Teacher> getTeacherByClassess(String classess);

	/*
	 * public List<Teacher> getAll(int id, String teachername, String gender, String
	 * address, String city, String state, String country, String classess, String
	 * subjects);
	 */
	
	 public List<Teacher> searchAll(String keyword);
	 
	 public Teacher viewTeacherById(int id);
}
