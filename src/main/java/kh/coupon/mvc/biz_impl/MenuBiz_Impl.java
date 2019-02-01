package kh.coupon.mvc.biz_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.MenuBiz;
import kh.coupon.mvc.dao.MenuDao;
import kh.coupon.mvc.dto.MenuDto;

@Service
public class MenuBiz_Impl implements MenuBiz {

	@Autowired
	private MenuDao menu_dao;
	
	@Override
	public List<MenuDto> selectList(int client_no) {
		return menu_dao.selectList(client_no);
	}

	@Override
	public MenuDto selectOne(int menu_no) {
		return menu_dao.selectOne(menu_no);
	}

	@Override
	public int update(MenuDto dto) {
		return menu_dao.update(dto);
	}

	@Override
	public int delete(int menu_no) {
		return menu_dao.delete(menu_no);
	}

	@Override
	public int insert(MenuDto dto) {
		return menu_dao.insert(dto); 
	}
	
}
