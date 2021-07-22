package kr.co.test.board.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.test.board.vo.BoardVO;

public interface BoardMapper {
	public int count();

	public List<BoardVO> getBoardList();

	public BoardVO getBoardView(HashMap<String, Object> param);

	public void insertBoard(BoardVO boardVO);

	public void boardDelete(HashMap<String, Object> param);

	public void boardModify(HashMap<String, Object> param);

	public void viewCnt(HashMap<String, Object> param);

	public List<BoardVO> findAll(Map<String, Object> map);
}