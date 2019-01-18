package kh.coupon.mvc.dao;

import kh.coupon.mvc.dto.MemberDto;

public interface MemberDao {
	
	String namespace = "member.";
	
	public int insert(MemberDto dto);
	public String idChk(String member_id);

}
