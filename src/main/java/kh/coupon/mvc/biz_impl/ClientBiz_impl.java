package kh.coupon.mvc.biz_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.ClientBiz;
import kh.coupon.mvc.dao.ClientDao;
import kh.coupon.mvc.dto.BoardDto;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.MenuDto;

@Service
public class ClientBiz_impl implements ClientBiz {
	
	@Autowired
	private ClientDao client_dao;

	@Override
	public List<ClientDto> client_list() {
		return client_dao.client_list();
	}

	@Override
	public ClientDto client_detail(int client_no) {
		return client_dao.client_detail(client_no);
	}

	@Override
	public int client_insert(ClientDto dto) {
		return client_dao.client_insert(dto);
	}

	@Override
	public ClientDto client_select(int member_no) {
		return client_dao.client_select(member_no);
	}
	
	
	// 건의사항 ==========================================
   @Override
   public List<BoardDto> complain_list() {
      return client_dao.complain_list();
   }

   @Override
   public BoardDto complain_detail(int complain_no) {
      return client_dao.complain_detail(complain_no);
   }

   @Override
   public int complain_insert(BoardDto complain_dto) {
      return client_dao.complain_insert(complain_dto);
   }

   @Override
   public int complain_update(BoardDto complain_dto) {
      return client_dao.complain_update(complain_dto);
   }

   @Override
   public int complain_delete(int complain_no) {
      return client_dao.complain_delete(complain_no);
   }

   @Override
   public int updateHit(int complain_no) {
      return client_dao.updateHit(complain_no);
   }

		@Override
		public List<BoardDto> complain_list_seven() {
			return client_dao.complain_list_seven();
		}
		
		@Override
		public List<BoardDto> complain_list_bear() {
			return client_dao.complain_list_bear();
		}
		
		@Override
		public List<BoardDto> complain_list_magic() {
			return client_dao.complain_list_magic();
		}

	// 메뉴 ==============================================
	
	@Override
	public List<MenuDto> selectList(int client_no) {
		return client_dao.selectList(client_no);
	}

	@Override
	public MenuDto selectOne(int menu_no) {
		return client_dao.selectOne(menu_no);
	}

	@Override
	public int update(MenuDto dto) {
		return client_dao.update(dto);
	}

	@Override
	public int delete(int menu_no) {
		return client_dao.delete(menu_no);
	}

	@Override
	public int insert(MenuDto dto) {
		return client_dao.insert(dto); 
	}
}
