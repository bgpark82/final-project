package kh.coupon.mvc.biz_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.ComplainBiz;
import kh.coupon.mvc.dao.ComplainDao;
import kh.coupon.mvc.dto.ComplainDto;
import kh.coupon.mvc.dto.ReviewDto;

@Service
public class ComplainBizImpl implements ComplainBiz {
   
   @Autowired
   private ComplainDao complain_dao;

   @Override
   public List<ComplainDto> complain_list() {
      return complain_dao.complain_list();
   }

   @Override
   public ComplainDto complain_detail(int complain_no) {
      return complain_dao.complain_detail(complain_no);
   }

   @Override
   public int complain_insert(ComplainDto complain_dto) {
      return complain_dao.complain_insert(complain_dto);
   }

   @Override
   public int complain_update(ComplainDto complain_dto) {
      return complain_dao.complain_update(complain_dto);
   }

   @Override
   public int complain_delete(int complain_no) {
      return complain_dao.complain_delete(complain_no);
   }

   @Override
   public int updateHit(int complain_no) {
      return complain_dao.updateHit(complain_no);
   }

	@Override
	public List<ComplainDto> complain_list_seven() {
		return complain_dao.complain_list_seven();
	}

	@Override
	public List<ComplainDto> complain_list_bear() {
		return complain_dao.complain_list_bear();
	}

	@Override
	public List<ComplainDto> complain_list_magic() {
		return complain_dao.complain_list_magic();
	}

}