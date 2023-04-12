package kr.co.reserve.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.reserve.domain.Reservation;
import kr.co.reserve.domain.User;
import kr.co.reserve.service.ReserveService;
import kr.co.reserve.service.UserService;

@Controller
public class MypageController {

	@Autowired
	ReserveService reserveService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "/mypage/reservationInfo", method = RequestMethod.GET)
	public ModelAndView getMypage(HttpServletRequest request, ModelAndView mav) {
		User user = null;
		int memberNo = 0;
		List<Reservation> list = null;
		HttpSession session = request.getSession();
		user = (User) session.getAttribute("User");
		memberNo = user.getUserNo();

		list = reserveService.getMyRsvList(memberNo);
		System.out.print(list);
		mav.addObject("rsvList", list);
		mav.setViewName("reservationInfo");
		return mav;
	}

	@RequestMapping(value = "/mypage/memberInfo", method = RequestMethod.GET)
	public ModelAndView getMemberInfo(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession();
		User user = null;
		session.getAttribute("User");
		mav.addObject("User", user);
		mav.setViewName("memberInfo");
		return mav;
	}

	

}