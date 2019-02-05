package kh.coupon.mvc.biz;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kh.coupon.mvc.dto.CouponDto;

@Service
public interface CouponBiz {
	
	public List<CouponDto> coupon_list();
	public List<CouponDto> beer_list();
	public CouponDto coupon_detail(int menu_no);
	public int coupon_buy(int member_no, int client_no, int menu_no, int coupon_count);
	public List<CouponDto> my_coupon_list(int member_no);
	public CouponDto my_coupon_detail(int member_no, int menu_no);
	public boolean my_coupon_use(int member_no,int client_no,int menu_no,int paycode,int coupon_count);
	public boolean coupon_gift(String member_phone,int member_from_no,int member_no,int client_no,int menu_no,int coupon_count);
}
