package kh.coupon.mvc.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.dto.MemberDto;

@Controller
@RequestMapping("home")
public class HomeController {
	
	@Autowired	private MemberBiz memberBiz;
	@Autowired	private Logger logger;


	@RequestMapping("registerPage")
	public String register_page() {
		//user 인지 client 인지를 구분하는 값(member_role)을 받아와서 if문 사용해 return의 보내질 곳 수정해야 함
		return "register";
	}
	
	@RequestMapping("register/{role}")
	public String register_form(Model model, @PathVariable(value="role") String role, HttpServletRequest req) {
		String member_role = "";
		if(role.equals("user")) {	
			member_role="ROLE_USER";
		} else if (role.equals("client")) {
			member_role="ROLE_CLIENT";
		}
		MemberDto dto = new MemberDto();
		dto.setMember_role(member_role);
		model.addAttribute("dto", dto);
		req.setAttribute("member_role", member_role);
		return "registerForm";
	}
	
	@RequestMapping(value="registerConfirm", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("dto") MemberDto dto, BindingResult bind) {
		System.out.println("member_role : " +dto.getMember_role());
		if(bind.hasErrors()) {
			logger.info("서식 오류");
			return "registerForm";
		} else {
			int res = memberBiz.insert(dto);
			if(res > 0) {
				logger.info("회원가입 성공");
				return "index";
			} else {
				logger.info("회원가입 실패");
				return "registerForm";
			}
		}
	}
	
	@RequestMapping("register/{role}/idchk")
	public String idchk(Model model, String member_id, @PathVariable(value="role") String role) {
		MemberDto dto = new MemberDto(member_id, role);
		String res = memberBiz.idChk(dto);
		boolean idNotUsed = true;
		if(res != null) {
			idNotUsed = false;
		}
		model.addAttribute("idNotUsed", idNotUsed);
		return "memberIdChk";
	}
	
	@RequestMapping("main")
	public String main() {
		return "main";
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
