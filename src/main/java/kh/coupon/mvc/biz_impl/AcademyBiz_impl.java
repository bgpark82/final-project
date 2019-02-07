package kh.coupon.mvc.biz_impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.AcademyBiz;
import kh.coupon.mvc.dao.AcademyDao;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.CouponDto;
import kh.coupon.mvc.dto.Coupon_historyDto;
import kh.coupon.mvc.dto.MenuDto;

@Service
public class AcademyBiz_impl implements AcademyBiz{
	
	@Autowired
	private AcademyDao academy_dao;
	
	
	@Override
	public List<CouponDto> coupon_stock() {
		return academy_dao.coupon_stock();
	}

	@Override
	public List<Coupon_historyDto> purchase_history() {
		return academy_dao.purchase_history();
	}

	@Override
	public List<Coupon_historyDto> sales_history() {
		return academy_dao.sales_history();
	}

	@Override
	public List<MenuDto> menu_list(int client_no) {
		return academy_dao.menu_list(client_no);
	}


	@Override
	public List<ClientDto> client_list() {
		return academy_dao.client_list();
	}

	@Override
	public List<ClientDto> client_registration_list() {
		return academy_dao.client_registration_list();
	}

	@Override
	public boolean client_update_registration(int client_no) {
		if(academy_dao.client_update_registration(client_no) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean coupon_purchase_order(int client_no, int member_no, int menu_no, String member_name, String client_name, int coupon_history_quantity, int coupon_history_cost) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CouponDto> coupon_info = new ArrayList<CouponDto>();
		//client_no 와 menu_no 에 맞는 menu Dto를 받아와서 new Coupon 해서 다 넣어주자.
		MenuDto menu = academy_dao.menu_detail(client_no, menu_no);
		
		//coupon정보를 가져와서 수량만큼 list를 생성해준다.
		for(int i = 0; i < coupon_history_quantity; i++) {
			coupon_info.add(new CouponDto(member_no, client_no, menu_no, client_name, menu.getMenu_title(), menu.getMenu_price(), "test", menu.getMenu_detail()));
		}
		
		
		//수량만큼 생성된 list를 map에 담에 보내준다.
		map.put("coupon_info", coupon_info);
		//coupon_history_seq.nextval,100,2,1,'회계팀_장세훈','7gram','아메리카노',2000,100,SYSDATE,200000,'구매');
		if(academy_dao.coupon_purchase_order(map) > 0) {
			//Coupon_historyDto coupon_historyDto = new Coupon_historyDto(member_no, client_no, menu_no, member_name, client_name, menu.getMenu_title(), menu.getMenu_price(), coupon_history_quantity, coupon_history_cost, "구매");
			return true;
		}
		return false;
	}
	
	
	
	

	@Override
	public List<CouponDto> coupon_purchase_order_list() {
		return academy_dao.coupon_purchase_order_list();
	}
	
	/*
	@Override
	public List<CouponDto> client_coupon_purchase_order_list(){
		return academy_dao.client_coupon_purchase_order_list();
	}
	 */
	
	@Override
	public List<Integer> purchase_statistics(int year, int client_no) {
		return academy_dao.purchase_statistics(year, client_no);
	}

	@Override
	public List<Integer> sale_statistics(int year, int client_no) {
		return academy_dao.sale_statistics(year, client_no);
	}

}
