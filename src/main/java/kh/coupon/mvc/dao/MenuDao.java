package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.MenuDto;

public interface MenuDao {

	String namespace = "menu.";
	
	public List<MenuDto> selectList(int client_no);
	public MenuDto selectOne(int menu_no);
	public int update(MenuDto dto);
	public int delete(int menu_no);
	public int insert(MenuDto dto);
	
}
