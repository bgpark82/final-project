package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.RegistDto;

public interface RegistDao {

   String namespace ="member.";

   public List<RegistDto> regist_list();
   public RegistDto regist_detail(String member_id);
   public int regist_insert(RegistDto regist_dto);
   
   public RegistDto login(String member_id,String member_password);
   
   public RegistDto loginInfo(int member_no);
}
