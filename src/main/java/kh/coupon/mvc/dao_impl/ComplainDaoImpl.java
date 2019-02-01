package kh.coupon.mvc.dao_impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.ComplainDao;
/*import kh.coupon.mvc.dto.RegistDto;*/
import kh.coupon.mvc.dto.ComplainDto;
import kh.coupon.mvc.dto.ReviewDto;

@Repository
public class ComplainDaoImpl implements ComplainDao {
	   
	   @Autowired
	   private SqlSessionTemplate sqlSessionTemplate;

	   @Override
	   public List<ComplainDto> complain_list() {
	      List<ComplainDto> res = null;
	      try {
	         res = sqlSessionTemplate.selectList(namespace+"complain_list");
	      } catch(Exception e) {
	         System.out.println("daoImpl complain_list 에러");
	         e.printStackTrace();
	      }
	      return res;
	   }

	   @Override
	   public ComplainDto complain_detail(int complain_no) {
		   ComplainDto complain_dto = null;
	      try {
	    	  complain_dto = sqlSessionTemplate.selectOne(namespace+"complain_detail",complain_no);
	      } catch(Exception e) {
	         System.out.println("daoImpl complain_detail 실패");
	         e.printStackTrace();
	      }
	      return complain_dto;
	   }

	   @Override
	   public int complain_insert(ComplainDto complain_dto) {
	      int res = sqlSessionTemplate.insert(namespace+"complain_insert",complain_dto);
	      if(res>0) {
	         System.out.println("daoImpl complain_insert 성공");
	      } else {
	         System.out.println("daoImpl complain_insert 실패");
	      }
	      return res;
	   }

	   @Override
	   public int complain_update(ComplainDto complain_dto) {
	      int res = sqlSessionTemplate.update(namespace+"complain_update",complain_dto);
	      if(res>0) {
	         System.out.println("daoImpl complain_update 성공");
	      } else {
	         System.out.println("daoImpl complain_update 실패");
	      }
	      return res;
	   }

	   @Override
	   public int complain_delete(int complain_no) {
	      int res = sqlSessionTemplate.delete(namespace+"complain_delete",complain_no);
	      if(res>0) {
	         System.out.println("daoImpl complain_delete 성공");
	      } else {
	         System.out.println("daoImpl complain_delete 실패");
	      }
	      return res;
	   }

	   @Override
	   public int updateHit(int complain_no) {
	      int res = sqlSessionTemplate.update(namespace+"updateHit",complain_no);
	      if(res>0) {
	         System.out.println("조회수 증가 성공");
	      } else {
	         System.out.println("조회수 증가 실패");
	      }
	      return res;
	   }

		
		@Override
		public List<ComplainDto> complain_list_seven() {
			List<ComplainDto> res = null;
			try {
				res = sqlSessionTemplate.selectList(namespace+"complain_list_seven");
			} catch(Exception e) {
				System.out.println("daoImpl complain_list_seven 에러");
				e.printStackTrace();
			}
			return res;
		}

		@Override
		public List<ComplainDto> complain_list_bear() {
			List<ComplainDto> res = null;
			try {
				res = sqlSessionTemplate.selectList(namespace+"complain_list_bear");
			} catch(Exception e) {
				System.out.println("daoImpl complain_list_bear 에러");
				e.printStackTrace();
			}
			return res;
		}

		@Override
		public List<ComplainDto> complain_list_magic() {
			List<ComplainDto> res = null;
			try {
				res = sqlSessionTemplate.selectList(namespace+"complain_list_magic");
			} catch(Exception e) {
				System.out.println("daoImpl complain_list_magic 에러");
				e.printStackTrace();
			}
			return res;
		}

}