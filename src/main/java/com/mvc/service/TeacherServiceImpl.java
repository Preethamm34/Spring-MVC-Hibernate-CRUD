package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.mvc.dao.TeacherDao;
import com.mvc.model.Teacher;

@Component
@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	TeacherDao teacherDao;

	public void addTeacher(Teacher teach) {
		teacherDao.addTeacher(teach);
	}

	public List<Teacher> listTeacher() {
		return teacherDao.listTeacher();
	}

	public Teacher getTeacherById(int id) {
		return teacherDao.getTeacherById(id);
	}

	public void updateTeacher(Teacher teach) {
		teacherDao.updateTeacher(teach);
	}

	public void deleteTeacher(int id) {
		teacherDao.deleteTeacher(id);
	}

	// SEARCH OPERATION \\\\\\\\\\\\\\\\\\\\\\\\\\
	public List<Teacher> getTeacherByTeacherName(String teachername) {
		return teacherDao.getTeacherByTeacherName(teachername);
	}

	public List<Teacher> getTeacherByClassess(String classess) {
		return teacherDao.getTeacherByClassess(classess);
	}

	/*
	 * public List<Teacher> getAll(int id, String teachername, String gender, String
	 * address, String city, String state, String country, String classess, String
	 * subjects) { return teacherDao.getAll(id, teachername, gender, address, city,
	 * state, country, classess, subjects); }
	 */

	public List<Teacher> searchAll(String keyword) {
		return teacherDao.searchAll(keyword);
	}
	// SEARCH OPERATION \\\\\\\\\\\\\\\\\\\\\\\\\\

	public Teacher viewTeacherById(int id) {
		return teacherDao.viewTeacherById(id);
	}

}
