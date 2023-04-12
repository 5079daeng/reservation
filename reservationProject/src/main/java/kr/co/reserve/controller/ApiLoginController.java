package kr.co.reserve.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.reserve.domain.User;
import kr.co.reserve.service.UserService;

@RestController
public class ApiLoginController {


	
	@Autowired 
	UserService userService;

    @Autowired
	BCryptPasswordEncoder encoder;
    
	@PostMapping("/login")
	public String loginCheck(HttpServletRequest request, @RequestBody String requestbody) {

		String dbPw = null;
		String result = null;
		
		JSONObject json = new JSONObject(requestbody);
		
		String id = json.getString("id");
		String pw = json.getString("pw");
		
		HttpSession session = request.getSession();
	
		dbPw = userService.getPw(id);

		encoder.matches(pw, dbPw);

		if (encoder.matches(pw, dbPw)) {	
		User user = userService.getUser(id);
		session.setAttribute("User", user);
			result = "{\"result\" : \"ok\"}";
		} else {
			result = "{\"result\" : \"fail\"}";
		}

		return result;

	}
	
	@PostMapping("/user/idDuplicateCheck")
	public String idDuplicateCheck(HttpServletRequest request, @RequestBody String requestbody) {
		
		String result  = null; 
		if(userService.checkId(requestbody) == 0 ) {
			result = "{\"result\":\"ok\"}";
		} else {
			result = "{\"result\":\"failure\"}";
		}
		
		return result;
		
	} 
	
	
	
	@PostMapping("/user/doJoin") 
	public String doJoin(HttpServletRequest request, @RequestBody String requestbody) { 
		String result = ""; 
		JSONObject obj = new JSONObject(requestbody); 
		String id = null, pw = null, address = null, email = null, cellphone = null, name = null; 
		int count = 0; 
		id = obj.getString("id");
		pw = obj.getString("pw");
		pw = encoder.encode(pw);
		name = obj.getString("name");
		address = obj.isNull("address") ? null : obj.getString("address");
		email = obj.isNull("email") ? null : obj.getString("email");
		cellphone = obj.isNull("cellphone") ? null : obj.getString("cellphone");
		
	  count = userService.doJoin(id, pw, name,email, cellphone, address);
	  if(count > 0) {
		result = "{\"result\":\"ok\"}";
	  } else {
		  result = "{\"result\":\"failure\"}";
	  }
		
		return result; 
		
	}
	
	@RequestMapping(value = "/user/modify", method = RequestMethod.POST)
	@ResponseBody
	public String modifyInfo(@RequestBody User user) {
		String result = null, pw = null; 
		int count = 0;
		// 비밀번호 암호화
		pw = encoder.encode(user.getPw());
		user.setPw(pw);

		count = userService.modifyInfo(user);
		if (count > 0) {
			result = "{\"result\": \"ok\"}";
		} else {
			result = "{\"result\": \"failure\"}";
		}

		return result;
	}
	
	

}
