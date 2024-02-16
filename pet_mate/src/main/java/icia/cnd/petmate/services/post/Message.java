package icia.cnd.petmate.services.post;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

/* Authentication + Memeber Join */
@Service
@Slf4j
public class Message {
	
	public Message() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "P02":
			this.selDear(model);
			break;
		case "P03":
			this.insPost(model);
			break;		
		case "P05":
			this.delPost(model);
			break;
			
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "P01":
			this.movenotePage(mav);
			break;
		case "P04":
			this.selPost(mav);
			break;		
			
		}
	}

	private void selDear(Model model) {
	
	}
	
	private void insPost(Model model) {
		
	}
	private void delPost(Model model) {
		
	}
	
	private void movenotePage(ModelAndView mav) {
		
	}
	private void selPost(ModelAndView mav) {
		
	}
	
	
}
