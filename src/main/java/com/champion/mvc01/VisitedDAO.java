package com.champion.mvc01;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitedDAO {

   @Autowired
   SqlSessionTemplate myBatis;
   
   public void insert(VisitedDTO dto) {
      myBatis.insert("visited.insert",dto);
   }
   
   public List<VisitedDTO> selectList(VisitedDTO dto){
      List<VisitedDTO> slist = myBatis.selectList("visited.selectList", dto);
      return slist;
   }
    
}