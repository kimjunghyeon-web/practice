package kr.co.test.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.test.board.service.BoardService;
import kr.co.test.board.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list.do", method = { RequestMethod.GET })
	public String list(Model model) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		list = boardService.getBoardList();
		model.addAttribute("list", list);
		return "board/list.page";
	}

	@RequestMapping(value = "/list_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardView(HttpServletRequest req, Model model) {
		HashMap<String, Object> param = new HashMap<>();
		int bno = Integer.parseInt(req.getParameter("bno"));
		param.put("bno", bno);
		BoardVO view = boardService.getBoardView(param);
		model.addAttribute("view", view);
		return "board/list_view.page";
	}
}
