package kh.coupon.mvc.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.coupon.mvc.dto.ComplainDto;
import kh.coupon.mvc.dto.ReviewDto;

@Service
public interface ComplainBiz {
   
   public List<ComplainDto> complain_list();
   public List<ComplainDto> complain_list_seven(); // 7그램
   public List<ComplainDto> complain_list_bear(); // 맥주창고
   public List<ComplainDto> complain_list_magic(); // 요술포차
   public ComplainDto complain_detail(int complain_no);
   public int complain_insert(ComplainDto complain_dto);
   public int complain_update(ComplainDto complain_dto);
   public int complain_delete(int complain_no);
   public int updateHit(int complain_no);
}