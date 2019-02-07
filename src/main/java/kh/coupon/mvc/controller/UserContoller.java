package kh.coupon.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.coupon.mvc.biz.ClientBiz;
import kh.coupon.mvc.biz.CouponBiz;
import kh.coupon.mvc.biz.ExpenseStatementBiz;
import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.biz.ReviewBiz;
import kh.coupon.mvc.dto.ReviewDto;

@Controller
@RequestMapping("user")
public class UserContoller {
	
	@Autowired
	private CouponBiz coupon_biz;
	@Autowired
	private ReviewBiz review_biz;
	@Autowired
	private ExpenseStatementBiz expenseBiz;
	@Autowired
	private ClientBiz client_biz;
	
	@RequestMapping("coupone")
	public String coupone() {
		return "userViews/coupone";
	}
	
	@RequestMapping("client_list")
	public String client_list(Model model) {
		//client_list 를 가져온다.
		model.addAttribute("client_list",client_biz.client_list());
		//모델에 담는다
		return "userViews/clientList";
	}
	
	//제휴업체 쿠폰 리스트
	@RequestMapping("coupon_list")
	public String coupon_list(Model model, int client_no) {
		model.addAttribute("client_dto",client_biz.client_detail(client_no));
		model.addAttribute("list",coupon_biz.coupon_list(client_no));
		return "userViews/coupon_list";
	}
	
	//쿠폰 상세보기
	@RequestMapping("coupon_detail")
	public String coupon_detail(Model model,int menu_no,int client_no) {
		model.addAttribute("coupon",coupon_biz.coupon_detail(menu_no));
		model.addAttribute("list",coupon_biz.coupon_list(client_no));
		return "userViews/couponDetail";
	}
	
	//학생이 학원이 올려놓은 쿠폰 구매할때
	@RequestMapping("coupon_buy")
	public String coupon_buy(Model model,int member_no, int client_no, int menu_no,int coupon_count, RedirectAttributes redirectAttributes) {
		int res = coupon_biz.coupon_buy(member_no,client_no,menu_no,coupon_count);
		if(res>0) {
			redirectAttributes.addAttribute("member_no",member_no);
			return "redirect:my_coupon_list";
		}
		return "userViews/myCoupon";
	}
	
	//내쿠폰함에 보이는 리스트
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
	
	// 쿠폰 선물하기
	@RequestMapping("coupon_gift")
	public String coupon_gift(Model model,String member_phone,int member_from_no,int member_no,int menu_no,int coupon_count,int client_no,HttpServletResponse response) throws IOException {
		System.out.println("-----------"+member_phone+" "+member_from_no+" "+member_no+" "+menu_no+" "+coupon_count);
		if(coupon_biz.coupon_gift(member_phone,member_from_no,member_no,menu_no,coupon_count)) {
			return "redirect:coupon_detail?menu_no="+menu_no+"&client_no="+client_no;
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
//------------------------마이페이지-----------------
	
/*  작성자 : 이민이
	작성 날짜 : 2019.02.02
	기능 : 회원 탈퇴, 지출내역, 내정보수정을 할 수 있는 학생 마이페이지
	사용하는 DB 테이블 : 
*/
	
	@RequestMapping("mypage")
	public String mypage(Model model) {
		model.addAttribute("my");
		return "userViews/myPage";
	}
	
	
//---------------------------------이용후기&공지사항 게시판--------------------------------------------------------------------
	//이용후기 게시판 리스트	
	@RequestMapping("review_board_list")
	public String review_board_list(Model model,String board_category) {
		System.out.println(board_category);
		model.addAttribute("list",review_biz.review_list(board_category));
		return "userViews/reviewBoardList";
	} 
	
	// 이용후기 상세보기
	@RequestMapping("review_detail")
	public String review_detail(Model model,int board_no) {
		review_biz.updateHit(board_no);
		model.addAttribute("dto",review_biz.review_detail(board_no));
		return "userViews/reviewBoardDetail";
	}
	
	// 이용후기에서 글작성폼
	@RequestMapping(value="review_insertform")
	public String review_insertform(Model model, String board_category) {
		model.addAttribute("board_category",board_category);
		return "userViews/reviewBoardInsert";
	}
	
	// 이용후기 글작성 폼에서 글작성하면 여기로연결
	@RequestMapping(value="review_insert", method=RequestMethod.POST)
	public String review_insert(Model model,ReviewDto review_dto,HttpServletRequest request) {
		int res = review_biz.review_insert(review_dto);
		if(res>0) {
			model.addAttribute("list",review_biz.review_list(review_dto.getBoard_category()));
			return "userViews/reviewBoardList";
		} else {
			return "userViews/reviewBoardInsert";
		}
	}
	
	// 이용후기 글수정폼
	@RequestMapping("review_updateform")
	public String review_updateform(Model model,int board_no) {
		model.addAttribute("dto",review_biz.review_detail(board_no));
		System.out.println(board_no);
		return "userViews/reviewBoardUpdate";
	}
	
	// 이용후기 글수정폼에서 수정완료누르면 여기로 넘어옴
	@RequestMapping(value="review_update", method=RequestMethod.POST)
	public String review_update(Model model,ReviewDto review_dto,int board_no) {
		int res = review_biz.review_update(review_dto);
		if(res>0) {
			model.addAttribute("dto",review_biz.review_detail(board_no));
			return "userViews/reviewBoardDetail";
		} else {
			return "userViews/reviewBoardUpdate";
		}
	}
	
	// 이용후기 삭제
	@RequestMapping("review_delete")
	public String review_delete(Model model,int board_no,String board_category) {
		review_biz.review_delete(board_no);
		model.addAttribute("list",review_biz.review_list(board_category));
		return "userViews/reviewBoardList";
	}
	
//---------------------지출내역----------------------------
	
	//월별 지출내역 페이지로 넘어가기  
		@RequestMapping(value="expense")
		public String expenseStatement(Model model, int member_no, String year, String month ) {
			
			model.addAttribute("dto", expenseBiz.monthlyExpenseStatement(member_no, year, month));
			
			return "userViews/expenseStatement";
		}
		
		//년과 월을 설정해해서 조회
		@RequestMapping(value="search_expense")
		public String searchExpense(Model model, int year, int month, int member_no) {
			
			String year1 = String.valueOf(year);
			String month1 = String.valueOf(month);
					
			model.addAttribute("dto",expenseBiz.monthlyExpenseStatement(member_no, year1, month1));
			
			
			return "userViews/expenseStatement";
		}  
	
}
