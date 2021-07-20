package kr.co.test;

import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.test.board.mapper.BoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/*-context.xml")
public class BoardTest {
	@Autowired
	private BoardMapper mapper;

//	@Test
	public void getList() {
		mapper.getBoardList();
	}

	@Test
	public void boardView() {
		HashMap<String, Object> param = new HashMap<>();
		int bno = 1;
		param.put("bno", bno);
		mapper.getBoardView(param);
	}
}
