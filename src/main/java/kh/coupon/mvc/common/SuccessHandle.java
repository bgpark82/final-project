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

import kh.coupon.mvc.biz.ClientBiz;
import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.dto.MemberDto;


@Configuration
public class SuccessHandle implements AuthenticationSuccessHandler{

	@Autowired private MemberBiz memberBiz_impl;
	@Autowired private ClientBiz clientBiz_impl;
	
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
		MemberDto member_dto = memberBiz_impl.getSession(dto);
		session.setAttribute("user", member_dto);
		if(member_dto.getMember_role().equals("ROLE_CLIENT")) {
			int member_no = member_dto.getMember_no();
			if(clientBiz_impl.client_select(member_no) != null) {
				session.setAttribute("client", clientBiz_impl.client_select(member_no));
			}
		}

		res.sendRedirect("../home/main");
	}

	
	

}
