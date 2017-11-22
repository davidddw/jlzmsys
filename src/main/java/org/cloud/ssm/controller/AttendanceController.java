package org.cloud.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cloud.ssm.domain.Attendance;
import org.cloud.ssm.domain.User;
import org.cloud.ssm.service.IAttendanceService;
import org.cloud.ssm.util.DateTimeUtil;
import org.cloud.ssm.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AttendanceController {

	@Autowired
	private IAttendanceService attendanceService;

	@GetMapping(value = "/attendance")
	public ModelAndView attendancePageHandler(HttpServletRequest request) {
		ModelAndView result = new ModelAndView("admin/attendance");
		// result.addObject("menuLists", list);
		return result;
	}

	// 勤怠导入
	@RequestMapping(value = "/attendanceImport", method = {RequestMethod.POST})
	@ResponseBody
	public String getAttdncListByExcel(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("uploadExcel");
		List<List<String>> listObjects = ExcelUtil.getData(file, 1, 10);
		User user = (User) session.getAttribute("user");
		List<Attendance> list = convertDataToAttendance(listObjects, user);
		int count = attendanceService.saveAttendancecList(list);
		return count > 0 ? "success" : "fail";
	}
	
	/**
	 * excel data to java bean
	 * 
	 * @param obj
	 * @param user
	 * @return
	 */
	private List<Attendance> convertDataToAttendance(List<List<String>> obj, User user) {
		List<Attendance> list = new ArrayList<>();
		for (List<String> rowObj : obj) {
			Attendance attendance = new Attendance();
			attendance.setUserId(rowObj.get(1).trim());
			attendance.setYmd(DateTimeUtil.parseDateAndWeek(rowObj.get(3)));
			attendance.setStrwkTime(rowObj.get(4));
			attendance.setEndwkTime(rowObj.get(6));
			attendance.setWorkOnDes(rowObj.get(5));
			attendance.setWorkOffDes(rowObj.get(7));
			int lateTime = rowObj.get(8) != "" ? Integer.parseInt(rowObj.get(8)) : 0;
			attendance.setLateTime(lateTime);
			int earlyTime = rowObj.get(9) != "" ? Integer.parseInt(rowObj.get(9)) : 0;
			attendance.setEarlyTime(earlyTime);
			attendance.setAddBy(user.getUserName());
			attendance.setUpdateBy(user.getUserName());
			attendance.setDeleteSign("0");
			attendance.setLockVersionCount("0");
			// 勤怠取込結果コード 0,1,2,3,4
			attendance.setAttdncImpRsltCd("0");
			// 勤怠区分 1 2 4 5
			attendance.setAttdncDiv("5");
			// 残業時間
			attendance.setOvtmwkTime(0);
			// 勤務時間
			attendance.setWkTime(0);
			// 勤怠修正理由区分
			attendance.setAttdncChgRsnDiv("1");
			attendance.setAttdncChgRsnCont("");
			list.add(attendance);
		}
		return list;
	}

	// @GetMapping(value = "/attendanceData")
	// @ResponseBody
	// public List<MenuItem> menulist(HttpServletRequest request, HttpSession
	// session) {
	// List<MenuItem> list = null;
	// User user = (User) session.getAttribute("user");
	// return menuItemService.getTreeData(5);
	// }
}
