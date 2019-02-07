package kh.coupon.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import kh.coupon.mvc.biz.ClientBiz;
import kh.coupon.mvc.dto.BoardDto;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.MenuDto;

@Controller
@RequestMapping("client")
public class ClientController {
	
	/* 제휴업체 기능 */
	//로그인 시 제휴업체 확인 체크(제휴업체라면, 메인페이지로 간다. 제휴업체 등록이 안되어있다면, 가입페이지로 보내준다.)
	
	//제휴업체 가입폼 
	
	//제휴업체 가입 
	
	//제휴업체 메인페이지(제휴업체 메뉴표시 해주기) 
	
	//제휴업체 정보 보기
	
	//제휴업체 정보 수정폼
	
	//제휴업체 정보 수정
	
	/* 메뉴 기능 */ 
	//메뉴 list보기
	
	//메뉴 detail(해당 메뉴의 고유번호를 가져온다)

	//메뉴 등록폼
	
	//메뉴 등록
	
	//메뉴 수정폼
	
	//메뉴 수정
	
	//메뉴 삭제
	
	/* 제휴업체 게시판 기능 */
	//제휴업체 게시판 list 보기(파라미터로 카테고리(공지사항,건의사항,리뷰))
	
	//제휴업체 게시판 detail(파라미터로 게시판 고유번호를 받아온다.) & 해당 글에 해당하는 댓글도 가져온다.
	
	//제휴업체 게시판 글쓰기폼(건의사항)
	
	//제휴업체 게시판 글쓰기(건의사항)
	
	//제휴업체 게시판 글수정폼(건의사항)
	
	//제휴업체 게시판 글쓰기(건의사항)
	
	//제휴업체 게시판 [댓글] 쓰기
	
	//제휴업체 게시판 [댓글] 수정
	
	//제휴업체 게시판 [댓글] 삭제
	
	/* 제휴업체 예약현황(만들어야하는 기능)*/
	//예약현황(예약 가능한 업체만 볼 수 있는 기능 
	
	/* 제휴업체 판매 현황(만들어야하는 기능) */
	//년,월 별 판매량
	
	
	@Autowired
	private ClientBiz client_biz;
	
	
	// 제휴업체 메인페이지
	@RequestMapping("clientMain")
	public String clientMain() {
		return "clientViews/clientMain";
	}
	
	// 맥주창고 메인페이지
	@RequestMapping("client_beerMain")
	public String clisnt_beerMain() {
		return "clientViews/client_beerMain";
	}
	
	// 요술포차 메인페이지
	@RequestMapping("client_magicMain")
	public String client_magicMain() {
		return "clientViews/client_magicMain";
	}
	
	// 7그램 메인페이지
	@RequestMapping("client_sevenMain")
	public String client_sevenMain() {
		return "clientViews/client_sevenMain";
	}

	
//================================== 제휴업체 문의 ==================================================
	
	// 제휴업체 문의 페이지
	@RequestMapping("insertform")
	public String insertForm() {
		return "clientViews/clientApply";
	}
	
	// 제휴업체 문의 완료
	@RequestMapping(value="client_insert", method=RequestMethod.POST)
	public String client_insert(Model model, ClientDto dto) {
		System.out.println(dto);
		int res = client_biz.client_insert(dto);
		if(res > 0) {
//			model.addAttribute("client_dto", client_biz.client_select(dto.getMember_no()));
			return "clientViews/clientMain";
		}
	return "clientViews/clientApply";	
	}
	
	
//==================================마이페이지관련==================================================	
	
	// 마이페이지
	@RequestMapping("myPage")
	public String mypage(Model model, int member_no) {
		return "clientViews/myPage";
	}
	
	// 판매내역 페이지
	@RequestMapping("my_salesPage")
	public String my_salesPage() {
		return "clientViews/my_salesPage";
	}
	
	// 메뉴 페이지
	@RequestMapping("my_menuPage")
	public String my_menuPage(Model model, int member_no) {
		model.addAttribute("menu_list", client_biz.selectList(member_no));
		return "clientViews/my_menuPage";
	}
	
	@RequestMapping("my_mapPage")
	public String my_mapPage() {
		return "clientViews/my_mapPage";
	}
	
	
//================================== 메뉴 관련 ==================================================
	
	
	// 메뉴 리스트
	@RequestMapping("menu_list")
	public String List(Model model, int client_no) {
		model.addAttribute("menu_list", client_biz.selectList(client_no));
		return "clientViews/my_menuPage";
	}

	// 메뉴 상세
	@RequestMapping("menu_detail")
	public String selectOne(Model model, int menu_no) {
		model.addAttribute("menu_dto", client_biz.selectOne(menu_no));
		return "clientViews/my_menuDetail";
	}
	
	// 메뉴 수정 양식
	@RequestMapping("menu_updateForm")
	public String updateForm(Model model, int menu_no) {
		model.addAttribute("menu_dto", client_biz.selectOne(menu_no));
		return "clientViews/my_menuUpdate";
	
	}

	// 메뉴 수정 완료
	@RequestMapping("menu_update")
	public String update(Model model, MenuDto dto, int menu_no) {
		System.out.println(dto.getMenu_no());
		System.out.println(menu_no);
		int res = client_biz.update(dto);
		if(res > 0) {
			model.addAttribute("menu_dto", client_biz.selectOne(menu_no));
			return "clientViews/my_menuDetail";
		}
		return "clientViews/my_menuUpdate";
	}
	
