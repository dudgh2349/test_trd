package icia.cnd.petmate.services.hp;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.cnd.petmate.beans.UserBean;
import lombok.extern.slf4j.Slf4j;

/* Authentication + Memeber Join */
@Service
@Slf4j
public class Hospital {
	
	public Hospital() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "HP12":
			this.selhpPromotion(model);
			break;
		case "HP15":
			this.selhpDateInfo(model);
			break;	
		case "HP19":
			this.selhpDateList(model);
			break;
		
			
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "HP11":
			this.moveHpPage(mav);
			break;
		case "HP13":
			this.moveDetailHp(mav);
			break;	
		case "HP14":
			this.moveReserveHp(mav);
			break;
		case "HP16":
			this.insHpDate(mav);
			break;
		
		}
	}

	private void selhpPromotion(Model model) {
	UserBean user = new UserBean();
	
	}
	
	private void selhpDateInfo(Model model) {
		
	}
	
	private void selhpDateList(Model model) {
		
	}
	
	
	private void moveHpPage(ModelAndView mav) {
		
	}
	private void moveDetailHp(ModelAndView mav) {
		
	}
	private void moveReserveHp(ModelAndView mav) {
		
	}
	private void insHpDate(ModelAndView mav) {
		
	}
	
}
