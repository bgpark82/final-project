package kh.coupon.mvc.dao_impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.MenuDao;
import kh.coupon.mvc.dto.MenuDto;

@Repository
public class MenuDao_Impl implements MenuDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MenuDto> selectList(int client_no) {
		return sqlSession.selectList(namespace + "menu_list", client_no);
	}

	@Override
	public MenuDto selectOne(int menu_no) {
		return sqlSession.selectOne(namespace + "menu_selectone", menu_no);
	}

	@Override
	public int update(MenuDto dto) {
		return sqlSession.update(namespace + "menu_update", dto);
	}

	@Override
	public int delete(int menu_no) {
		return sqlSession.delete(namespace + "menu_delete", menu_no);
	}

	@Override
	public int insert(MenuDto dto) {
		return sqlSession.insert(namespace + "menu_insert", dto);
	}
	
	

}
