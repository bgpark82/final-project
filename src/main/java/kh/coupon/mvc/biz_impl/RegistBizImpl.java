package kh.coupon.mvc.biz_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.RegistBiz;
import kh.coupon.mvc.dao.RegistDao;
import kh.coupon.mvc.dto.RegistDto;

@Service
public class RegistBizImpl implements RegistBiz {

   @Autowired
   private RegistDao regist_dao;

   @Override
   public List<RegistDto> regist_list() {
      return regist_dao.regist_list();
   }

   @Override
   public RegistDto regist_detail(String member_id) {
      return regist_dao.regist_detail(member_id);
   }

   @Override
   public int regist_insert(RegistDto regist_dto) {
      return regist_dao.regist_insert(regist_dto);
   }

   @Override
   public RegistDto login(String member_id, String member_password) {
      return regist_dao.login(member_id, member_password);
   }

	@Override
	public RegistDto loginInfo(int member_no) {
		return regist_dao.loginInfo(member_no);
	}

}

