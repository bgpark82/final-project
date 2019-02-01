package kh.coupon.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.coupon.mvc.biz.RegistBiz;
import kh.coupon.mvc.biz.ReviewBiz;
import kh.coupon.mvc.biz.ClientBiz;
import kh.coupon.mvc.biz.ComplainBiz;
import kh.coupon.mvc.biz.MenuBiz;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.ComplainDto;
import kh.coupon.mvc.dto.MenuDto;
import kh.coupon.mvc.dto.RegistDto;
import kh.coupon.mvc.dto.ReviewDto;

@Controller
@RequestMapping("client")
public class ClientController {

	@Autowired
	private RegistBiz regist_biz;
	@Autowired
	private ComplainBiz complain_biz;
	@Autowired
	private ReviewBiz review_biz;
	@Autowired
	private ClientBiz client_biz;
	@Autowired
	private MenuBiz menu_biz;
	
	
	
	@RequestMapping("clientMain")
	public String clientMain() {
		return "clientViews/clientMain";
	}
	
	@RequestMapping("client_beerMain")
	public String clisnt_beerMain() {
		return "clientViews/client_beerMain";
	}
	
	@RequestMapping("client_magicMain")
	public String client_magicMain() {
		return "clientViews/client_magicMain";
	}
	
	@RequestMapping("client_sevenMain")
	public String client_sevenMain() {
		return "clientViews/client_sevenMain";
	}

	
//==================================회원가입로그인==================================================
	
	@RequestMapping(value = "registform")
	public String registform() {
		return "clientViews/clientRegist";
	}

	@RequestMapping(value = "regist_insert", method = RequestMethod.POST)
	public String regist_insert(Model model, RegistDto regist_dto) {
		int res = regist_biz.regist_insert(regist_dto);
		if (res > 0) {
			model.addAttribute("list", regist_biz.regist_list());
			return "clientViews/clientRegist_list";
		} else {
			return "clientViews/clientRegist";
		}
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Model model, String member_id, String member_password, HttpSession session) {
		System.out.println("member_id"+member_id+"member_pw"+member_password);
		RegistDto regist_dto = regist_biz.login(member_id, member_password);
		if (regist_dto != null) {
			session.setAttribute("regist_dto", regist_dto);
			session.setAttribute("client_dto", client_biz.selectOne(regist_dto.getMember_no()));
			return "clientViews/clientMain";
		} else {
			return "index";
		}
	}
	
	//member가 제휴 업체 문의
	@RequestMapping("insertform")
	public String insertForm() {
		return "clientViews/clientApply";
	}
	
	@RequestMapping(value="client_insert", method=RequestMethod.POST)
	public String client_insert(Model model, ClientDto dto) {

		int res = client_biz.client_insert(dto);
		if(res > 0) {
			model.addAttribute("client_dto", client_biz.selectOne(dto.getMember_no()));
			return "clientViews/clientMain";
		}
		return "clientViews/clientApply";	
		}
	
	
//==================================마이페이지관련==================================================	
	
	@RequestMapping("myPage")
	public String mypage(Model model, int member_no) {
		model.addAttribute("regist_dto",regist_biz.loginInfo(member_no));
		return "clientViews/myPage";
	}
	
	@RequestMapping("my_salesPage")
	public String my_salesPage() {
		return "clientViews/my_salesPage";
	}
	
