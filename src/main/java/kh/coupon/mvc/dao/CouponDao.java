package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.CouponDto;

public interface CouponDao {

	String namespace = "coupon.";
	
	public List<CouponDto> coupon_list();
	public CouponDto coupon_detail(int menu_no);
	public int coupon_buy(int member_no, int client_no, int menu_no, int coupon_count);
	public List<CouponDto> my_coupon_list(int member_no);
	public CouponDto my_coupon_detail(int member_no, int menu_no);
	public ClientDto check_paycode(int client_no,int paycode);
	public int my_coupon_use(int member_no,int client_no,int menu_no,int coupon_count);
}
