package org.cloud.ssm.controller;

import java.util.List;

import org.cloud.ssm.domain.ResponseMessage;
import org.cloud.ssm.domain.User;
import org.cloud.ssm.dto.UserDto;
import org.cloud.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private IUserService userService;

	@GetMapping("/user")
	public String userPage(HttpServletRequest request, HttpSession session){
		return "admin/user";
	}
	
	@PostMapping("/userList")
	@ResponseBody
    public ResponseMessage<User> userListHandler(UserDto userDto) {
		int total = userService.getUserCount(userDto);
		List<User> list = userService.getAllUsers(userDto);
		return new ResponseMessage<User>(total, list);
    }
}
