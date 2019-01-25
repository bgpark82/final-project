package kh.coupon.mvc.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.dto.MemberDto;


@Configuration
public class SuccessHandle implements AuthenticationSuccessHandler{

	@Autowired
	private MemberBiz memberBiz_impl;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberDto dto = new MemberDto();
		// 현재 로그인하는 유저의 id
		dto.setMember_id(authUser.getUsername());
		// 현재 로그인하는 유저의 role
		dto.setMember_role(authUser.getAuthorities().iterator().next().getAuthority());
		session.setAttribute("user", memberBiz_impl.getSession(dto));

		res.sendRedirect("../home/main");
	}

	
	

}
