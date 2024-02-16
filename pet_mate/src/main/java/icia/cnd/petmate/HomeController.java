package icia.cnd.petmate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.cnd.petmate.beans.BoardBean;
import icia.cnd.petmate.beans.StoreBean;
import icia.cnd.petmate.beans.UserBean;
import icia.cnd.petmate.services.auth.Authentication;
import icia.cnd.petmate.services.mgr.Manager;
import icia.cnd.petmate.services.mgr.MgrHospital;
import icia.cnd.petmate.services.mgr.MgrTrainCenter;
import icia.cnd.petmate.services.mypage.Mypage;
import icia.cnd.petmate.services.mypage.Mypet;
import icia.cnd.petmate.services.page.Board;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class HomeController {
	@Autowired
	private Authentication auth;
	@Autowired
	private Board boardPage;
	@Autowired
	private MgrHospital mgHp;
	@Autowired
	private MgrTrainCenter mgTc;
	@Autowired
	private Mypet mypet;
	@Autowired
	private Mypage mypage;
	@Autowired
	private Manager mgr;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mav, @ModelAttribute StoreBean store) {		
		
		this.mgr.backController("SS01", mav );
		
		
		
		return mav;
	}
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user_main() {		
		return "user/main";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(ModelAndView mav) {		
		
		
		return "index";
	}
	
	@RequestMapping(value = "/Memberjoin", method = RequestMethod.GET)
	public String moveLoginPage(ModelAndView mav) {		
		return "login";
	}
	
	@RequestMapping(value = "/Regpage", method = RequestMethod.POST)
	public String moveRegPage(ModelAndView mav) {		
		return "reg_Admin";
	}
	
	@RequestMapping(value = "/Registration", method= RequestMethod.POST)
	public ModelAndView registration(ModelAndView mav, @ModelAttribute StoreBean store) {
		System.out.println(store);
		log.info("< {} >", store);
		mav.addObject("store", store);
		this.auth.backController("R14", mav);
		return mav;
	}
	@RequestMapping(value = "/ApiJWT", method= RequestMethod.POST)
	public ModelAndView insAccessLog(ModelAndView mav, @ModelAttribute UserBean user) {
		System.out.println("insAccessLog");
		System.out.println(user);
		
		mav.addObject("userInfo", user);
		System.out.println(mav);
		this.auth.backController("ApiJWT", mav);
		return mav;
	}
	
	@RequestMapping(value = "/insAccessLog", method= RequestMethod.POST)
	public ModelAndView insAccessLog(ModelAndView mav, @ModelAttribute StoreBean store) {		
		mav.addObject("store", store);
	
		this.auth.backController("R15", mav);
		
		return mav;
	}
	
	
	
	
	
	
	/* USER view를 사용하여 인터셉터 제외되는 페이지 이동*/
	
	@RequestMapping(value = "/view/Mypage", method = RequestMethod.POST)
		public ModelAndView moveMyPage(ModelAndView mav) {
		
			this.mypage.backController("M11", mav);
			return mav;
		}
	
	@RequestMapping(value = "/view/Mypet", method = RequestMethod.POST)
	public ModelAndView moveMypet(ModelAndView mav) {	
		this.mypet.backController("M21", mav);
		return mav;
	}
	
	@RequestMapping(value = "/view/moveacDiary", method = RequestMethod.POST)
	public String moveacDiary(ModelAndView mav) {		
		return "user/user_Ledgers";
	}
	@RequestMapping(value = "/view/Health", method = RequestMethod.POST)
	public ModelAndView moveHePage(ModelAndView mav) {
		System.out.println("moveHePage");
		this.mypet.backController("M20", mav);
		return mav;
	}
	
	// 병원
	
	@RequestMapping(value = "/view/hpPromotion", method = RequestMethod.POST)
	public ModelAndView hpPromotion(ModelAndView mav, @ModelAttribute UserBean user) {		
		
		mav.addObject("user", user);
		this.mgHp.backController("AHP01", mav);		

		return mav;
	}
	@RequestMapping(value = "/view/moveReservehp", method = RequestMethod.POST)
	public String moveinsBoard(ModelAndView mav) {		
		return "user/user_HospitalReserve";
	}
	@RequestMapping(value = "/view/moveReHpList", method = RequestMethod.POST)
	public String moveReHpList(ModelAndView mav) {		
		return "user/user_HospitalReserveList";
	}
	
	//훈련소
	
	@RequestMapping(value = "/view/moveTcPromotion", method = RequestMethod.POST)
	public ModelAndView moveTcPromotion(ModelAndView mav) {		
		
		System.out.println("view/moveTcPromotion");
		
		this.mgr.backController("GT01", mav);
		
		return mav;
	}
	@RequestMapping(value = "/view/moveTcReserve", method = RequestMethod.POST)
	public String moveTcReserve(ModelAndView mav) {		
		return "user/user_TrainingReserve";
	}
	@RequestMapping(value = "/view/moveTcReserveList", method = RequestMethod.POST)
	public String movetcReserveList(ModelAndView mav) {		
		return "user/user_TrainingReserveList";
	}
	
	
	//게시판
	
	@RequestMapping(value = "/view/moveBoard", method = RequestMethod.POST)
	public ModelAndView moveBoard(ModelAndView mav) {
		this.boardPage.backController("BL0", mav);
		return mav;
	}
	@RequestMapping(value = "/view/moveptBoard", method = RequestMethod.POST)
	public String moveptBoard(ModelAndView mav) {		
		return "board_Picture";
	}
	@RequestMapping(value = "/view/boardWrite", method = RequestMethod.POST)
	public String boardWrite(ModelAndView mav) {
		System.out.println("boardWirte");
		this.boardPage.backController("BL1", mav);
		return "board_write";
	}
	@RequestMapping(value = "/view/boardPicWrite", method = RequestMethod.POST)
	public String boardPicWrite(ModelAndView mav) {		
		return "board_write2";
	}
	

	
	
	@RequestMapping(value = "/view/selBoard", method = RequestMethod.POST)
	public ModelAndView selBoard(ModelAndView mav, @ModelAttribute BoardBean board) {
		System.out.println("HOME 118 : "+board);
		mav.addObject("board",board);
		this.boardPage.backController("BL99", mav);
		return mav;
	}
	
	
	
	@RequestMapping(value = "/view/Mgr_Mypage", method = RequestMethod.POST)
	public String moveMgr_Mypage(ModelAndView mav) {		
		return "mgr_Mypage";
	}
	
	
	/* MGR Hospital view를 사용하여 인터셉터 제외되는 페이지 이동*/
	
	@RequestMapping(value = "/MgrHp", method = RequestMethod.GET)
	public ModelAndView moveMgrHp(ModelAndView mav, @ModelAttribute StoreBean store) {	
		
		mav.addObject("store", store);
		this.mgr.backController("TH2", mav);
		
		
		
		return mav;
	}
	
	
	@RequestMapping(value = "/view/Mgr_hpPromotion", method = RequestMethod.POST)
	public ModelAndView moveMgr_hpPromotion(ModelAndView mav) {
		this.mgr.backController("TH1", mav);
		return mav;
	}
	
	@RequestMapping(value = "/view/Mgr_hpReserve", method = RequestMethod.POST)
	public ModelAndView moveMgr_hpReserve(ModelAndView mav, @ModelAttribute StoreBean store) {		
		
		System.out.println(store);
		
		mav.addObject(store);
		 this.mgr.backController("TH1", mav);
		
		
		
		
		return mav;
	}
	@RequestMapping(value = "/view/Mgr_hpList", method = RequestMethod.POST)
	public String moveMgr_hpList(ModelAndView mav) {		
		return "mgr_hp/mgr_hpReserveList";
	}
	
	
	
	/* MGR TrainCenter view를 사용하여 인터셉터 제외되는 페이지 이동*/
	
	@RequestMapping(value = "/MgrTc", method = RequestMethod.GET)
	public ModelAndView moveMgrTc(ModelAndView mav, @ModelAttribute StoreBean store) {		
		
		
		mav.addObject("store", store);
		this.mgr.backController("TH2", mav);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/view/Mgr_tcPromotion", method = RequestMethod.POST)
	public ModelAndView moveMgr_tcPromotion(ModelAndView mav) {		
		this.mgr.backController("TH1", mav);
		return mav;
	}
	
	@RequestMapping(value = "/view/Mgr_tcReserve", method = RequestMethod.POST)
	public String moveMgr_tcReserve(ModelAndView mav) {		
		return "mgr_tc/mgr_tcReserve";
	}
	
	@RequestMapping(value = "/view/Mgr_tcList", method = RequestMethod.POST)
	public String moveMgr_tcList(ModelAndView mav) {		
		return "mgr_tc/mgr_tcReserveList";
	}
	
	@RequestMapping(value = "/view/Mgr_tcDiary", method = RequestMethod.POST)
	public ModelAndView moveMgr_tcDiary(ModelAndView mav) {
		this.mgTc.backController("TR11", mav);
		return mav;
	}
	
	@RequestMapping(value = "/view/Mgr_tcDiaryList", method = RequestMethod.POST)
	public ModelAndView moveMgr_tcDiaryList(ModelAndView mav) {		
		this.mgTc.backController("TR14", mav);
		return mav;
	}
	
}
