package kr.co.reserve.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.reserve.domain.Board;
import kr.co.reserve.domain.Reply;
import kr.co.reserve.domain.User;
import kr.co.reserve.service.BoardService;
import kr.co.reserve.service.ReplyService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	@Autowired
	ReplyService replyService;

	@RequestMapping("/board")
	public ModelAndView toaskList(ModelAndView mav, @RequestParam int page) {
		List<Board> boardList = null;
		int total = service.getCount();
		boardList = service.getList(total, page);
		mav = new ModelAndView();
		mav.addObject("total", total);
		mav.addObject("boardList", boardList);
		mav.setViewName("/board");
		return mav;
	}

	@RequestMapping(value = "/board/detail/{boardNo}", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public ModelAndView getDetail(ModelAndView mav, @PathVariable("boardNo") int boardNo) {
		Board board = service.getDetail(boardNo);
		List<Reply> list = replyService.getReplyList(boardNo);
		mav.addObject("board", board);
		mav.addObject("replyList", list);
		mav.setViewName("/boardDetail");
		return mav;
	}

	@RequestMapping(value = "/board/modify/{boardNo}", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public ModelAndView modify(ModelAndView mav, @PathVariable("boardNo") int boardNo) {
		Board board = service.getDetail(boardNo);
		mav.addObject("board", board);
		mav.setViewName("/boardModify");
		return mav;
	}

	@RequestMapping("/board/delete/{boardNo}")
	public void delete(HttpServletResponse response, ModelAndView mav, @PathVariable("boardNo") int boardNo)
			throws IOException {
		int cnt = 0;
		cnt = service.delete(boardNo);
		if (cnt != 0) {
			response.sendRedirect("/board?page=1");
		}

	}

	/*
	 * RestController Start
	 * -----------------------------------------------------------------------------
	 * -
	 */

	@RequestMapping("/board/insert")
	@ResponseBody
	public String askInsert(HttpServletRequest request, @RequestBody Board ask, User user) {
		String result = null;
		int userNo = 0;
		int cnt = 0;
		HttpSession session = request.getSession();

		user = (User) session.getAttribute("User");
		userNo = user.getUserNo();
		ask.setUserNo(userNo);

		cnt = service.askInsert(ask);

		if (cnt > 0) {
			result = "{\"result\":\"ok\"}";
		} else {
			result = "{\"result\":\"failure\"}";
		}
		return result;

	}

	@RequestMapping("/board/modify")
	@ResponseBody
	public String modifyAdmit(@RequestBody Board ask) {
		String result = null;
		int cnt = 0;

		cnt = service.modify(ask);
		if (cnt > 0) {
			result = "{\"result\":\"ok\"}";
		} else {
			result = "{\"result\":\"failure\"}";
		}
		return result;
	}

}