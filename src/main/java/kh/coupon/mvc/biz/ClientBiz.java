package kh.coupon.mvc.biz;

import java.util.List;

import kh.coupon.mvc.dto.ClientDto;

public interface ClientBiz {

	public List<ClientDto> selectList();
	public ClientDto selectOne(int client_no);
}
