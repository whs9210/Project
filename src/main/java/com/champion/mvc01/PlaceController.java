package com.champion.mvc01;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlaceController {
	@Autowired
	PlaceDAO dao;

	@Autowired
	VisitedDAO v_dao;
	
	@RequestMapping("selectList")
	public void selectList(Model model, PlaceDTO placeDTO) {
		System.out.println(placeDTO);
		List<PlaceDTO> list = dao.selectList(placeDTO);
		model.addAttribute("list", list);
	}

	@RequestMapping("selectList2")
	public void selectList2(Model model) {
		List<PlaceDTO> list = dao.selectList2();
		model.addAttribute("list", list);
	}

	@RequestMapping("selectone.do")
	public String selectone(Model model, PlaceDTO placeDTO) {
		PlaceDTO dto2 = dao.selectOne(placeDTO);
		model.addAttribute("dto2", dto2);
		return "selectList2";
	}

	@RequestMapping("course")
	public void category(Model model, PlaceDTO placeDTO) {
		System.out.println(placeDTO);
		List<PlaceDTO> list = dao.course(placeDTO);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("category")
	public List<PlaceDTO> selectCategory(PlaceDTO placeDTO) {
		List<PlaceDTO> list = dao.selectCategory(placeDTO);
		return list;
	}

	
	@ResponseBody
	@RequestMapping("navi")
	public List<PlaceDTO> navi(PlaceDTO dto) throws Exception {
		List<PlaceDTO> list = dao.selectCategory(dto);
		return list;
	}
	
	@RequestMapping("searchedDetail")
	   public void searchedDetail(Model model, PlaceDTO placeDTO, HttpSession session) throws Exception {
	      PlaceDTO dto = dao.selectOne(placeDTO);
	      VisitedDTO vdto = new VisitedDTO();
	      String mid = (String)session.getAttribute("id");
	      vdto.setImages(dto.images);
	      vdto.setPname(dto.pname);
	      vdto.setMid(mid);
	      v_dao.insert(vdto);
	      model.addAttribute("dto", dto); 
	      List<VisitedDTO> slist = v_dao.selectList(vdto);
		  session.setAttribute("slist", slist);
	   }
	
	
	
	
}