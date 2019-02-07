package kh.coupon.mvc.biz_impl;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.dao.MemberDao;
import kh.coupon.mvc.dto.MemberDto;

@Service
public class MemberBiz_impl implements MemberBiz {

	@Autowired private MemberDao member_dao;
	@Autowired private BCryptPasswordEncoder passwordEncoder;
	@Autowired private Logger logger;
	
	
	@Override
	@Transactional
	public int insert(MemberDto dto) {
		dto.setMember_password(passwordEncoder.encode(dto.getMember_password()));
		logger.info("Encrypted password : " + passwordEncoder.encode(dto.getMember_password()));
		return member_dao.insert(dto);
	}

	@Override
	@Transactional
	public String idChk(MemberDto dto) {
		return member_dao.idChk(dto);
	}

	@Override
	@Transactional
	public MemberDto getSession(MemberDto dto) {
		return member_dao.getSession(dto);
	}

}
