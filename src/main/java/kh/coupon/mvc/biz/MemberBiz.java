package kh.coupon.mvc.biz;

import kh.coupon.mvc.dto.MemberDto;

public interface MemberBiz {

	public int insert(MemberDto dto);
	public String idChk(String member_id);
}
