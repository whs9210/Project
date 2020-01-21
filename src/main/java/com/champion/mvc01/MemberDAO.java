package com.champion.mvc01;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
		@Autowired
		SqlSessionTemplate myBatis;
		public void insert(MemberDTO memberDTO) {
			myBatis.insert("member.insert",memberDTO);
		}
		public MemberDTO select(MemberDTO memberDTO) throws Exception {
		MemberDTO dto2 = myBatis.selectOne("member.select",memberDTO);
		return dto2;
		}
		public List<MemberDTO> selectAll() throws Exception {
			List<MemberDTO> list = myBatis.selectList("member.selectAll");
			return list;
		}
		public void update(MemberDTO dto) throws Exception{
			myBatis.update("member.update",dto);
		}		
		public void delete(MemberDTO dto) throws Exception{
			myBatis.delete("member.delete",dto);
		}
		
}
