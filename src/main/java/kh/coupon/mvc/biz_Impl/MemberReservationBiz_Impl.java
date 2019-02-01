package kh.coupon.mvc.biz_Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.MemberReservationBiz;
import kh.coupon.mvc.dao.MemberReservationDao;
import kh.coupon.mvc.dto.MemberReservationDto;

@Service
public class MemberReservationBiz_Impl implements MemberReservationBiz{

	@Autowired
	private MemberReservationDao member_reservation_dao;
	
	@Override
	public int insert(MemberReservationDto dto) {
		// TODO Auto-generated method stub
		return member_reservation_dao.insert(dto);
	}

	@Override
	public MemberReservationDto selectOne(int member_no) {
		// TODO Auto-generated method stub
		return member_reservation_dao.selectOne(member_no);
	}

}
