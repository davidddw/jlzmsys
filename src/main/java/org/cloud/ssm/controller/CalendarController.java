package org.cloud.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cloud.ssm.domain.CodeMaster;
import org.cloud.ssm.domain.ResponseMessage;
import org.cloud.ssm.domain.Result;
import org.cloud.ssm.domain.WorkCalendar;
import org.cloud.ssm.dto.WorkCalendarDto;
import org.cloud.ssm.service.ICalendarService;
import org.cloud.ssm.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class CalendarController extends BaseController {

	@Autowired
	private ICalendarService calendarService;

	/*
	 * @param:cdMaster：マスター一覧页面跳转
	 * 
	 * @return:String(cdMaster)マスター一覧页面地址
	 */
	@GetMapping("/calendar")
	public String calendarHandler(HttpServletRequest request, HttpSession session) {
		return "admin/calendar";
	}

	/**
	 * List
	 * 
	 * @param workCalendarDto
	 * @return
	 */
	@PostMapping("/listCalendar")
	@ResponseBody
	public ResponseMessage<WorkCalendar> listCalendarHandler(WorkCalendarDto workCalendarDto) {
		int total = calendarService.getCalendarCount(workCalendarDto);
		List<WorkCalendar> list = calendarService.getCalendarList(workCalendarDto);
		return new ResponseMessage<WorkCalendar>(total, list);
	}

	/**
	 * 导入
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/importCalendar")
	@ResponseBody
	public Result importCalendarFromExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws Exception {
		Result result = new Result();
		result.setSuccess(false);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("uploadExcel");
		String[] titleColumn = { "ymd", "hldSgn", "memo" };
		List<WorkCalendar> list = ExcelUtil.getObjectListFromExcel(file, 1, 3, titleColumn, WorkCalendar.class);
		String userNameString = getStaffName();
		int count = calendarService.saveBatch(list, userNameString);
		if (count > 0) {
			result.setSuccess(true);
		}
		return result;
	}

	/**
	 * 
	 * @param HttpServletRequest
	 *            request
	 * @return 部署の出力処理。
	 * @throws IOException
	 */
	@GetMapping("/exportCalendar")
	public void exportBooks(HttpServletRequest request, HttpServletResponse response, WorkCalendarDto workCalendarDto)
	        throws IOException {
		String excelFileName = "図書一覧";
		String[] titles = { "年月日", "休日", "備考" };
		String[] columns = {"ymd", "hldSgn", "memo" };
		List<WorkCalendar> list = calendarService.getCalendarList(workCalendarDto);
		ExcelUtil.export(columns, titles, list, excelFileName, response);
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@PostMapping("/getCalendar")
	@ResponseBody
	public WorkCalendar getCalendarHandler(String id) {
		return calendarService.getById(Integer.valueOf(id)).orElse(null);
	}
	
	@PostMapping("/getHldSgn")
	@ResponseBody
	public List<CodeMaster> getHldSgnHandler() {
		return calendarService.getHldSgn();
	}
	
	@PostMapping("/saveCalendar")
	@ResponseBody
	public Result saveCodeMasterHandler(WorkCalendarDto workCalendarDto) {
		Result result = new Result();
		result.setSuccess(false);
		WorkCalendar workCalendar = workCalendarDto.generateBean();
		if (calendarService.save(workCalendar) > 0) {
			result.setSuccess(true);
		}
		return result;
	}
}
