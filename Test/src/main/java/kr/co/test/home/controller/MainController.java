package kr.co.test.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("home.do")
	public String home() {
		return "main/home.page";
	}
}
