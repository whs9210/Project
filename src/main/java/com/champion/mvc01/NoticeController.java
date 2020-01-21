package com.champion.mvc01;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class NoticeController {
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	NoticeDAO Ndao;
	
	@Autowired
	CommentDAO Cdao;
	
	@Autowired
	PlaceDAO Pdao;
	
	@RequestMapping("noticeall")
	public void noticeall(Model model) {
		List<NoticeDTO> Nlist = Ndao.selectAll();
		model.addAttribute("Nlist", Nlist);
	}
	
	@RequestMapping("selectone")
	public void selectone(Model model,NoticeDTO dto) throws Exception {
		NoticeDTO dto2 = Ndao.select(dto);
		model.addAttribute("dto", dto2);
	}
	
	@RequestMapping("Ninsert")
	public String Ninsert(Model model,
					@RequestParam(name = "notice_title",required=false) String notice_title,
					@RequestParam(name = "notice_content",required=false) String notice_content,
					@RequestParam(name = "pname",required=false) String pname,
					@RequestParam(name = "mid",required=false) String mid,
					@RequestParam(name = "notice_img",required=false) MultipartFile file
					) {
//		이미지 경로 저장
		String notice_img = null;
		try {
		notice_img = fileUploadService.restore(file);
		}catch (Exception e) {
		}
		NoticeDTO dto = new NoticeDTO();
		dto.setMid(mid);
		dto.setNotice_content(notice_content);
		dto.setNotice_title(notice_title);
		dto.setPname(pname);
		dto.setNotice_img(notice_img);
		Ndao.insert(dto);
		List<NoticeDTO> list = Ndao.selectAll();
		model.addAttribute("Nlist", list);
		return "noticeall";
	}
	
	@RequestMapping("Ndelete")
	public void del(NoticeDTO dto) {
		Ndao.delete(dto);
	}
	
	@RequestMapping("Nupdate")
	public void update(NoticeDTO dto, Model model) {
		NoticeDTO dto2 = Ndao.select(dto);
		model.addAttribute("dto", dto2);
	}
	
	@RequestMapping("Newupdate")
	public String Newupdate(Model model,
			@RequestParam("notice_title") String notice_title,
			@RequestParam("notice_content") String notice_content,
			@RequestParam("notice_id") String notice_id,
			@RequestParam("notice_img") MultipartFile file
			) {
		//이미지 경로 저장
		
		String notice_img = fileUploadService.restore(file);
		int no_id = Integer.parseInt(notice_id);
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_id(no_id);
		dto.setNotice_content(notice_content);
		dto.setNotice_title(notice_title);
		dto.setNotice_img(notice_img);
		Ndao.update(dto);
		List<NoticeDTO> list = Ndao.selectAll();
		model.addAttribute("Nlist", list);
		return "noticeall";
	
	}
	
	@RequestMapping("Pinsert")
	public void Pinsert(Model model) {
		List<PlaceDTO> Plist = Pdao.pnameList();
		model.addAttribute("Plist", Plist);
	}
}
