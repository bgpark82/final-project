package kh.coupon.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.coupon.mvc.biz.ClientBiz;
import kh.coupon.mvc.biz.MemberBiz;
import kh.coupon.mvc.biz.MemberReservationBiz;
import kh.coupon.mvc.biz.MenuBiz;
import kh.coupon.mvc.dto.MemberReservationDto;

@Controller
@RequestMapping("user")
public class UserContoller {
	

	
	@Autowired
	private MenuBiz menu_biz;
	
	@Autowired
	private ClientBiz client_biz;

	@Autowired
	private MemberReservationBiz member_reservation_biz;
	
	@RequestMapping("client_list")
	public String client_list(Model model) {
		model.addAttribute("client_list", client_biz.selectList());
		return "userViews/client_list";
	}
	
	
	@RequestMapping("client_detail")
	public String client_selectOne(Model model, int client_no) {
		model.addAttribute("client_dto", client_biz.selectOne(client_no));
		
		return "userViews/client_detail";
	}
	
	
	
	@RequestMapping("menu_list")
	public String menu_list(Model model, int client_no) {
		model.addAttribute("menu_list", menu_biz.selectList(client_no));
		model.addAttribute("client_no", client_no);
		return "userViews/menu_list";
	}
	
	
	
	@RequestMapping("reservationForm")
	public String reservationForm(Model model, int client_no) {
		model.addAttribute("client_dto", client_biz.selectOne(client_no));
		//model.addAttribute("client_no",client_no);
		return "userViews/reservationForm";
	}
	
	@RequestMapping("reservation")
	public String reservation(Model model, MemberReservationDto dto, int member_no, int client_no, HttpSession session) {
		
		int res = member_reservation_biz.insert(dto);
		
		if(res>0) {
			model.addAttribute("reservation_dto", member_reservation_biz.selectOne(member_no));
			session.setAttribute("reservation_dto", member_reservation_biz.selectOne(member_no));
		
			return "userViews/reservation_status";
		}
		return "userViews/reservationForm";
		
	}
	
	
	@RequestMapping("reservation_status")
	public String reservation_status(Model model, int member_no) {
		model.addAttribute("reservation_dto", member_reservation_biz.selectOne(member_no));
		return null;
		
	}
	
	
	
	
	

	

}
