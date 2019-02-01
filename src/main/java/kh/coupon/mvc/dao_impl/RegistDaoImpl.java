package kh.coupon.mvc.dao_impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.RegistDao;
import kh.coupon.mvc.dto.RegistDto;

@Repository
public class RegistDaoImpl implements RegistDao {

   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;

   @Override
   public List<RegistDto> regist_list() {
      List<RegistDto> res = null;
      try {
         res = sqlSessionTemplate.selectList(namespace+"regist_list");
      } catch(Exception e) {
         System.out.println("daoImpl regist_list �뿉�윭");
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public RegistDto regist_detail(String id) {
      return null;
   }

   @Override
   public int regist_insert(RegistDto dto) {
      int res = sqlSessionTemplate.insert(namespace+"regist_insert",dto);
      if(res>0) {
         System.out.println("daoImpl regist_insert �꽦怨�");
      } else {
         System.out.println("daoImpl regist_insert �떎�뙣");
      }
      return res;
   }

   @Override
   public RegistDto login(String member_id, String member_password) {
      RegistDto res = null;
      RegistDto regist_dto = new RegistDto();
      regist_dto.setMember_id(member_id);
      regist_dto.setMember_password(member_password);
      try {
         res = sqlSessionTemplate.selectOne(namespace+"login",regist_dto);
      
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }

@Override
public RegistDto loginInfo(int member_no) {
	RegistDto res = sqlSessionTemplate.selectOne(namespace+"loginInfo",member_no);
	return res;
}

}

