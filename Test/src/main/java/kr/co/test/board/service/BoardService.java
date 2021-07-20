package kr.co.test.board.service;

import java.util.HashMap;
import java.util.List;

import kr.co.test.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> getBoardList();

	public BoardVO getBoardView(HashMap<String, Object> param);

}
