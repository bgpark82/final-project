package kh.coupon.mvc.biz;

import kh.coupon.mvc.dto.MemberDto;

public interface MemberBiz {

	public int insert(MemberDto dto);
	public String idChk(MemberDto dto);
	public MemberDto getSession(MemberDto dto);
}
