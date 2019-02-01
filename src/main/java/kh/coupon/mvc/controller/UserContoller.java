package kh.coupon.mvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.coupon.mvc.biz.RegistBiz;
import kh.coupon.mvc.biz.ReviewBiz;
import kh.coupon.mvc.dto.RegistDto;
import kh.coupon.mvc.dto.ReviewDto;

@Controller
@RequestMapping("user")
public class UserContoller {
	
	@Autowired
	private RegistBiz regist_biz;
	@Autowired
	private ReviewBiz review_biz;
	
/*	작성자 : 이민이
	작성 날짜 : 19.01.16
	기능 : 요청에 따라 해당 뷰로 보내주는 기능을 테스트 하는 메소드
	사용하는 DB 테이블 : review_board 테이블, member 테이블
	부가 설명 :  WEB-INF/views/userViews 폴더 안에 있는 여러페이지로 보내준다. 
	      : 간단한 학생회원가입, 로그인과 이용후기 게시판으로 보내준다.*/
	
	@RequestMapping("memberMain")
	public String membermain() {
		return "userViews/memberMain";
	}
	
	@RequestMapping(value="registform")
	public String registform() {
		return "userViews/regist";
	}
	
	@RequestMapping(value="regist_insert", method=RequestMethod.POST)
	public String regist_insert(Model model,RegistDto regist_dto) {
		int res = regist_biz.regist_insert(regist_dto);
		if(res>0) {
			model.addAttribute("list",regist_biz.regist_list());
			return "userViews/regist_list";
		} else {
			return "userViews/regist";
		}
	}
	
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Model model,String member_id,String member_password,HttpSession session) {
		RegistDto regist_dto = regist_biz.login(member_id, member_password);
			if(regist_dto != null) {
				session.setAttribute("regist_dto", regist_dto);
				return "userViews/memberMain";		
			} else {
				return "index";
			}	
	}
	
	@RequestMapping("review_board_list")
	public String review_board_list(Model model) {
		model.addAttribute("list",review_biz.review_list());
		return "userViews/reviewBoardList";
	} 
	
	// 후기게시판에서 제휴업체 구분 검색
	@RequestMapping("review_search")
	public String review_search(Model model,HttpServletRequest request) {
		String condition = request.getParameter("condition");
		System.out.println("제휴업체구분 : " +condition);
		if(condition.equals("7Gram")) {
			model.addAttribute("list", review_biz.review_list_seven());			
		} else if(condition.equals("맥주창고")) {
			model.addAttribute("list", review_biz.review_list_bear());
		} else if(condition.equals("요술포차")) {
			model.addAttribute("list", review_biz.review_list_magic());
		} else if(condition.equals("전체")){
			model.addAttribute("list", review_biz.review_list());
		}
		return "userViews/reviewBoardList";
	}
	
	@RequestMapping("review_detail")
	public String review_detail(Model model,int review_no) {
		review_biz.updateHit(review_no);
		model.addAttribute("dto",review_biz.review_detail(review_no));
		return "userViews/reviewBoardDetail";
	}
	
	@RequestMapping(value="review_insertform")
	public String review_insertform() {
		return "userViews/reviewBoardInsert";
	}
	
	@RequestMapping(value="review_insert", method = {RequestMethod.GET, RequestMethod.POST})
	public String review_insert(Model model,ReviewDto review_dto,HttpServletRequest request) {
		String condition = request.getParameter("condition");
		System.out.println("후기 작성시 selected 값 : "+condition);
		int res = review_biz.review_insert(review_dto);
		if(res>0) {
			model.addAttribute("list",review_biz.review_list());
			return "userViews/reviewBoardList";
		} else {
			return "userViews/reviewBoardInsert";
		}
	}
	
	@RequestMapping("review_updateform")
	public String review_updateform(Model model,int review_no) {
		model.addAttribute("dto",review_biz.review_detail(review_no));
		System.out.println(review_no);
		return "userViews/reviewBoardUpdate";
	}
	
	@RequestMapping(value="review_update", method=RequestMethod.POST)
	public String review_update(Model model,ReviewDto review_dto,int review_no) {
		int res = review_biz.review_update(review_dto);
		if(res>0) {
			model.addAttribute("dto",review_biz.review_detail(review_no));
			return "userViews/reviewBoardDetail";
		} else {
			return "userViews/reviewBoardUpdate";
		}
	}
	
	@RequestMapping("review_delete")
	public String review_delete(Model model,int review_no) {
		review_biz.review_delete(review_no);
		model.addAttribute("list",review_biz.review_list());
		return "userViews/reviewBoardList";
	}
	
	

}
