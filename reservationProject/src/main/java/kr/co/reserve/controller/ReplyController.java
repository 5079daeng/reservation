package kr.co.reserve.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.reserve.domain.Reply;
import kr.co.reserve.service.ReplyService;

@RestController
public class ReplyController {
	

	@Autowired 
	ReplyService service; 
	
	@PostMapping("/reply/{boardNo}") 
	public String insertReply(@PathVariable int boardNo,Reply reply,HttpSession session ) {
		
		String result = null;
		int cnt = 0; 
		cnt = service.insertReply(session,reply);
		
		if(cnt > 0) {
			result = "{\"result\":\"ok\"}"; 
		} else {
			result = "{\"result\":\"fail\"}"; 
		}
		return result; 
	
	} 
	
	@RequestMapping("/reply/modify/{replyNo}")
	public ModelAndView goToMod(ModelAndView mav, @PathVariable int replyNo) {
		Reply reply = service.getReplyData(replyNo); 
		mav.addObject("reply",reply);
		mav.setViewName("/replyModify");
		return mav;
		
	} 
	
	
	@RequestMapping("/reply/doModify") 
	@ResponseBody
	public String doModify(@RequestBody Reply reply) {
		String result = null;
		int cnt = 0;
		cnt = service.modify(reply);
		
		if(cnt > 0) {
			result = "{\"result\":\"ok\"}"; 
		} else {
			result = "{\"result\":\"failure\"}"; 
		}
		
		
		return result;
		
	} 
	
	
	@RequestMapping("/reply/delete") 
	@ResponseBody
	public String doDelete(@RequestBody Reply reply) {
		String result = null;
		int cnt = 0;
		cnt = service.delete(reply);
		
		if(cnt > 0) {
			result = "{\"result\":\"ok\"}"; 
		} else {
			result = "{\"result\":\"failure\"}"; 
		}
		
		return result;
	
	} 
	
	
	
	
	
	
	
	
} 