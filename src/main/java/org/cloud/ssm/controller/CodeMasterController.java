package org.cloud.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cloud.ssm.domain.CodeMaster;
import org.cloud.ssm.domain.ResponseMessage;
import org.cloud.ssm.domain.Result;
import org.cloud.ssm.dto.CodeMasterDto;
import org.cloud.ssm.service.ICodeMasterService;
import org.cloud.ssm.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CodeMasterController extends BaseController {

    @Autowired
    private ICodeMasterService codeMasterService;

    /*
     * @param:cdMaster：マスター一覧页面跳转
     *
     * @return:String(cdMaster)マスター一覧页面地址
     */
    @GetMapping("/codeMaster")
    public String cdMaster(HttpServletRequest request, HttpSession session) {
        return "admin/codeMaster";
    }

    /**
	 * @param HttpServletRequest request 
	 * @return 部署の出力処理。
	 * @throws IOException 
	 */
	@GetMapping("/exportCodeMaster")
	public void exportCodeMaster(HttpServletRequest request,HttpServletResponse response, CodeMasterDto codeMasterDto) throws IOException {
		String excelFileName = "図書一覧";
		String[] titles = {"タイプ（日本語名）","タイプ（英語名）","コード","コード値"};
		String[] columns = {"type","typeEn","codeName","code"};
		List<CodeMaster> list = codeMasterService.getCodeMasterList(codeMasterDto);
		ExcelUtil.export(columns, titles, list, excelFileName, response);
	}

	/**
	 * @param HttpServletRequest
	 *            request
	 * @return 4-1．部署の新規処理。
	 */
	@PostMapping("/listCodeMaster")
	@ResponseBody
	public ResponseMessage<CodeMaster> listCodeMasterHandler(CodeMasterDto codeMasterDto) {
		int total = codeMasterService.getCodeMasterCount(codeMasterDto);
		List<CodeMaster> list = codeMasterService.getCodeMasterList(codeMasterDto);
		return new ResponseMessage<CodeMaster>(total, list);
	}

	@PostMapping("/getCodeMaster")
	@ResponseBody
	public CodeMaster getCodeMasterHandler(String id) {
		return codeMasterService.getById(Integer.valueOf(id)).orElse(null);
	}

	@PostMapping("/saveCodeMaster")
	@ResponseBody
	public Result saveCodeMasterHandler(CodeMasterDto codeMasterDto) {
		Result result = new Result();
		result.setSuccess(false);
		CodeMaster codeMaster = codeMasterDto.generateBean();
		if (codeMasterService.save(codeMaster) > 0) {
			result.setSuccess(true);
		}
		return result;
	}

	@PostMapping("/deleteCodeMaster")
	@ResponseBody
	public Result deleteCodeMasterHandler(String id) {
		Result result = new Result();
		result.setSuccess(false);
		if (codeMasterService.deleteById(Integer.valueOf(id)) > 0) {
			result.setSuccess(true);
		}
		return result;
	}
}
