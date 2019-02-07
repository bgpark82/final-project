package kh.coupon.mvc.biz_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.CouponBiz;
import kh.coupon.mvc.dao.AcademyDao;
import kh.coupon.mvc.dao.CouponDao;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.CouponDto;
import kh.coupon.mvc.dto.Coupon_historyDto;
import kh.coupon.mvc.dto.MenuDto;

@Service
public class CouponBiz_impl implements CouponBiz {
	
	@Autowired
	private CouponDao coupon_dao;
	
	@Autowired
	private AcademyDao academy_dao;

	@Override
	public List<CouponDto> coupon_list(int client_no) {
		return coupon_dao.coupon_list(client_no);
	}

	@Override
	public CouponDto coupon_detail(int coupon_no) {
		return coupon_dao.coupon_detail(coupon_no);
	}

	@Override
	public int coupon_buy(int member_no, int client_no, int menu_no, String member_name, int coupon_count) {
		if(coupon_dao.coupon_buy(member_no, client_no, menu_no, coupon_count) > 0) {
			//MenuDto menuDto = academy_dao.menu_detail(client_no, menu_no);
			//Coupon_historyDto coupon_historyDto = new Coupon_historyDto(member_no, client_no, menu_no, member_name,menuDto.getClient_name(), menuDto.getMenu_title(), menuDto.getMenu_price(), coupon_count, (menuDto.getMenu_price() * coupon_count));
			//coupon_dao.
			return 1;
		}
		return 0;
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
		//System.out.println(client_dto.getClient_paycode());
		
		boolean isPayCodeCheck = client_dto.getClient_paycode() == paycode;
		
		System.out.println(">>>>>>>>>>>>>>>>>>"+isPayCodeCheck);
				
		if(isPayCodeCheck) {
			if(coupon_dao.my_coupon_use(member_no, client_no, menu_no, coupon_count)>0) {
				System.out.println(">>>>>>>>>>>>>>>>>>"+isPayCodeCheck+"!!!!!!!!!!");
				return isPayCodeCheck;
			}
		}
		return isPayCodeCheck;
	}

	@Override
	public boolean coupon_gift(String member_phone, int member_from_no, int member_no, int menu_no, int coupon_count) {
		int member_to_no = coupon_dao.check_phone(member_phone);
		if(member_to_no != 0) {
			if(coupon_dao.coupon_gift(member_to_no, member_from_no, member_no, menu_no, coupon_count)>0) {
				return true;
			}
		}
		return false;
	}

	

	

}
