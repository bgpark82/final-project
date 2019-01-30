package kh.coupon.mvc.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.dao.CouponDao;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.CouponDto;

@Service
public class CouponBiz_impl implements CouponBiz {
	
	@Autowired
	private CouponDao coupon_dao;

	@Override
	public List<CouponDto> coupon_list() {
		return coupon_dao.coupon_list();
	}

	@Override
	public CouponDto coupon_detail(int coupon_no) {
		return coupon_dao.coupon_detail(coupon_no);
	}

	@Override
	public int coupon_buy(int member_no, int client_no, int coupon_no, int coupon_count) {
		return coupon_dao.coupon_buy(member_no, client_no, coupon_no, coupon_count);
	}

	@Override
	public List<CouponDto> my_coupon_list(int member_no) {
		return coupon_dao.my_coupon_list(member_no);
	}

	@Override
	public CouponDto my_coupon_detail(int member_no, int coupon_no) {
		return coupon_dao.my_coupon_detail(member_no, coupon_no);
	}

	
	@Override
	public boolean my_coupon_use(int member_no,int client_no,int menu_no,int paycode,int coupon_count) {
		ClientDto client_dto = coupon_dao.check_paycode(client_no, paycode);
		System.out.println("결제코드 확인하기 : "+paycode+" 수량 :"+coupon_count);
		System.out.println(client_dto.getClient_paycode());
		if(client_dto.getClient_paycode() == paycode) {
			if(coupon_dao.my_coupon_use(member_no, client_no, menu_no, coupon_count)>0) {
				return true;
			}
		}
		return false;
	}
	

	

}
