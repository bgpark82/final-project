package kh.coupon.mvc.biz;

import java.util.List;

import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.CouponDto;
import kh.coupon.mvc.dto.Coupon_historyDto;
import kh.coupon.mvc.dto.MenuDto;
	
public interface AcademyBiz {
	
	//재고내역
	public List<CouponDto> coupon_stock();
	//구매내역
	public List<Coupon_historyDto> purchase_history();
	//판매내역
	public List<Coupon_historyDto> sales_history();
	//구매요청
	
	
	
	//제휴업체 별 메뉴보기
	public List<MenuDto> menu_list(int client_no);
	
	//제휴업체 리스트 가져오기
	public List<ClientDto> client_list();
		
	//제휴 신청 리스트 
	public List<ClientDto> client_registration_list();
		
	public boolean client_update_registration(int client_no);
		
	//쿠폰 구매 요청
	public boolean coupon_purchase_order(int member_no, int client_no, int menu_no, String member_name, String client_name, int coupon_history_quantity, int coupon_history_cost);
		
	//쿠폰 구매 요청 현황 보기
	public List<CouponDto> coupon_purchase_order_list();
	
	
	
	//구매 통계
	public List<Integer> purchase_statistics(int year, int client_no);

	//판매 통계
	public List<Integer> sale_statistics(int year, int client_no);
	
	

}
