package icia.cnd.petmate.services.mgr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.cnd.petmate.beans.IstimeBean;
import icia.cnd.petmate.beans.PetBean;
import icia.cnd.petmate.beans.StoreBean;
import icia.cnd.petmate.beans.UserBean;
import icia.cnd.petmate.beans.UserstBean;
import icia.cnd.petmate.utils.Encryption;
import icia.cnd.petmate.utils.JsonWebTokenService;
import icia.cnd.petmate.utils.ProjectUtils;
import icia.cnd.petmate.utils.SimpleTransactionManager;
import icia.cnd.petmate.utils.TransactionAssistant;
import lombok.extern.slf4j.Slf4j;

/* Authentication + Memeber Join */
@Service
@Slf4j
public class MgrHospital extends TransactionAssistant {
	
	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils util;
	@Autowired
	private JsonWebTokenService jwts;
	private SimpleTransactionManager tranManager;

	public MgrHospital() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "AHP04":
			this.inshpPro(model);
			break;
		case "AHP08":
			this.addhpMgrDate(model);
			break;	
		case "AHP07":
			this.selhpMgrDate(model);
			break;
		case "AHP09":
			this.delhpMgrDate(model);
			break;
		
			
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "AHP01":
			this.movehpManager(mav);
			break;
		case "AHP02":
			this.delhpPro(mav);
			break;	
		case "AHP03":
			this.addhpPro(mav);
			break;
		case "AHP05":
			this.movehpMgrReserve(mav);
			break;
		case "AHP06":
			this.movehpMgrDate(mav);
			break;
	
		}
	}

	private void inshpPro(Model model) {
	
	}
	

	private void movehpManager(ModelAndView mav) {
		String page = "user/user_Hospital";
		this.tranManager = this.getTransaction(true);
		

		try {
			this.tranManager.tranStart();
			UserBean user = (UserBean)this.util.getAttribute("userInfo");
			
			List<UserstBean> store = this.sqlSession.selectList("getstcodeList2", user);
			ArrayList<UserstBean> stList = new ArrayList<UserstBean>(); 
			  stList.addAll(store);
			  user.setStoreList(stList);
		  
			  System.out.println("user Hospital.jsp ="+user);
			  
			  
			List<UserstBean> reserve = this.sqlSession.selectList("getusPromotion", user);
			  user.getStoreList().clear();
			
			  stList.addAll(reserve);
			    user.setStoreList(stList);
			    
			    System.out.println("user Hospital.jsp 2 ="+user);
			try {    
			    List<PetBean> pet = this.sqlSession.selectList("getpetList", user);
			    ArrayList<PetBean> petList = new ArrayList<PetBean>();
			    System.out.println("pet = "+ pet);
			    petList.addAll(pet);
			    user.setPetInfoList(petList);
			    
			    System.out.println("last user = " +user);
			    mav.addObject("userInfo", user);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			mav.setViewName(page);
		}
	}
	
	
	
	
	private void addhpMgrDate(Model model) {
		StoreBean store = (StoreBean)model.getAttribute("store");
		String message = null;
		this.tranManager = this.getTransaction(false);
		
		try {
			this.tranManager.tranStart();
			for(int idx=0; idx<store.getTimeList().size(); idx++) {
				IstimeBean time = store.getTimeList().get(idx);
		        Map<String, String> paramMap = new HashMap<>();
		        paramMap.put("storeCode", store.getStoreCode());
		        paramMap.put("reserveDate", String.valueOf(time.getReserveDate()));
		        paramMap.put("reserveTime", time.getReserveTime());
		        this.sqlSession.insert("insertStoreReservation", paramMap);
			}
			message = "등록 성공";
			this.tranManager.commit();
			System.out.println("addhpMgrDate = " + store);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		}finally {
			this.tranManager.tranEnd();
			store.setMessage(message);
		}
	}
	
	private void selhpMgrDate(Model model) {
		
	}
	private void delhpMgrDate(Model model) {
		
	}
	
	
	private void delhpPro(ModelAndView mav) {
		
	}
	private void addhpPro(ModelAndView mav) {
		
	}
	
	
	
	
	
	private void movehpMgrReserve(ModelAndView mav) {
	
		
		
	}
	
	
	
	
	
	
	private void movehpMgrDate(ModelAndView mav) {
		
	}
	
}
