package kh.coupon.mvc.biz;

import kh.coupon.mvc.dto.MemberReservationDto;

public interface MemberReservationBiz {

	public int insert(MemberReservationDto dto);
	public MemberReservationDto selectOne(int member_no);
	
}
