package kr.co.test.board.service.Impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.test.board.mapper.BoardMapper;
import kr.co.test.board.service.BoardService;
import kr.co.test.board.vo.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<BoardVO> getBoardList() {
		return boardMapper.getBoardList();
	}

	@Override
	public BoardVO getBoardView(HashMap<String, Object> param) {
		if (param.get("bno") != null) {
			boardMapper.viewCnt(param);
		}
		return boardMapper.getBoardView(param);
	}

	@Override
	public void insertBoard(BoardVO boardVO) {
		boardMapper.insertBoard(boardVO);
	}

	@Override
	public void boardDelete(HashMap<String, Object> param) {
		boardMapper.boardDelete(param);
	}

	@Override
	public void boardModify(HashMap<String, Object> param) {
		boardMapper.boardModify(param);
	}

}
