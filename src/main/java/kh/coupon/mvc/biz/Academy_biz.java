package kh.coupon.mvc.biz;

import java.util.List;

import kh.coupon.mvc.dto.Client;
import kh.coupon.mvc.dto.Coupon;
import kh.coupon.mvc.dto.Coupon_history;
import kh.coupon.mvc.dto.Menu;
	
public interface Academy_biz {
	
	//재고내역
	public List<Coupon> coupon_stock();
	//구매내역
	public List<Coupon_history> purchase_history();
	//판매내역
	public List<Coupon_history> sales_history();
	//구매요청
	
	//제휴업체 별 메뉴보기
	public List<Menu> menu_list(int client_no);
	
	//제휴업체 리스트 가져오기
	public List<Client> client_list();
		
	//제휴 신청 리스트 
	public List<Client> client_registration_list();
		
	public boolean client_update_registration(int client_no);
		
	//쿠폰 구매 요청
	public boolean coupon_purchase_order(int member_no, int client_no, int menu_no, String member_name, String client_name, int coupon_history_quantity, int coupon_history_cost);
		
	//쿠폰 구매 요청 현황 보기
	public List<Coupon> coupon_purchase_order_list();
	
	
	
	//구매 통계
	public List<Integer> purchase_statistics(int year, int client_no);

	//판매 통계
	public List<Integer> sale_statistics(int year, int client_no);
	

}
