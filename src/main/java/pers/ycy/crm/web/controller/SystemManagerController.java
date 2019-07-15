package pers.ycy.crm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SystemManagerController {

	@RequestMapping(value = "systemManager",method = RequestMethod.GET)
	public String SystemManager(){
		return "systemManager";
	}

}
