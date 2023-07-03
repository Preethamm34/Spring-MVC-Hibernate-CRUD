package com.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractRefreshableConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvc.ExcelReport.ExcelReport;
import com.mvc.model.Teacher;
import com.mvc.service.TeacherService;

@Controller
public class TeacherController {

	@Autowired
	TeacherService teacherService;

	// VIEW HOME PAGE
	@RequestMapping(path = "/home")
	public String home() {
		return "home";
	}

	// DISPLAY ALL Teacher Details in A PAGE
	@GetMapping("teacherReport")
	public String loadTeacher(Model model) {
		model.addAttribute("teacher", teacherService.listTeacher());
		return "TeacherReport";
	}

	// ADD Teacher
	@RequestMapping("addTeacher")
	public String addTeach() {
		return "AddTeacher";
	}

	// INSERT TEACHER DETAILS TO DB
	@PostMapping("insertTeacher")
	public String insertTeacher(@ModelAttribute("insertTeacher") Teacher teach) {
		teacherService.addTeacher(teach);
		return "redirect:teacherReport";
	}

	// LOAD EDIT TEACHER FORM //updateTeacher
	@GetMapping("/editTeacher/{id}")
	public String loadEditTeacherForm(@PathVariable(value = "id") int id, Model model) {
		Teacher teach = teacherService.getTeacherById(id);
		model.addAttribute("teacher", teach);
		System.out.println(teach);
		
		//loading company logo - start
		 byte[] bytes = teacherService.getImageInBytes(id);
		 String base64Image = Base64.encodeBase64String(bytes);
		 teacherService.setImage(base64Image);
      //loading company logo - end
		
		return "EditTeacher";
	}

	// UPDATE
	@PostMapping("/editTeacher/updateTeacher")
	public String updateTeach(@ModelAttribute("updateTeacher") Teacher teach) {
		teacherService.updateTeacher(teach);
		return "redirect:/teacherReport";
	}

	// DELETE
	@GetMapping("/deleteTeacher/{id}")
	public String deleteTeacher(@PathVariable("id") int id) {
		this.teacherService.deleteTeacher(id);
		return "redirect:teacherReport";
	}

	// Export data to excel file
	@GetMapping("/excelExport")
	public ModelAndView exportToExcel() {
		ModelAndView mav = new ModelAndView();
		mav.setView(new ExcelReport());
		// read data from DB
		List<Teacher> list = teacherService.listTeacher();
		// send to excelImpl class
		mav.addObject("list", list);
		return mav;
	}

	// VIEW PRINT REPORT PAGE
	@RequestMapping("printReport")
	public String printReport() {
		return "PrintReport";
	}

/////////////////////////////////////////////////SEARCH OPERATION\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	// VIEW SEARCH PAGE IN HOME PAGE
	@RequestMapping(path = "/searchPage")
	public String searchPage() {
		return "SearchReport";
	}

	// SEARCH BY TEACHER NAME
	@RequestMapping("searchTN")
	public String searchTeacherName(@RequestParam("teachername") String teachername, Model model) {
		List<Teacher> teacher = teacherService.getTeacherByTeacherName(teachername);
		model.addAttribute("teacher", teacher);
		model.addAttribute("teachername", teachername);
		return "TeacherReport";
	}

//SEARCH BY CLASSESS HALDELED
	@RequestMapping("searchC")
	public String searchTeacherClassessHandeled(@RequestParam("classess") String classess, Model model) {
		List<Teacher> teacher = teacherService.getTeacherByClassess(classess);
		model.addAttribute("teacher", teacher);
		model.addAttribute("classes s", classess);
		return "TeacherReport";
	}

	// SEARCH BY ALL
	@RequestMapping("searchAll")
	public String searchAll(Model model, @RequestParam("keyword") String keyword) {
		List<Teacher> teacher = teacherService.searchAll(keyword);
		model.addAttribute("teacher", teacher);
		model.addAttribute("keyword", keyword);
		return "TeacherReport";
	}
/////////////////////////////////////////////////SEARCH OPERATION\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



	@RequestMapping("/view/{id}")
	public String viewDetails(@PathVariable("id") int id, Model model) {
		Teacher teacher = teacherService.viewTeacherById(id);
		model.addAttribute("teacher", teacher);
		System.out.println(id +""+ teacher);
		return "viewDetails";
	}

}

