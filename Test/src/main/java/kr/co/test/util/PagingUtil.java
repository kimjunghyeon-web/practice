package kr.co.test.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.test.dto.Page;

@Component
public class PagingUtil {
	public Map<String, Object> getRowNum(int pageno, int count) {
		int startRowNum = (pageno - 1) * BoardConstrant.BOARD_PER_PAGE + 1;
		int endRowNum = startRowNum * BoardConstrant.BOARD_PER_PAGE - 1;
		if (endRowNum > count)
			endRowNum = count;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return map;
	}

	// 블록당 5개 페이지
	// blockNo prev start end next
	// 0 0 1 5 6
	// 1 5 6 10 11
	// 2 10 11 15 16
	public Page getPage(int pageno, int count) {
		int countOfPage = count / BoardConstrant.PAGE_PER_BLOCK + 1;
		if (count % BoardConstrant.PAGE_PER_BLOCK == 0)
			countOfPage--;
		if (pageno > countOfPage)
			pageno = countOfPage;
		int blockNo = (pageno - 1) / BoardConstrant.PAGE_PER_BLOCK;
		int prev = blockNo * BoardConstrant.PAGE_PER_BLOCK;
		int start = prev + 1;
		int end = prev + BoardConstrant.PAGE_PER_BLOCK;
		int next = end + 1;
		if (end >= countOfPage) {
			end = countOfPage;
			next = 0;
		}
		return Page.builder().pageno(pageno).prev(prev).start(start).end(end).next(next).build();
	}
}
