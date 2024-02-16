package icia.cnd.petmate.services.mypage;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

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
public class Mypage extends TransactionAssistant {

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
	
	public Mypage() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "M12":
			this.selMyinfo(model);
			break;
		case "M14":
			this.insertMyinfo(model);
			break;
		case "M15":
			this.udpMyPage(model);
			break;
		
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "M11":
			this.moveMyPageCtl(mav);
			break;
		case "M13":
			this.moveMyinfoCtl(mav);
			break;
		}
	}
	
	private void udpMyPage(Model model) {
		UserBean user = (UserBean)model.getAttribute("user");
		try {
			System.out.println("1"+user);
			this.tranManager = this.getTransaction(false);
			this.tranManager.tranStart();
			
			
			
			if(this.convertToBoolean(this.sqlSession.update("updateUser", user))) {
				this.tranManager.commit();
				System.out.println("78");
				model.addAttribute("userInfo", user);
			}else {
				this.tranManager.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
		}
	}

	private void selMyinfo(Model model) {
	
	}
	
	private void insertMyinfo(Model model) {
		
	}
	
	
	
	private void moveMyPageCtl(ModelAndView mav) {
		String page = "user/user_MyPage";
		UserBean userInfo = new UserBean();
		this.tranManager = this.getTransaction(true);
		try {
			this.tranManager.tranStart();
			userInfo = (UserBean) this.util.getAttribute("userInfo");
			
			userInfo = this.sqlSession.selectOne("getUser", userInfo);
			System.out.println("82" + userInfo);
			
			mav.addObject("userInfo",userInfo);
			//user = this.sqlSession.selectOne("get", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			
			mav.setViewName(page);
		}
	}
	
	private void moveMyinfoCtl(ModelAndView mav) {
		
	}
	
	protected boolean convertToBoolean(int value) {
		return value > 0 ? true : false;
	}
	
}