	@RequestMapping("my_menuPage")
	public String my_menuPage(Model model, int client_no) {
		System.out.println(client_no);
		model.addAttribute("menu_list", menu_biz.selectList(client_no));
		return "clientViews/my_menuPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//메뉴 리스트
	@RequestMapping("menu_list")
	public String List(Model model, int client_no) {
		model.addAttribute("menu_list", menu_biz.selectList(client_no));
		
		return "clientViews/my_menuPage";
	}

	
	@RequestMapping("menu_detail")
	public String selectOne(Model model, int menu_no) {
		model.addAttribute("menu_dto", menu_biz.selectOne(menu_no));
		
		return "clientViews/my_menuDetail";
	}
	
	@RequestMapping("menu_updateForm")
	public String updateForm(Model model, int menu_no) {
		model.addAttribute("menu_dto", menu_biz.selectOne(menu_no));
		return "clientViews/my_menuUpdate";
	
	}
	
	
	@RequestMapping("menu_update")
	public String update(Model model, MenuDto dto, int menu_no) {
		System.out.println(dto.getMenu_no());
		System.out.println(menu_no);
		int res = menu_biz.update(dto);
		
		if(res > 0) {
			model.addAttribute("menu_dto", menu_biz.selectOne(menu_no));
			return "clientViews/my_menuDetail";
		}
		return "clientViews/my_menuUpdate";
	}
		
	@RequestMapping("menu_delete")
	public String delete(Model model, int menu_no, int client_no) {
		menu_biz.delete(menu_no);
		model.addAttribute("menu_list", menu_biz.selectList(client_no));
		
		return "clientViews/my_menuPage";
	}
	
	@RequestMapping("menu_insertForm")
	public String menuInsertForm() {
		return "clientViews/my_menuInsert";
	}
	
	@RequestMapping("menu_insert")
	public String insert(Model model, MenuDto dto, int client_no) {
		int res = menu_biz.insert(dto);
		
		if(res > 0) {
			model.addAttribute("menu_list", menu_biz.selectList(client_no));
			return "clientViews/my_menuPage";
		}
		return "clientViews/my_menuInsert";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("my_mapPage")
	public String my_mapPage() {
		return "clientViews/my_mapPage";
	}

//==================================건의사항게시판==================================================
	
	@RequestMapping(value = "complain_board_list")
	public String complain_board_list(Model model) {
		model.addAttribute("list", complain_biz.complain_list());
		return "clientViews/complainBoardList";
	}

	// 건의사항 게시판에서 제휴업체 구분 검색
	@RequestMapping("complain_search")
	public String complain_search(Model model, HttpServletRequest request) {
		String condition = request.getParameter("condition");
		System.out.println("제휴업체구분 : " + condition);
		if (condition.equals("7Gram")) {
			model.addAttribute("list", complain_biz.complain_list_seven());
		} else if (condition.equals("맥주창고")) {
			model.addAttribute("list", complain_biz.complain_list_bear());
		} else if (condition.equals("요술포차")) {
			model.addAttribute("list", complain_biz.complain_list_magic());
		} else if (condition.equals("전체")) {
			model.addAttribute("list", complain_biz.complain_list());
		}
		return "clientViews/complainBoardList";
	}

	@RequestMapping("complain_detail")
	public String complain_detail(Model model, int complain_no) {
		complain_biz.updateHit(complain_no);
		model.addAttribute("dto", complain_biz.complain_detail(complain_no));
		return "clientViews/complainBoardDetail";
	}

	@RequestMapping(value = "complain_insertform")
	public String complain_insertform() {
		return "clientViews/complainBoardInsert";
	}

	@RequestMapping(value = "complain_insert", method = { RequestMethod.GET, RequestMethod.POST })
	public String complain_insert(Model model, ComplainDto complain_dto, HttpServletRequest request) {
		String condition = request.getParameter("condition");
		System.out.println("건의사항 작성시 selected 값 : " + condition);
		int res = complain_biz.complain_insert(complain_dto);
		if (res > 0) {
			model.addAttribute("list", complain_biz.complain_list());
			return "clientViews/complainBoardList";
		} else {
			return "clientViews/complainBoardInsert";
		}
	}

	@RequestMapping("complain_updateform")
	public String complain_updateform(Model model, int complain_no) {
		model.addAttribute("dto", complain_biz.complain_detail(complain_no));
		System.out.println(complain_no);
		return "clientViews/complainBoardUpdate";
	}

	@RequestMapping(value = "complain_update", method = RequestMethod.POST)
	public String complain_update(Model model, ComplainDto complain_dto, int complain_no) {
		int res = complain_biz.complain_update(complain_dto);
		if (res > 0) {
			model.addAttribute("dto", complain_biz.complain_detail(complain_no));
			return "clientViews/complainBoardDetail";
		} else {
			return "clientViews/complainBoardUpdate";
		}
	}

	@RequestMapping("complain_delete")
	public String complain_delete(Model model, int complain_no) {
		complain_biz.complain_delete(complain_no);
		model.addAttribute("list", complain_biz.complain_list());
		return "clientViews/complainBoardList";
	}
	
	
	
	
//==================================이용후기게시판============================================	
	
	@RequestMapping("review_board_list")
	public String review_board_list(Model model) {
		model.addAttribute("list",review_biz.review_list());
		return "userViews/reviewBoardList";
	} 
	
	// 후기게시판에서 제휴업체 구분 검색
	@RequestMapping("review_search")
	public String review_search(Model model,HttpServletRequest request) {
		String condition = request.getParameter("condition");
		System.out.println("제휴업체구분 : " +condition);
		if(condition.equals("7Gram")) {
			model.addAttribute("list", review_biz.review_list_seven());			
		} else if(condition.equals("맥주창고")) {
			model.addAttribute("list", review_biz.review_list_bear());
		} else if(condition.equals("요술포차")) {
			model.addAttribute("list", review_biz.review_list_magic());
		} else if(condition.equals("전체")){
			model.addAttribute("list", review_biz.review_list());
		}
		return "userViews/reviewBoardList";
	}
	
	@RequestMapping("review_detail")
	public String review_detail(Model model,int review_no) {
		review_biz.updateHit(review_no);
		model.addAttribute("dto",review_biz.review_detail(review_no));
		return "userViews/reviewBoardDetail";
	}
	
	@RequestMapping(value="review_insertform")
	public String review_insertform() {
		return "userViews/reviewBoardInsert";
	}
	
	@RequestMapping(value="review_insert", method = {RequestMethod.GET, RequestMethod.POST})
	public String review_insert(Model model,ReviewDto review_dto,HttpServletRequest request) {
		String condition = request.getParameter("condition");
		System.out.println("후기 작성시 selected 값 : "+condition);
		int res = review_biz.review_insert(review_dto);
		if(res>0) {
			model.addAttribute("list",review_biz.review_list());
			return "userViews/reviewBoardList";
		} else {
			return "userViews/reviewBoardInsert";
		}
	}
	
	@RequestMapping("review_updateform")
	public String review_updateform(Model model,int review_no) {
		model.addAttribute("dto",review_biz.review_detail(review_no));
		System.out.println(review_no);
		return "userViews/reviewBoardUpdate";
	}
	
	@RequestMapping(value="review_update", method=RequestMethod.POST)
	public String review_update(Model model,ReviewDto review_dto,int review_no) {
		int res = review_biz.review_update(review_dto);
		if(res>0) {
			model.addAttribute("dto",review_biz.review_detail(review_no));
			return "userViews/reviewBoardDetail";
		} else {
			return "userViews/reviewBoardUpdate";
		}
	}
	
	@RequestMapping("review_delete")
	public String review_delete(Model model,int review_no) {
		review_biz.review_delete(review_no);
		model.addAttribute("list",review_biz.review_list());
		return "userViews/reviewBoardList";
	}

}
