package kh.coupon.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.dto.MemberDto;

@Controller
@RequestMapping("user")
public class UserContoller {
	

	
	
/*	작성자 : 장세훈
	작성 날짜 : 19.01.15
	기능 : 요청에 따라 해당 뷰로 보내주는 기능을 테스트 하는 메소드
	사용하는 DB 테이블 : -
	부가 설명 :  WEB-INF/views/userViews 폴더 안에 있는 userControllerTest.jsp 로 보내준다. */
	@RequestMapping("test")
	public String test() {
		return "userViews/userControllerTest";
	}
		
	
	

}
