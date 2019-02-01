package kh.coupon.mvc.dao;

import kh.coupon.mvc.dto.MemberReservationDto;

public interface MemberReservationDao {

	String NAMESPACE = "user.";
	
	public int insert(MemberReservationDto dto);
	public MemberReservationDto selectOne(int member_no);
	
}
