package kh.coupon.mvc.dao_impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.ClientDao;
import kh.coupon.mvc.dto.BoardDto;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.MenuDto;

@Repository
public class ClientDao_impl implements ClientDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int client_insert(ClientDto dto) {
		return sqlSession.insert(namespace + "client_insert", dto);
	}
	
	@Override
	public ClientDto client_select(int member_no) {
		return sqlSession.selectOne(namespace+"client_select", member_no);
	}
	


	///////////////////////////////////////// 건의사항 /////////////////////////////////////////////// 
	 @Override
	   public List<BoardDto> complain_list() {
	      List<BoardDto> res = null;
	      try {
	         res = sqlSession.selectList(namespace+"complain_list");
	      } catch(Exception e) {
	         System.out.println("daoImpl complain_list 에러");
	         e.printStackTrace();
	      }
	      return res;
	   }

	   @Override
	   public BoardDto complain_detail(int complain_no) {
		   BoardDto complain_dto = null;
	      try {
	    	  complain_dto = sqlSession.selectOne(namespace+"complain_detail",complain_no);
	      } catch(Exception e) {
	         System.out.println("daoImpl complain_detail 실패");
	         e.printStackTrace();
	      }
	      return complain_dto;
	   }

	   @Override
	   public int complain_insert(BoardDto complain_dto) {
	      int res = sqlSession.insert(namespace+"complain_insert",complain_dto);
	      if(res>0) {
	         System.out.println("daoImpl complain_insert 성공");
	      } else {
	         System.out.println("daoImpl complain_insert 실패");
	      }
	      return res;
	   }

	   @Override
	   public int complain_update(BoardDto complain_dto) {
	      int res = sqlSession.update(namespace+"complain_update",complain_dto);
	      if(res>0) {
	         System.out.println("daoImpl complain_update 성공");
	      } else {
	         System.out.println("daoImpl complain_update 실패");
	      }
	      return res;
	   }

	   @Override
	   public int complain_delete(int complain_no) {
	      int res = sqlSession.delete(namespace+"complain_delete",complain_no);
	      if(res>0) {
	         System.out.println("daoImpl complain_delete 성공");
	      } else {
	         System.out.println("daoImpl complain_delete 실패");
	      }
	      return res;
	   }

	   @Override
	   public int updateHit(int complain_no) {
	      int res = sqlSession.update(namespace+"updateHit",complain_no);
	      if(res>0) {
	         System.out.println("조회수 증가 성공");
	      } else {
	         System.out.println("조회수 증가 실패");
	      }
	      return res;
	   }

		
		@Override
		public List<BoardDto> complain_list_seven() {
			List<BoardDto> res = null;
			try {
				res = sqlSession.selectList(namespace+"complain_list_seven");
			} catch(Exception e) {
				System.out.println("daoImpl complain_list_seven 에러");
				e.printStackTrace();
			}
			return res;
		}

		@Override
		public List<BoardDto> complain_list_bear() {
			List<BoardDto> res = null;
			try {
				res = sqlSession.selectList(namespace+"complain_list_bear");
			} catch(Exception e) {
				System.out.println("daoImpl complain_list_bear 에러");
				e.printStackTrace();
			}
			return res;
		}

		@Override
		public List<BoardDto> complain_list_magic() {
			List<BoardDto> res = null;
			try {
				res = sqlSession.selectList(namespace+"complain_list_magic");
			} catch(Exception e) {
				System.out.println("daoImpl complain_list_magic 에러");
				e.printStackTrace();
			}
			return res;
		}
	
	
	/////////////////////////////// 메뉴 /////////////////////////////////
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
