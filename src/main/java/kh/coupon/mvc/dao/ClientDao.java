package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.ClientDto;

import java.util.List;

import kh.coupon.mvc.dto.BoardDto;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.MenuDto;

public interface ClientDao {
	
	String namespace="client.";
	
	public List<ClientDto> client_list();
	public ClientDto client_detail(int client_no);
	
	
	public int client_insert(ClientDto dto);
	public ClientDto client_select(int member_no);
	
	
	// 건의사항
   public List<BoardDto> complain_list();
   public List<BoardDto> complain_list_seven(); // 7그램
   public List<BoardDto> complain_list_bear(); // 맥주창고
   public List<BoardDto> complain_list_magic(); // 요술포차
   public BoardDto complain_detail(int complain_no);
   public int complain_insert(BoardDto complain_dto);
   public int complain_update(BoardDto complain_dto);
   public int complain_delete(int complain_no);
   public int updateHit(int complain_no);
	
	// 메뉴
	public List<MenuDto> selectList(int client_no);
	public MenuDto selectOne(int menu_no);
	public int update(MenuDto dto);
	public int delete(int menu_no);
	public int insert(MenuDto dto);
	
}
