package com.champion.mvc01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentController {

	@Autowired
	CommentDAO dao;
	
	@RequestMapping("commentinsert")
	public void insert(CommentDTO dto) {
		dao.insert(dto);
	}
	
	@RequestMapping("Clist")
	public void select(CommentDTO dto,Model model) throws Exception {
		List<CommentDTO> Clist = dao.selectList(dto);
		model.addAttribute("Clist",Clist);
	}
	
	@RequestMapping("Cdelete")
	public void name(CommentDTO dto) {
		dao.delete(dto);
	}
}
