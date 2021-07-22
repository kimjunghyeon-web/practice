package kr.co.test;

import java.util.HashMap;
import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.test.board.mapper.BoardMapper;
import kr.co.test.board.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/*-context.xml")
public class BoardTest {
	@Autowired
	private BoardMapper mapper;

//	@Test
	public void getList() {
		mapper.getBoardList();
	}

//	@Test
	public void boardView() {
		HashMap<String, Object> param = new HashMap<>();
		int bno = 1;
		param.put("bno", bno);
		mapper.getBoardView(param);
	}

//	@Test
	public void insertBoard() {
		BoardVO boardVO = new BoardVO(0, "title", "content", "writer", null, 0);
		mapper.insertBoard(boardVO);
	}

//	@Test
//	@Transactional
	public void deleteTest() {

		HashMap<String, Object> param = new HashMap<String, Object>();
		int bno = 0;
		param.put("bno", bno);
		mapper.boardDelete(param);

		List<BoardVO> list = mapper.getBoardList();
		System.out.println(list.size());
	}
}
