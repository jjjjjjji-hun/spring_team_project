package com.project.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.board.domain.BoardVO;
import com.project.board.domain.PageMaker;
import com.project.board.domain.SearchCriteria;
import com.project.board.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public String getList(SearchCriteria cri, Model model) {
		
		List<BoardVO> boardList = service.getList(cri);
		
		model.addAttribute("boardList", boardList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(service.countPageNum(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		log.info("boardList");
		return "board/boardList";
		
	}
	
	@GetMapping("/list/{bno}")
	public String getBoardDetail(@PathVariable long bno, SearchCriteria cri, Model model) {
		
		model.addAttribute("board", service.select(bno));
		
		model.addAttribute("cri", cri);
		
		return "board/boardDetail";
	}
	
	@GetMapping(value="/insert")
	public String boardForm() {
		return "board/boardForm";
	}
	
	@PostMapping("/insert")
	public String boardInsert(BoardVO vo, Model model) {
			
		log.info("들어온 데이터 디버깅 : " + vo);
			
		service.insert(vo);
			
		return "redirect:list/";
	}
	
	@PostMapping("/delete")
	public String boardDelete(long bno, SearchCriteria cri, RedirectAttributes rttr) {
		
		service.delete(bno);
			
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:list";
	}
	
	@PostMapping("/updateForm")
	public String boardUpdateForm(long bno, SearchCriteria cri, Model model) {
		
		BoardVO boardvo = service.select(bno);
		
		model.addAttribute("board", boardvo);
		
		model.addAttribute("cri", cri);
		
		return "board/boardUpdateForm";
	}
	
	@PostMapping("/update")
	public String boardUpdate(BoardVO vo, SearchCriteria cri, RedirectAttributes rttr) {
		
		service.update(vo);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:list/" + vo.getBno();
	}
	
}
