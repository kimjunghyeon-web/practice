package kr.co.test.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.test.board.service.BoardService;
import kr.co.test.board.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	/* 게시판목록 */
	@RequestMapping(value = "/list.do", method = { RequestMethod.GET })
	public String list(Model model) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		list = boardService.getBoardList();
		model.addAttribute("list", list);
		return "board/list.page";
	}

	/* 게시물 상세보기 */
	@RequestMapping(value = "/list_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardView(HttpServletRequest req, Model model) {
		HashMap<String, Object> param = new HashMap<>();
		int bno = Integer.parseInt(req.getParameter("bno"));
		param.put("bno", bno);
		BoardVO view = boardService.getBoardView(param);
		model.addAttribute("view", view);
		return "board/list_view.page";
	}

	@RequestMapping(value = "/list_write.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardWrite(HttpServletRequest req, @ModelAttribute BoardVO boardVO, Model model) {
		if (boardVO.getTitle() != null && boardVO.getContent() != null) {
			boardService.insertBoard(boardVO);

			List<BoardVO> list = new ArrayList<BoardVO>();
			list = boardService.getBoardList();
			model.addAttribute("list", list);

			return "redirect:/list.do";
		}
		return "board/write.page";
	}

	@RequestMapping(value = "/list_delete.do", method = { RequestMethod.POST })
	public String boardDelete(HttpServletRequest req, Model model) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		Integer bno = Integer.parseInt(req.getParameter("bno"));
		param.put("bno", bno);
		boardService.boardDelete(param);

		List<BoardVO> list = new ArrayList<BoardVO>();
		list = boardService.getBoardList();
		model.addAttribute("list", list);

		return "redirect:/list.do";
	}

	@RequestMapping(value = "/list_Modify.do", method = { RequestMethod.POST })
	public String boardModify(RedirectAttributes red, @ModelAttribute BoardVO boardVO, Model model) {
		HashMap<String, Object> param = new HashMap<>();
		Integer bno = boardVO.getBno();
		String title = boardVO.getTitle();
		String content = boardVO.getContent();

		param.put("bno", bno);
		param.put("title", title);
		param.put("content", content);

		boardService.boardModify(param);
		red.addAttribute("bno", bno);
		return "redirect:/list_view.do";
	}

}
