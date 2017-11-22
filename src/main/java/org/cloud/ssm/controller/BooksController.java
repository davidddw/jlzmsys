package org.cloud.ssm.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cloud.ssm.domain.Books;
import org.cloud.ssm.domain.ResponseMessage;
import org.cloud.ssm.domain.Result;
import org.cloud.ssm.dto.BooksDto;
import org.cloud.ssm.service.IBooksService;
import org.cloud.ssm.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BooksController extends BaseController {

	@Autowired
	private IBooksService booksService;

	@GetMapping("/books")
	public String booksPage(HttpServletRequest request, HttpSession session) {
		return "admin/books";
	}
	
	/**
	 * @param HttpServletRequest request 
	 * @return 部署の出力処理。
	 * @throws IOException 
	 */
	@GetMapping("/exportBooks")
	public void exportBooks(HttpServletRequest request,HttpServletResponse response, BooksDto booksDto) throws IOException {
		String excelFileName = "図書一覧";
		String[] titles = {"図書編号","図書名称","作者"};
		String[] columns = {"sn","name","author"};
		List<Books> list = booksService.getBooksList(booksDto);
		ExcelUtil.export(columns, titles, list, excelFileName, response);
	}

	/**
	 * @param HttpServletRequest
	 *            request
	 * @return 4-1．部署の新規処理。
	 */
	@PostMapping("/listBooks")
	@ResponseBody
	public ResponseMessage<Books> listBooksHandler(BooksDto booksDto) {
		int total = booksService.getBooksCount(booksDto);
		List<Books> list = booksService.getBooksList(booksDto);
		return new ResponseMessage<Books>(total, list);
	}

	@PostMapping("/getBooks")
	@ResponseBody
	public Books getBooksHandler(String id) {
		Optional<Books> optional = booksService.getById(Integer.valueOf(id));
		return optional.orElse(null);
	}

	@PostMapping("/saveBooks")
	@ResponseBody
	public Result saveBooksHandler(BooksDto booksDto) {
		Result result = new Result();
		result.setSuccess(false);
		String userNameString = getStaffName();
		Books books = booksDto.generateBean();
		String id = booksDto.getId();
		if ("".equals(id)) {
			books.setAddBy(userNameString);
			books.setUpdateBy(userNameString);
			books.setDeleteSign("0");
	    	books.setLockVersionCount("0");
		} else {
			books.setUpdateBy(userNameString);
		}
		if (booksService.save(books) > 0) {
			result.setSuccess(true);
		}
		return result;
	}

	@PostMapping("/deleteBooks")
	@ResponseBody
	public Result deleteBooksHandler(String id) {
		Result result = new Result();
		result.setSuccess(false);
		if (booksService.deleteById(Integer.valueOf(id)) > 0) {
			result.setSuccess(true);
		}
		return result;
	}
}
