package kh.coupon.mvc.dao;

import java.util.List;
import java.util.Map;

import kh.coupon.mvc.dto.Client;
import kh.coupon.mvc.dto.Coupon;
import kh.coupon.mvc.dto.Coupon_history;
import kh.coupon.mvc.dto.Menu;

public interface Academy_dao {
	String NAMESPACE = "academy.";
	//재고내역
	public List<Coupon> coupon_stock();
	//구매내역 
	public List<Coupon_history> purchase_history();
	//판매내역
	public List<Coupon_history> sales_history();
	
	public Menu menu_detail(int client_no, int menu_no);
	
	public List<Menu> menu_list(int client_no);

	public List<Client> client_list();
	
	public List<Client> client_registration_list();
	
	public int client_update_registration(int client_no);
	
	public int coupon_purchase_order(Map<String, Object> map);
	
	public List<Coupon> coupon_purchase_order_list();
	
	
	//구매 통계
	public List<Integer> purchase_statistics(int year, int client_no);
	//판매 통계
	public List<Integer> sale_statistics(int year, int client_no);
	
}
