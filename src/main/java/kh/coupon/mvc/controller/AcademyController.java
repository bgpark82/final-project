package kh.coupon.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.coupon.mvc.biz.AcademyBiz;
import kh.coupon.mvc.biz.BoardBiz;
import kh.coupon.mvc.dto.MenuDto;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("academy")
public class AcademyController {

	@Autowired
	private AcademyBiz academy_biz;
	
	@Autowired
	private BoardBiz board_biz;
	
	@RequestMapping("test")
	public String test() {
		return "academyViews/academyControllerTest";
	}
	

	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.21
	기능 : 쿠폰 재고
	사용하는 DB 테이블 : coupon
	부가 설명 :  coupon 테이블에서 member_no 이 학원쪽인 데이터들을 받아온다.
		SELECT client_no, client_name, menu_no, menu_title, menu_price, count(*) AS coupon_count
		FROM coupon 
		WHERE member_no = 100 AND coupon_state = 'Y'
		GROUP BY client_no, client_name, menu_no, menu_title, menu_price
		ORDER BY client_no;
	*/
	@RequestMapping("coupon_stock")
	public String coupon_stock(Model model) {
		model.addAttribute("coupon_stockList",academy_biz.coupon_stock());
		return "academyViews/accountingMainPage";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.21
	기능 : 구매 내역
	사용하는 DB 테이블 : coupon
	부가 설명 :	coupon_history 테이블에서 coupon_history_info = '구매' 인 데이터를 받아온다.
		SELECT coupon_history_no, member_no, member_name, client_no, client_name, 
				menu_no, menu_title, coupon_history_quantity, coupon_history_cost, coupon_history_date 
		FROM coupon_history 
		WHERE coupon_history_info = '구매' AND EXTRACT(year FROM coupon_history_date) = 2019 AND EXTRACT(month FROM coupon_history_date) = 1;
	*/
	@RequestMapping("purchase_history")
	public String purchase_history(Model model) {
		model.addAttribute("coupon_history",academy_biz.purchase_history());
		return "academyViews/couponHistory";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.21
	기능 : 판매 내역
	사용하는 DB 테이블 : coupon_history
	부가 설명 :  	coupon_history 테이블에서 coupon_history_info = '판매' 인 데이터를 받아온다.
		SELECT coupon_history_no, member_no, member_name, client_no, client_name, 
				menu_no,menu_title, coupon_history_quantity, coupon_history_cost, coupon_history_date 
		FROM coupon_history 
		WHERE coupon_history_info = '판매' AND EXTRACT(year FROM coupon_history_date) = 2019 AND EXTRACT(month FROM coupon_history_date) = 1;
	*/
	@RequestMapping("sales_history")
	public String sales_history(Model model) {
		model.addAttribute("coupon_history",academy_biz.sales_history());
		return "academyViews/couponHistory";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.23
	기능 : 메뉴 view로 보내준다.
	사용하는 DB 테이블 : -- 
	부가 설명 :	제휴업체를 선택 하여 해당 제휴업체의 메뉴를 보는 페이지로 보내준다.
	*/
	@RequestMapping("menuPage")
	public String menuPage(Model model) {
		model.addAttribute("client_list", academy_biz.client_list());
		return "academyViews/menuPage";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.23
	기능 : 제휴업체 별 메뉴 리스트를 가져온다.
	사용하는 DB 테이블 : menu
	부가 설명 :	제휴업체를 선택 하여 해당 제휴업체의 메뉴를 보여주기 위해 client_no를 받아와 menu 테이블에서 select 후 결과를 돌려준다.
	*/
	@RequestMapping("menu_list")
	@ResponseBody
	public Map<String, Object> menuList(int client_no) {
		System.out.println(client_no);
		
		List<MenuDto> menu_list = academy_biz.menu_list(client_no);
		System.out.println("menu사이즈"+menu_list.size());
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("menu_list", menu_list);
		return map;
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.23
	기능 : 구매 view로 보내준다.
	사용하는 DB 테이블 : menu 
	부가 설명 :	
	*/
	@RequestMapping("coupon_purchase_form")
	public String coupon_purchase_form(Model model, int client_no) {
		//menu 테이블에 munu 정보 가져오기 
		model.addAttribute("menu_list",academy_biz.menu_list(client_no));
		return "academyViews/coupon_purchase_form";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.26
	기능 : 구매요청
	사용하는 DB 테이블 : coupon
	부가 설명 :	coupon 테이블에 신청한 수량만큼 쿠폰을 생성시키고(해당 쿠폰값을 수량만큼 반복문으로 map에 넣고, mapper에 전달 후 처리), coupon_state 값은 N이다.
				(구매 완료(판매 완료) 처리 전 상태)
	*/
	@RequestMapping("coupon_purchase_order")
	public String coupon_purchase_order(Model model,int client_no, int member_no, int menu_no, String member_name, String client_name, int coupon_history_quantity, int coupon_history_cost) {
		if(academy_biz.coupon_purchase_order(client_no, member_no, menu_no, member_name, client_name, coupon_history_quantity, coupon_history_cost)) {
			return "redirect:coupon_purchase_order_list";
		}
		return "academyViews/menuPage";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.26
	기능 : 구매 요청 내역
	사용하는 DB 테이블 : coupon
	부가 설명 :	제휴업체에 해당 메뉴를 구매 요청한 목록을 보여주는 View로 보내준다.
	*/
	@RequestMapping("coupon_purchase_order_list")
	public String coupon_purchase_order_list(Model model) {
		model.addAttribute("coupon_purchase_order_list",academy_biz.coupon_purchase_order_list());
		return "academyViews/coupon_purchase_order_list";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.27
	기능 : 제휴업체 목록
	사용하는 DB 테이블 : client
	부가 설명 :	제휴업체 목록을 보여준다. 제휴업체는 신청하면 client 테이블에 등록이 되지만 state값은 N으로, client_list 요청에서는 client_registration가 
	 			'Y' 인 것만 가져와 보여준다.
	*/
	@RequestMapping("client_list")
	public String client_list(Model model) {
		model.addAttribute("client_list", academy_biz.client_list());
		return "academyViews/client_list";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.27
	기능 : 제휴업체 신청 목록
	사용하는 DB 테이블 : client
	부가 설명 :	제휴업체 신청 목록을 보여준다. client_registration가 'N'인 데이터를 가져온다
	*/
	@RequestMapping("client_registration_list")
	public String client_registration_list(Model model) {
		model.addAttribute("client_registration_list",academy_biz.client_registration_list());
		return "academyViews/client_registration_list";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.27
	기능 : 제휴업체 승인
	사용하는 DB 테이블 : client
	부가 설명 :	제휴업체 신청 목록에서 승인 버튼을 누르면 해당 제휴업체의 client_no를 전달받아 client_registration를 'Y'로 업데이트해준다.
	*/
	@RequestMapping("client_update_registration")
	public String client_update_registration(Model model, int client_no) {
		if(academy_biz.client_update_registration(client_no)) {
			return "redirect:client_list";
		}
		return "redirect:client_registration_list";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.01.27
	기능 : 제휴업체 승인
	사용하는 DB 테이블 : client
	부가 설명 :	제휴업체 신청 목록에서 승인 버튼을 누르면 해당 제휴업체의 client_no를 전달받아 client_registration를 'Y'로 업데이트해준다.
	*/
	@RequestMapping("coupon_sale_page")
	public String coupon_sale_page(Model model) {
		model.addAttribute("coupon_stockList",academy_biz.coupon_stock());
		return "academyViews/coupon_sale_page";
	}
	
	/*
	작성자 : 장세훈
	작성 날짜 : 19.02.06
	기능 : 공지사항 list
	사용하는 DB 테이블 : board
	부가 설명 :	board 테이블에서 board_category 값이 notice 인 게시글들을 보여준다.
	*/
	@RequestMapping("notice_list")
	public String notice_list(Model model) {
		model.addAttribute("notice_list",board_biz.notice_list());
		return "academyViews/notice_list";
	}
	
	@RequestMapping("board_detail")
	public String board_detail(Model model, int board_no) {
		System.out.println(board_no);
		model.addAttribute("notice_dto",board_biz.board_detail(board_no));
		return "academyViews/notice_detail";
	}
	
	@RequestMapping("board_insertForm")
	public String board_insertForm(Model model, String board_category) {
		model.addAttribute("board_category",board_category);
		return "academyViews/board_insertForm";
	}
	
	@RequestMapping("board_insert")
	public String board_insert(Model model, int member_no, String board_category, String board_writer, String board_title, String board_content) {
		int res = board_biz.board_insert(member_no,board_category, board_writer, board_title, board_content);
		if(res > 0) {
			return "redirect:board_detail?board_no="+res;
		}
		return "academyViews/notice_list";
	}
	
	
	
	
	/*
	 * 작성자 : 이효홍
	 * 작성 날짜 : 19.01.24
	 * 기능 : 통계(구매, 판매)
	 * 사용하는 DB 테이블 :
	 * 부가설명 :
	 * 
	 */
	 @RequestMapping("purchase_statistics_page")
	 public String purchase_statistics_page(Model model) {
		 model.addAttribute("client_list",academy_biz.client_list());
		 
		 return "academyViews/purchase_statistics_page";
	 }
	
	 @RequestMapping("purchase_statistics")
	 public String purchase_statistics(Model model, int year, int client_no) {
		 //구매 통계
		 List<Integer> list = academy_biz.purchase_statistics(year, client_no);
		 model.addAttribute("list", list);
		 model.addAttribute("client_list",academy_biz.client_list());
		 return "academyViews/purchase_statistics_page";
	 }
	 
	 @RequestMapping("sale_statistics_page")
	 public String sale_statistics_page(Model model) {
		 model.addAttribute("client_list",academy_biz.client_list());
		 return "academyViews/sale_statistics_page";
	 }
	 
	 @RequestMapping("sale_statistics")
	 public String sale_statistics(Model model, int year, int client_no) {
		 //판매통계
		 List<Integer> list = academy_biz.sale_statistics(year, client_no);
		 Map<String, Integer> map = new HashMap<String, Integer>();
		 
		 JSONObject jObj = new JSONObject();

		 
		 for(int i = 1; i< list.size();i++) {
			 /*map.put(i+"", list.get(i-1));
			 System.out.println(map);*/
			 jObj.put(i+"", list.get(i-1));
		 }
		 
		 
		 model.addAttribute("json", jObj);
		 model.addAttribute("client_list",academy_biz.client_list());
		 
		 return "academyViews/sale_statistics_page";
	 }
	

	
	
	
	
}
