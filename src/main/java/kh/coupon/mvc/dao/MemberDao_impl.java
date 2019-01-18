package kh.coupon.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dto.MemberDto;

@Repository
public class MemberDao_impl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(MemberDto dto) {
		int res = 0;
		System.out.println("phone : " + dto.getMember_phone());
		try {
			res = sqlSession.insert(namespace+"insert", dto);
		} catch(Exception e) {
			System.out.println("insert 실패");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String idChk(String member_id) {
		String res = null;
		
		try {
			res = sqlSession.selectOne(namespace+"idchk", member_id);
		} catch(Exception e) {
			System.out.println("idChk 실패");
			e.printStackTrace();
		}
		
		return res;
	}

}
