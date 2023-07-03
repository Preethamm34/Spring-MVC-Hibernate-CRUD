package com.mvc.dao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mvc.model.Teacher;

@Component
public class TeacherDaoImpl implements TeacherDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	// need to inject session factory
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// ADD
	@Transactional
	public void addTeacher(Teacher teach) {
		hibernateTemplate.save(teach);
	}

	// LIST
	public List<Teacher> listTeacher() {
		return hibernateTemplate.loadAll(Teacher.class);
	}

	// GET BY ID
	@Transactional
	public Teacher getTeacherById(int id) {
		Teacher teach = hibernateTemplate.get(Teacher.class, id);
		return teach;
	}

	// UPDATE
	@Transactional
	public void updateTeacher(Teacher teach) {
		hibernateTemplate.update(teach);
	}

	// Delete
	@Transactional
	public void deleteTeacher(int id) {
		hibernateTemplate.delete(hibernateTemplate.load(Teacher.class, id));
	}

	////// SEARCH
	////// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	public List<Teacher> getTeacherByTeacherName(String teachername) {
		return (List<Teacher>) hibernateTemplate.findByNamedParam("FROM Teacher where teachername=:teachername",
				"teachername", teachername);
	}

	public List<Teacher> getTeacherByClassess(String classess) {
		return (List<Teacher>) hibernateTemplate.findByNamedParam("FROM Teacher where classess=:classess", "classess",
				classess);
	}

	public List<Teacher> searchAll(String keyword) {
		return (List<Teacher>) hibernateTemplate.findByNamedParam(
				"FROM Teacher WHERE teachername=:keyword OR gender=:keyword OR address=:keyword OR city=:keyword OR state=:keyword OR country=:keyword OR classess=:keyword OR subjects=:keyword",
				"keyword", keyword);
	}

	// SEARCH \\\\\\\\\\\\\\\\\\\\\\\\\\
	
	@Transactional
	public Teacher viewTeacherById(int id) {
		Teacher teacher = hibernateTemplate.get(Teacher.class, id);
		return teacher;
	}

	public byte[] getImageInBytes(int id) {
		InputStream inputStream = null;
		byte[] imageBytes = null;
		try {
		Teacher teach = getTeacherById(id);
		if (teach.getFileUpload() != null) {
			java.sql.Blob b = teach.getFileUpload();
			inputStream = b.getBinaryStream();

			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
			imageBytes = outputStream.toByteArray();
		}
		 
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return imageBytes;	}


	
}
