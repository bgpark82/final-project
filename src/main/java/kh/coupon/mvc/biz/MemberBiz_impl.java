package kh.coupon.mvc.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.dao.MemberDao;
import kh.coupon.mvc.dto.MemberDto;

@Service
public class MemberBiz_impl implements MemberBiz {

	@Autowired
	private MemberDao member_dao;
	
	@Override
	public int insert(MemberDto dto) {
		// TODO Auto-generated method stub
		return member_dao.insert(dto);
	}

	@Override
	public String idChk(String member_id) {
		// TODO Auto-generated method stub
		return member_dao.idChk(member_id);
	}

}
