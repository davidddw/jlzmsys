package org.cloud.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cloud.ssm.domain.Department;
import org.cloud.ssm.domain.ResponseMessage;
import org.cloud.ssm.domain.Result;
import org.cloud.ssm.dto.DepartmentDto;
import org.cloud.ssm.service.IDepartmentService;
import org.cloud.ssm.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DepartmentController extends BaseController {

    @Autowired
    private IDepartmentService departmentService;

    /**
     * Page
     * @param request
     * @param session
     * @return
     */
    @GetMapping("/department")
    public String departmentPage(HttpServletRequest request, HttpSession session){
        return "admin/department";
    }
    
    /**
     * Export
	 * @param HttpServletRequest request 
	 * @return 部署の出力処理。
	 * @throws IOException 
	 */
	@GetMapping("/exportDepartment")
	public void exportDepartment(HttpServletRequest request,HttpServletResponse response, DepartmentDto departmentDto) throws IOException {
		String excelFileName = "図書一覧";
		String[] titles = {"図書編号","図書名称","作者"};
		String[] columns = {"sn","name","author"};
		List<Department> list = departmentService.getDepartmentList(departmentDto);
		ExcelUtil.export(columns, titles, list, excelFileName, response);
	}

    /**
     * List
     * @param HttpServletRequest request
     * @return 4-1．部署の新規処理。
     */
    @PostMapping("/listDepartment")
    @ResponseBody
    public ResponseMessage<Department> listDepartmentHandler(DepartmentDto departmentDto){
        int total = departmentService.getDepartmentCount(departmentDto);
        List<Department> list = departmentService.getDepartmentList(departmentDto);
        return new ResponseMessage<Department>(total, list);
    }
    
    /**
     * Get One
     * @param sn
     * @return
     */
    @PostMapping("/getDepartment")
	@ResponseBody
	public Department getDepartmentHandler(String id) {
		return departmentService.getById(Integer.valueOf(id)).orElse(null);
	}
    
	/**
	 * Delete
	 * 
	 * @param sn
	 * @return
	 */
	@PostMapping("/deleteDepartment")
	@ResponseBody
	public Result departmentDeleteHandler(String id) {
		Result result = new Result();
		result.setSuccess(false);
		if (departmentService.deleteById(Integer.valueOf(id)) > 0) {
			result.setSuccess(true);
		}
		return result;
	}

    /**
     * Save
     * @param departmentDto
     * @return
     */
    @PostMapping("/saveDepartment")
	@ResponseBody
	public Result saveDepartmentHandler(DepartmentDto departmentDto) {
		Result result = new Result();
		result.setSuccess(false);
		String userNameString = getStaffName();
		Department department = departmentDto.generateBean();
		String id = departmentDto.getId();
		if ("".equals(id)) {
			department.setAddBy(userNameString);
			department.setUpdateBy(userNameString);
			department.setDeleteSign("0");
	        department.setLockVersionCount("0");
		} else {
			department.setUpdateBy(userNameString);
		}
		if (departmentService.save(department) > 0) {
			result.setSuccess(true);
		}
		return result;
	}
}
