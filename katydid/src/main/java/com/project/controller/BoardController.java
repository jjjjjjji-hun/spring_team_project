package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;
import com.project.domain.CategoryVO;
import com.project.domain.NotifyVO;
import com.project.domain.PageMaker;
import com.project.domain.ReplyVO;
import com.project.domain.SearchCriteria;
import com.project.domain.StoreVO;
import com.project.service.Notify.NotifyService;
import com.project.service.board.BoardService;
import com.project.service.category.CategoryService;
import com.project.service.store.StoreService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private CategoryService categoryservice;
	
	@Autowired
	private StoreService storeservice;
	
	@Autowired
	private NotifyService notifyservice;
	
	@PreAuthorize("permitAll")
	@GetMapping("/list")
	public String getList(SearchCriteria cri, Model model) {
		
		List<BoardVO> boardList = service.getList(cri);
		
		model.addAttribute("boardList", boardList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(service.countPageNum(cri));
		List<NotifyVO> vo = notifyservice.getRecentList();
		
		model.addAttribute("recentNotifyList", vo);
		model.addAttribute("pageMaker", pageMaker);
		log.info("boardList");
		System.out.println("????????? : " + boardList);
		return "board/boardList";
		
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/list/{bno}")
	public String getBoardDetail(@PathVariable long bno, SearchCriteria cri, Model model) {
		
		List<NotifyVO> vo = notifyservice.getRecentList();
		
		model.addAttribute("recentNotifyList", vo);
		model.addAttribute("board", service.select(bno));
		
		model.addAttribute("cri", cri);
		
		return "board/boardDetail";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@GetMapping(value="/insert")
	public String boardForm(CategoryVO vo, Model model) {
		
		List<NotifyVO> notifyvo = notifyservice.getRecentList();
		
		model.addAttribute("recentNotifyList", notifyvo);
		
		model.addAttribute("category", categoryservice.getCategoryList());
		model.addAttribute("store", storeservice.listStore2());
		log.info("???????????? ????????? ?????????" + vo);
		return "board/boardForm";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/insert")
	public String boardInsert(BoardVO vo, Model model) {
		log.info("????????? ????????? ????????? : " + vo);
		
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		service.insert(vo);
			
		return "redirect:list";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@PostMapping("/delete")
	public String boardDelete(long bno, SearchCriteria cri, RedirectAttributes rttr) {
		
		service.delete(bno);
			
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:list";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/updateForm")
	public String boardUpdateForm(long bno, SearchCriteria cri, Model model) {
		
		List<NotifyVO> vo = notifyservice.getRecentList();
		
		model.addAttribute("recentNotifyList", vo);
		
		BoardVO boardvo = service.select(bno);
		
		model.addAttribute("board", boardvo);
		
		model.addAttribute("cri", cri);
		
		return "board/boardUpdateForm";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/update")
	public String boardUpdate(BoardVO vo, SearchCriteria cri, RedirectAttributes rttr) {
		
		service.update(vo);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:list/" + vo.getBno();
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_USER')")
	@PostMapping(value="/B_report")
	public String report() {
		return "board/B_report";
	}
	
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

	
	
	
	
	
}
