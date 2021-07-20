package kr.co.test.board.mapper;

import java.util.HashMap;
import java.util.List;

import kr.co.test.board.vo.BoardVO;

public interface BoardMapper {
	public List<BoardVO> getBoardList();

	public BoardVO getBoardView(HashMap<String, Object> param);

}