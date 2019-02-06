package kh.coupon.mvc.dao;

import java.util.List;
import java.util.Map;

import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.CouponDto;
import kh.coupon.mvc.dto.Coupon_historyDto;
import kh.coupon.mvc.dto.MenuDto;

public interface AcademyDao {
	String NAMESPACE = "academy.";
	//재고내역
	public List<CouponDto> coupon_stock();
	//구매내역 
	public List<Coupon_historyDto> purchase_history();
	//판매내역
	public List<Coupon_historyDto> sales_history();
	
	public MenuDto menu_detail(int client_no, int menu_no);
	
	public List<MenuDto> menu_list(int client_no);

	public List<ClientDto> client_list();
	
	public List<ClientDto> client_registration_list();
	
	public int client_update_registration(int client_no);
	
	public int coupon_purchase_order(Map<String, Object> map);
	
	public List<CouponDto> coupon_purchase_order_list();
	
	
	//구매 통계
	public List<Integer> purchase_statistics(int year, int client_no);
	//판매 통계
	public List<Integer> sale_statistics(int year, int client_no);
	
}
