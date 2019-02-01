package kh.coupon.mvc.biz;

import java.util.List;

import kh.coupon.mvc.dto.MenuDto;

public interface MenuBiz {

	public List<MenuDto> selectList(int client_no);
	public MenuDto selectOne(int menu_no);
	public int update(MenuDto dto);
	public int delete(int menu_no);
	public int insert(MenuDto dto);
	
}
