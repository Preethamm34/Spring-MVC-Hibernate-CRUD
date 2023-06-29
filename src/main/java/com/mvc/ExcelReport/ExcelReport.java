package com.mvc.ExcelReport;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.mvc.model.Teacher;

public class ExcelReport extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// define excel file name to be exported
		response.addHeader("Content-Disposition", "attachment;fileName=TeachersData.xlsx");

		// read data provided by controller
		@SuppressWarnings("unchecked")
		List<Teacher> list = (List<Teacher>) model.get("list");

		// create one sheet
		Sheet sheet = workbook.createSheet("Teacher");

		// create row as a header
		Row row = sheet.createRow(0);
		row.createCell(0).setCellValue("Sl No");
		row.createCell(1).setCellValue("Teacher Name");
		row.createCell(2).setCellValue("Gender");
		row.createCell(3).setCellValue("Address");
		row.createCell(4).setCellValue("Country");
		row.createCell(5).setCellValue("State");
		row.createCell(6).setCellValue("City");
		row.createCell(7).setCellValue("Classes Handled");
		row.createCell(8).setCellValue("Subjects");

		// create row1 onwards from List<T>
		int rowNum = 1;
		for (Teacher spec : list) {
			Row row1 = sheet.createRow(rowNum++);

			row1.createCell(0).setCellValue(spec.getId());
			row1.createCell(1).setCellValue(spec.getTeachername());
			row1.createCell(2).setCellValue(spec.getGender());
			row1.createCell(3).setCellValue(spec.getAddress());
			row1.createCell(4).setCellValue(spec.getCountry());
			row1.createCell(5).setCellValue(spec.getState());
			row1.createCell(6).setCellValue(spec.getCity());
			row1.createCell(7).setCellValue(spec.getClassess());
			row1.createCell(8).setCellValue(spec.getSubjects());

		}
	}

}
