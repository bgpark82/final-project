package kh.coupon.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("academy")
public class AcademyController {

	@RequestMapping("test")
	public String test() {
		return "academyViews/academyControllerTest";
	}
}
