package kr.co.test.board.service;

import java.util.HashMap;
import java.util.List;

import kr.co.test.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> getBoardList();

	public BoardVO getBoardView(HashMap<String, Object> param);

	public void insertBoard(BoardVO boardVO);

	public void boardDelete(HashMap<String, Object> param);

	public void boardModify(HashMap<String, Object> param);

}
