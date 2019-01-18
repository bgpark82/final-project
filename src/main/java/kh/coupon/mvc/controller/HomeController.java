package kh.coupon.mvc.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.dto.MemberDto;

@Controller
@RequestMapping("home")
public class HomeController {
	
	@Autowired	private MemberBiz memberBiz;
	@Autowired	private Logger logger;


	@RequestMapping("registerform")
	public String register_form(Model model) {
		model.addAttribute("dto",new MemberDto());
		//user 인지 client 인지를 구분하는 값(member_role)을 받아와서 if문 사용해 return의 보내질 곳 수정해야 함
		return "userViews/userRegisterForm";
	}
	
	@RequestMapping("register")
	public String register(@Valid @ModelAttribute("dto") MemberDto dto, BindingResult bind) {
		if(bind.hasErrors()) {
			logger.info("서식 오류");
			return "userViews/userRegisterForm";
		} else {
			int res = memberBiz.insert(dto);
			if(res > 0) {
				logger.info("회원가입 성공");
				return "index";
			} else {
				logger.info("회원가입 실패");
				return "userViews/userRegisterForom";
			}
		}
	}
	
	@RequestMapping("idchk")
	public String idchk(Model model, String member_id) {
		String res = memberBiz.idChk(member_id);
		boolean idNotUsed = true;
		if(res != null) {
			idNotUsed = false;
		}
		model.addAttribute("idNotUsed", idNotUsed);
		return "memberIdChk";
	}
	
	
	
	
	
	
	
	@RequestMapping("test")
	public String test(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("date", date);
		
		return "homeControllerTest";
	}

}
