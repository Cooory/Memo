package com.cooory.memo.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cooory.memo.user.domain.User;
import com.cooory.memo.user.service.UserService;

// API 를 만들기 위한 Controller (API 전용)
@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/login")
	public Map<String, String> login(
		@RequestParam("loginId") String loginId
		, @RequestParam("password") String password
		, HttpServletRequest request) {
		
		User user = userService.getUser(loginId, password);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (user != null) {
			// 로그인 성공
			HttpSession session = request.getSession();
			// 세션에 로그인이 되었다 라는 정보를 저장
			// 세션에 사용자와 관련된 정보를 저장
			// 세션에 사용자 정보가 저장된 경우 로그인된 상태로 파악
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@PostMapping("/join")
	public Map<String, String> join(
		@RequestParam("loginId") String loginId
		, @RequestParam("password") String password
		, @RequestParam("name") String name
		, @RequestParam("email") String email) {
		
		User user = userService.addUser(loginId, password, name, email);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (user != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
}
