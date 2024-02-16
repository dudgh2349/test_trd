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
public class AccountDiary {
	
	public AccountDiary() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "A12":
			this.selacBook(model);
			break;
		case "A13":
			this.moveDate(model);
			break;		
		case "A15":
			this.delacBook(model);
			break;		
		
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "A14":
			this.insacBook(mav);
			break;
		
		}
	}

	private void selacBook(Model model) {
	
	}
	
	private void moveDate(Model model) {
		
	}
	private void delacBook(Model model) {
		
	}
	
	
	private void insacBook(ModelAndView mav) {
		
	}
	
	
}
