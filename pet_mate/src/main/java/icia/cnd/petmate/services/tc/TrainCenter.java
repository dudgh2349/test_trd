package icia.cnd.petmate.services.tc;

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
public class TrainCenter {
	
	public TrainCenter() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "TC12":
			this.selTcList(model);
			break;
		case "TC15":
			this.seltcDate(model);
			break;	
		case "TC23":
			this.seltcDiary(model);
			break;
		
			
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "TC11":
			this.moveTcPage(mav);
			break;
		case "TC13":
			this.moveTcOff(mav);
			break;	
		case "TC14":
			this.movetcRePage(mav);
			break;
		case "TC16":
			this.insTcDate(mav);
			break;
		case "TC22":
			this.movetcDiary(mav);
			break;
	
		}
	}

	private void selTcList(Model model) {
	
	}
	
	private void seltcDate(Model model) {
		
	}
	
	private void seltcDiary(Model model) {
		
	}
	
	
	private void moveTcPage(ModelAndView mav) {
		
	}
	private void moveTcOff(ModelAndView mav) {
		
	}
	private void movetcRePage(ModelAndView mav) {
		
	}
	private void insTcDate(ModelAndView mav) {
		
	}
	private void movetcDiary(ModelAndView mav) {
		
	}
	
}
