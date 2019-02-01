package kh.coupon.mvc.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.coupon.mvc.dto.RegistDto;

@Service
public interface RegistBiz {

   public List<RegistDto> regist_list();
   public RegistDto regist_detail(String member_id);
   public int regist_insert(RegistDto regist_dto);
   
   public RegistDto login(String member_id,String member_password);
   
   public RegistDto loginInfo(int member_no);
}