	// 메뉴 삭제
	@RequestMapping("menu_delete")
	public String delete(Model model, int menu_no, int client_no) {
		int res = client_biz.delete(menu_no);
		if(res > 0) {
		model.addAttribute("menu_list", client_biz.selectList(client_no));
		return "clientViews/my_menuPage";
		}
		return "redirect:clientViews/my_menuDetail";
	}
	
	// 메뉴 추가 양식
	@RequestMapping("menu_insertForm")
	public String menuInsertForm() {
		return "clientViews/my_menuInsert";
	}
	
	// 메뉴 추가 완료
	@RequestMapping("menu_insert")
	public String insert(Model model, MenuDto dto) {
		int res = client_biz.insert(dto);
		if(res > 0) {
			model.addAttribute("menu_list", client_biz.selectList(dto.getClient_no()));
			return "clientViews/my_menuPage";
		}
		return "clientViews/my_menuInsert";
	}
	
	
	
	

//==================================건의사항게시판==================================================
	
	// 건의사항 게시판 리스트
	@RequestMapping(value = "complain_board_list")
	public String complain_board_list(Model model) {
		model.addAttribute("list", client_biz.complain_list());
		return "clientViews/complainBoardList";
	}

	// 건의사항 게시판에서 제휴업체 구분 검색
	@RequestMapping("complain_search")
	public String complain_search(Model model, HttpServletRequest request) {
		String condition = request.getParameter("condition");
		System.out.println("제휴업체구분 : " + condition);
		if (condition.equals("7Gram")) {
			model.addAttribute("list", client_biz.complain_list_seven());
		} else if (condition.equals("맥주창고")) {
			model.addAttribute("list", client_biz.complain_list_bear());
		} else if (condition.equals("요술포차")) {
			model.addAttribute("list", client_biz.complain_list_magic());
		} else if (condition.equals("전체")) {
			model.addAttribute("list", client_biz.complain_list());
		}
		return "clientViews/complainBoardList";
	}

	// 건의사항 세부보기
	@RequestMapping("complain_detail")
	public String complain_detail(Model model, int board_no) {
		client_biz.updateHit(board_no);
		model.addAttribute("dto", client_biz.complain_detail(board_no));
		return "clientViews/complainBoardDetail";
	}

	// 건의사항 글 등록
	@RequestMapping(value = "complain_insertform")
	public String complain_insertform() {
		return "clientViews/complainBoardInsert";
	}

	// 건의사항 글 등록 완료
	@RequestMapping(value = "complain_insert", method = { RequestMethod.GET, RequestMethod.POST })
	public String complain_insert(Model model, BoardDto complain_dto, HttpServletRequest request) {
		String condition = request.getParameter("condition");
		int res = client_biz.complain_insert(complain_dto);
		if (res > 0) {
			model.addAttribute("list", client_biz.complain_list());
			return "clientViews/complainBoardList";
		} else {
			return "clientViews/complainBoardInsert";
		}
	}

	// 건의사항 수정
	@RequestMapping("complain_updateform")
	public String complain_updateform(Model model, int board_no) {
		model.addAttribute("dto", client_biz.complain_detail(board_no));
		return "clientViews/complainBoardUpdate";
	}

	// 건의사항 수정 완료
	@RequestMapping(value = "complain_update", method = RequestMethod.POST)
	public String complain_update(Model model, BoardDto board_dto, int board_no) {
		int res = client_biz.complain_update(board_dto);
		if (res > 0) {
			model.addAttribute("dto", client_biz.complain_detail(board_no));
			return "clientViews/complainBoardDetail";
		} else {
			return "clientViews/complainBoardUpdate";
		}
	}

	// 건의사항 삭제 
	@RequestMapping("complain_delete")
	public String complain_delete(Model model, int board_no) {
		int res = client_biz.complain_delete(board_no);
		System.out.println(res);
		if(res > 0) {
			model.addAttribute("list", client_biz.complain_list());
			return "clientViews/complainBoardList";
		} 
		return "redirect:clientViews/complainBoardDetail";
		
	}
	
//================================ 이미지 ==================================================
	
	
	@RequestMapping(value="upload", method=RequestMethod.POST)
	@ResponseBody
	public String register(@RequestParam(name="file") MultipartFile file, HttpServletRequest request) {
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 크기 : " + file.getSize());
		String filename = file.getOriginalFilename();
		String fileName = "";
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		
		try {
			inputStream = file.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/profile");
			
			System.out.println("업로드 될 실제 경로 : " + path);
			
			File storage = new File(path);
			if(!storage.exists()) storage.mkdirs();
			File newFile = new File(path+"/" + filename);
			System.out.println("새로운 파일 : " + newFile);
			
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] b = new byte[(int)file.getSize()];
			
			while((read=inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}
			
			if(!newFile.exists()) newFile.createNewFile();
			if(newFile != null) {
				String ext = newFile.getName().substring(newFile.getName().lastIndexOf(".") + 1);
				if(ext.equals("jpg") || ext.equals("png") || ext.equals("gif") || ext.equals("jpeg")) {
					fileName = newFile.getName();
				}				
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println("==========>> file : " +filename);
		return "http://localhost:8787/mvc/resources/profile/"+fileName;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}