package icia.cnd.petmate.services.mgr;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.cnd.petmate.beans.PromotionBean;
import icia.cnd.petmate.beans.ReserveBean;
import icia.cnd.petmate.beans.ReserveResultBean;
import icia.cnd.petmate.beans.StoreBean;
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
public class MgrTrainCenter extends TransactionAssistant {
	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils util;
	@Autowired
	private JsonWebTokenService jwts;
	@Autowired
	private EmailService email;
	private SimpleTransactionManager tranManager;
	public MgrTrainCenter() {}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "TR03":
			this.selTrVideo(model);
			break;
		case "TR05":
			this.insTrVideo(model);
			break;	
		case "TR06":
			this.delTrVideo(model);
			break;
		case "TR09":
			this.insTrOff(model);
			break;
		case "TR10":
			this.delTrOff(model);
			break;
		case "TR13":
			this.addTrDiary(model);
			break;
		case "TR99":
			this.insTrainAdd(model);
			break;
		case "TR00":
			this.getPetUser(model);
			break;
			
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "TR01":
			this.moveTrPage(mav);
			break;
		case "TR02":
			this.moveTrWeb(mav);
			break;	
		case "TR04":
			this.moveTrVideo(mav);
			break;
		case "TR07":
			this.moveTrOff(mav);
			break;
		case "TR08":
			this.moveinsTrOff(mav);
			break;
		case "TR11":
			this.moveTrDiary(mav);
			break;
		case "TR12":
			this.moveTraD(mav);
			break;
		case "TR14":
			this.moveTrDiaryList(mav);
			break;
	
		}
	}
	
	private void moveTrDiaryList(ModelAndView mav) {
		this.tranManager = this.getTransaction(true);
		String page =  "mgr_tc/mgr_tcDiaryList";
		ArrayList<PromotionBean> add = new ArrayList<PromotionBean>();
		try {
			this.tranManager.tranStart();
			StoreBean store = (StoreBean)this.util.getAttribute("storeInfo");
			List<PromotionBean> addList = this.sqlSession.selectList("selectTrDiaryList", store);
			for(int idx=0; idx<addList.size(); idx++) {
				System.out.println(addList.get(idx));
			}
			add.addAll(addList);
			store.setAddList(add);
			System.out.println("aaaaa"+store);
			mav.addObject("storeInfo", store);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			mav.setViewName(page);
		}
	}
	
	private void getPetUser(Model model) {
		UserBean user = (UserBean)model.getAttribute("userInfo");
		this.tranManager = this.getTransaction(true);
		System.out.println(user);
		try {
			this.tranManager.tranStart();
			user.setUserName(this.sqlSession.selectOne("getPetUser", user));
			System.out.println(user);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
		}
	}

	private void selTrVideo(Model model) {
	
	}
	
	private void insTrVideo(Model model) {
		
	}
	
	private void delTrVideo(Model model) {
		
	}
	private void insTrOff(Model model) {
		
	}
	private void delTrOff(Model model) {
		
	}
	
	private void addTrDiary(Model model) {
		String message = null;
		ReserveBean re = new ReserveBean();
		ArrayList<ReserveBean> reList = new ArrayList<ReserveBean>();
		this.tranManager = this.getTransaction(false);
		StoreBean store = (StoreBean)model.getAttribute("storeInfo");
		try {
			this.tranManager.tranStart();
			System.out.println(store);
			re.setReUsPetCode(this.sqlSession.selectOne("selectPetCode", store));
			re.setReUsCode(this.sqlSession.selectOne("selectUserCode", store));
			reList.add(re);
			store.setReserveList(reList);
			if(this.convertToBoolean(this.sqlSession.insert("insTrDiary", store))) {
				message = "등록 성공";
				this.tranManager.commit();
			}else {
				message = "네트워크 오류";
				this.tranManager.rollback();
			}
			System.out.println(store);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			store.setMessage(message);
		}
		
	}
	
	private void moveTrPage(ModelAndView mav) {
		
	}
	private void moveTrWeb(ModelAndView mav) {
		
	}
	private void moveTrVideo(ModelAndView mav) {
		
	}
	private void moveTrOff(ModelAndView mav) {
		
	}
	private void moveinsTrOff(ModelAndView mav) {
		
	}
	private void moveTrDiary(ModelAndView mav) {
		this.tranManager = this.getTransaction(true);
		String page = "mgr_tc/mgr_tcDiary";
		ArrayList<ReserveResultBean> re = new ArrayList<ReserveResultBean>();
		try {
			this.tranManager.tranStart();
			StoreBean store = (StoreBean)this.util.getAttribute("storeInfo");
			List<ReserveResultBean> reList = this.sqlSession.selectList("getPetName", store);
			for(int i = 0; i<reList.size(); i++) {
				reList.get(i);
				}
			re.addAll(reList);
			store.setReResultList(re);
			System.out.println("??"+store);
			mav.addObject("storeInfo", store);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			mav.setViewName(page);
		}
	}
	private void moveTraD(ModelAndView mav) {
		
	}
	
	private void insTrainAdd(Model model) {
		String message = null;
		StoreBean store = (StoreBean)model.getAttribute("store");
		this.tranManager = this.getTransaction(false);
		
		try {
			this.tranManager.tranStart();
			System.out.println(store);
			
			if(store.getStoreCode().substring(0, 1).equals("T")) {
				if(this.convertToBoolean(this.sqlSession.insert("insAddListT", store))) {
					message = "게시물 등록 성공";
					this.tranManager.commit();
				}else {
					this.tranManager.rollback();
					message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
				}
				
			}else if(store.getStoreCode().substring(0, 1).equals("H")) {
				if(this.convertToBoolean(this.sqlSession.insert("insAddListH", store))) {
					message = "게시물 등록 성공";
					this.tranManager.commit();
				}else {
					this.tranManager.rollback();
					message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		}finally {
			this.tranManager.tranEnd();
			store.setMessage(message);
		}
	}
	
	protected boolean convertToBoolean(int value) {
		return value >0? true: false;
	}
	
}
