package kr.co.test;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping(value = "/home.do")
	public String home(Locale locale, Model model) {
		System.out.println("========================s======");
		return "home";
	}

}
