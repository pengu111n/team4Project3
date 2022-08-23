package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
<<<<<<< HEAD
		
		return "main/index";
	}

	@RequestMapping(value = "/main/introduce", method = RequestMethod.GET)
	public void introduce() throws Exception {
=======
		return "home";
>>>>>>> 5461f14fb675a1493f4e4544ae771aa40fcc02c2
	}


	@RequestMapping(value = "/notice/faq", method = RequestMethod.GET)
	public String faq(Locale locale, Model model) {
		return "/notice/faq";
	}


}
