package kh.coupon.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.coupon.mvc.biz.CouponBiz;
import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.dto.MemberDto;

@Controller
@RequestMapping("user")
public class UserContoller {
	
	@Autowired
	private CouponBiz coupon_biz;
	
	@RequestMapping("coupone")
	public String coupone() {
		return "userViews/coupone";
	}
	
	@RequestMapping("coupon_list")
	public String coupon_list(Model model) {
		model.addAttribute("list",coupon_biz.coupon_list());
		return "userViews/coupon_list";
	}
	
	@RequestMapping("coupon_detail")
	public String coupon_detail(Model model,int menu_no) {
		model.addAttribute("coupon",coupon_biz.coupon_detail(menu_no));
		model.addAttribute("list",coupon_biz.coupon_list());
		return "userViews/couponDetail";
	}
	
	@RequestMapping("coupon_buy")
	public String coupon_buy(Model model,int member_no, int client_no, int menu_no,int coupon_count, RedirectAttributes redirectAttributes) {
		int res = coupon_biz.coupon_buy(member_no,client_no,menu_no,coupon_count);
		if(res>0) {
			redirectAttributes.addAttribute("member_no",member_no);
			return "redirect:my_coupon_list";
		}
		return "userViews/myCoupon";
	}
	
	@RequestMapping("my_coupon_list")
	public String my_coupon_list(Model model,int member_no) {
		model.addAttribute("my_coupon", coupon_biz.my_coupon_list(member_no));
		return "userViews/myCoupon";
	}
	
	//쿠폰함(myCoupon)에서 쿠폰이름 눌렀을때  
	@RequestMapping("my_coupon_detail")
	public String my_coupon_detail(Model model,int member_no,int menu_no) {
		model.addAttribute("my_coupon", coupon_biz.my_coupon_detail(member_no,menu_no));
		return "userViews/myCouponDetail";
	}
	
	//내 쿠폰함의 쿠폰 사용처리
	@RequestMapping("code_correct")
	public String code_correct(Model model,int member_no,int client_no,int menu_no,int paycode,int coupon_count,HttpServletResponse response) throws IOException {
		System.out.println("------------------------------"+member_no+" "+client_no+" "+menu_no+" "+paycode+" "+coupon_count);
		if(coupon_biz.my_coupon_use(member_no, client_no, menu_no, paycode, coupon_count)) {
			//model.addAttribute("my_coupon", coupon_biz.my_coupon_list(member_no));
			return "redirect:my_coupon_list?member_no="+member_no;
		}

//		response.setContentType("text/html; charset=UTF-8");	 
//		PrintWriter out = response.getWriter();
//		out.println("<script>alert('쿠폰 사용 오류입니다.');</script>");
//		out.flush();
		System.out.println("여기까지오니?");
		//model.addAttribute("my_coupon", coupon_biz.my_coupon_detail(member_no,menu_no));
		return "redirect:my_coupon_list?member_no="+member_no;
	}
	
	@RequestMapping("coupon_gift")
	public String coupon_gift(Model model,String member_phone,int member_from_no,int member_no,int client_no,int menu_no,int coupon_count,HttpServletResponse response) throws IOException {
		System.out.println("-----------"+member_phone+" "+member_from_no+" "+member_no+" "+client_no+" "+menu_no+" "+coupon_count);
		if(coupon_biz.coupon_gift(member_phone,member_from_no,member_no,client_no, menu_no,coupon_count)) {
			return "redirect:coupon_detail?menu_no="+menu_no;
		}
		response.setContentType("text/html; charset=UTF-8");	 
		PrintWriter out = response.getWriter();
		out.println("<script>alert('쿠폰 선물 오류입니다.');</script>");
		out.flush();
		//model.addAttribute("coupon", coupon_biz.coupon_detail(menu_no));
		//model.addAttribute("list",coupon_biz.coupon_list());
		return "redirect:coupon_detail?menu_no="+menu_no;
	}
	
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
