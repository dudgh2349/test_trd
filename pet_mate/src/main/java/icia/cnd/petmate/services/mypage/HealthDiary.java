package icia.cnd.petmate.services.mypage;

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
public class HealthDiary {
	
	public HealthDiary() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "H12":
			this.selHealth(model);
			break;
		case "H14":
			this.delHealth(model);
			break;		
		
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "H11":
			this.healthPage(mav);
			break;
		case "H13":
			this.insHealth(mav);
			break;		
		
		}
	}

	private void selHealth(Model model) {
	
	}
	
	private void delHealth(Model model) {
		
	}
	
	
	private void healthPage(ModelAndView mav) {
		
	}
	private void insHealth(ModelAndView mav) {
		
	}
	
	
	
}
