package com.champion.mvc01;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceDAO {

	@Autowired
	SqlSessionTemplate myBatis;

	public List<PlaceDTO> selectList(PlaceDTO placeDTO) {
		List<PlaceDTO> list = myBatis.selectList("place.selectList", placeDTO);
		return list;
	}

	public List<PlaceDTO> selectList2() {
		List<PlaceDTO> list = myBatis.selectList("place.selectList2");
		return list;
	}

	public PlaceDTO selectOne(PlaceDTO placeDTO) {
		PlaceDTO dto2 = myBatis.selectOne("place.selectOne", placeDTO);
		return dto2;
	}

	public List<PlaceDTO> selectCategory(PlaceDTO placeDTO) {
		List<PlaceDTO> list = myBatis.selectList("place.selectCategory", placeDTO);
		return list;
	}

	public List<PlaceDTO> course(PlaceDTO placeDTO) {
	      List<PlaceDTO> list = myBatis.selectList("place.course", placeDTO);
	      return list;
	   }
	public List<PlaceDTO> pnameList() {
	      List<PlaceDTO> list = myBatis.selectList("place.panmeList");
	      return list;
	   }
	
}
