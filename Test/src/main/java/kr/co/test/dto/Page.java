package kr.co.test.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Page {
	private Integer pageno;
	private Integer prev;
	private Integer start;
	private Integer end;
	private Integer next;

}
