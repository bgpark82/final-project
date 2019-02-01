package kh.coupon.mvc.dao_Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.MemberReservationDao;
import kh.coupon.mvc.dto.MemberReservationDto;

@Repository
public class MemberReservationDao_Impl implements MemberReservationDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(MemberReservationDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + "reservation", dto);
	}

	@Override
	public MemberReservationDto selectOne(int member_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"reservation_status", member_no);
	}

}
