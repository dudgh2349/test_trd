package icia.cnd.petmate.services.mypage;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.cnd.petmate.beans.HealthBean;
import icia.cnd.petmate.beans.PetBean;
import icia.cnd.petmate.beans.UserBean;
import icia.cnd.petmate.utils.EmailService;
import icia.cnd.petmate.utils.Encryption;
import icia.cnd.petmate.utils.JsonWebTokenService;
import icia.cnd.petmate.utils.ProjectUtils;
import icia.cnd.petmate.utils.SimpleTransactionManager;
import icia.cnd.petmate.utils.TransactionAssistant;
import lombok.extern.slf4j.Slf4j;

/* Authentication + Memeber Join */
@Service
@Slf4j
public class Mypet extends TransactionAssistant {

	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils util;
	@Autowired
	private JsonWebTokenService jwts;
	@Autowired
	private EmailService email;
	private SimpleTransactionManager tranManager;
	private String aesStrings[];
	
	public Mypet() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "M16":
			this.insertMypet(model);
			break;
		case "M17":
			this.updMypet(model);
			break;		
		case "M18":
			this.selMypet(model);
			break;
		case "M19":
			this.petHealth(model);
			break;
			
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "M15":
			this.moveMypet(mav);
			break;
		case "M20":
			this.getPetHealth(mav);
			break;
		case "M21":
			this.getPetInfo(mav);
			break;
		
		}
	}
	
	private void getPetHealth(ModelAndView mav) {
		this.tranManager = this.getTransaction(true);
		try {
			this.tranManager.tranStart();
			PetBean pet = new PetBean();
			ArrayList<HealthBean> health = new ArrayList<HealthBean>();
			ArrayList<PetBean> petList = new ArrayList<PetBean>();
			UserBean user = (UserBean)this.util.getAttribute("userInfo");
			
			List<PetBean> ptList = this.sqlSession.selectList("getPetInfo", user);
			petList.addAll(ptList);
			
			
			System.out.println("getPetHealth = "+petList);
			
			List<HealthBean> healthList = this.sqlSession.selectList("selPetHealth", user);
			for(int i = 0; i<healthList.size(); i++) {
				healthList.get(i);
			}
			health.addAll(healthList);
			pet.setHealthList(health);
			petList.add(pet);
			user.setPetInfoList(petList);
		
			
			
			
			mav.addObject("userInfo", user);
			System.out.println(user);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			mav.setViewName("user/user_Dairy");
		}
	}
	
	private void petHealth(Model model) {
		UserBean user = (UserBean)model.getAttribute("user");
		HealthBean petList = new HealthBean();
		this.tranManager = this.getTransaction(false);
		
		System.out.println("74"+user);
		try {
			this.tranManager.tranStart();
			if(this.convertToBoolean(this.sqlSession.insert("insHealth", user))) {
				System.out.println("성공");
				model.addAttribute("user", user);
				
				this.tranManager.commit();
			}else {
				System.out.println("실패");
				this.tranManager.tranEnd();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
		}
	}
	
	private void getPetInfo(ModelAndView mav) {
		UserBean user = new UserBean();
		PetBean pet = new PetBean();
		ArrayList<PetBean> petInfo = new ArrayList<PetBean>();
		try {
			this.tranManager = this.getTransaction(true);
			this.tranManager.tranStart();
			user=(UserBean) this.util.getAttribute("userInfo");
			List<PetBean> petList = this.sqlSession.selectList("petList",user);
			for(int i =0; i<petList.size(); i++) {
				petList.get(i);
			}
			petInfo.addAll(petList);
			user.setPetInfoList(petInfo);
			
			for(int i=0; i<petList.size(); i++) {
				
				if(user.getPetInfoList().get(i).getPetGender().equals("1") || user.getPetInfoList().get(i).getPetGender() == "1" ) {
					user.getPetInfoList().get(i).setPetGender("남자아이");
				}else{
					user.getPetInfoList().get(i).setPetGender("여자아이");
				}
				user.getPetInfoList().get(i).setPetBirth(user.getPetInfoList().get(i).getPetBirth().substring(0, 10));
			}
			
			
			
			
			System.out.println("Mypet 91"+user);
			mav.addObject("userInfo",user);
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			mav.setViewName("user/user_PetPage");
		}
	}
	
	
	

	private void insertMypet(Model model) {
		UserBean user = (UserBean)model.getAttribute("user");
		String message = null;
		
		this.tranManager = this.getTransaction(false);
		
		try {
			this.tranManager.tranStart();
			System.out.println(user);
			if(this.convertToBoolean(this.sqlSession.insert("insPet",user))){
				
				System.out.println("insert 성공");
				
				this.tranManager.commit();
			
				List<PetBean> petList = this.sqlSession.selectList("petList",user);
					for(int i=0; i<petList.size(); i++) {
						petList.get(i);
					}
				
				user.setPetInfoList((ArrayList<PetBean>) petList);
				System.out.println("Mypet 89"+user);
				message = "등록 성공";
				model.addAttribute("userInfo", user);
				
			}else {
				this.tranManager.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		}finally {
			this.tranManager.tranEnd();
			System.out.println(message);
		}
		
		}
	
	private void updMypet(Model model) {
		
	}
	private void selMypet(Model model) {
		UserBean user = (UserBean)model.getAttribute("user");
		this.tranManager = this.getTransaction(false);
		System.out.println("Mypet selMypet");
		
		try {
			this.tranManager.tranStart();
			List<PetBean> petList = this.sqlSession.selectList("petList"); 
			for(int i=0; i<petList.size(); i++) {
				petList.get(i);
			}
			this.tranManager.commit();
			
		} catch (Exception e) {
			this.tranManager.rollback();
			
		}finally {
			this.tranManager.tranEnd();
		}
	}
	
	
	
	private void moveMypet(ModelAndView mav) {
		
	}
	
	protected boolean convertToBoolean(int value) {
		return value > 0 ? true : false;
	}
	
}
