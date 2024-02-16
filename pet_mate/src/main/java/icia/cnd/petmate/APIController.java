package icia.cnd.petmate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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

@RestController
@Slf4j
public class APIController {
	@Autowired
	private Authentication auth;
	@Autowired
	private Board boardPage;
	@Autowired
	private MgrTrainCenter mgrTrain;
	@Autowired
	private Manager mgr;
	@Autowired
	private Mypet mypet;
	@Autowired
	private Mypage mypage;
	@Autowired
	private MgrHospital mgrHp;
	
	@RequestMapping(value = "/naver", method = {RequestMethod.GET})
	public UserBean naverSave(Model model, @ModelAttribute UserBean user) {
		
		
		
		
		
		
		
		System.out.println(user);
		model.addAttribute("user", user);
		//auth.backController("API01", model);
		// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
		return user;
	}
	
	@PostMapping("/stCodeDupcheck")
	public StoreBean stCodeDupcheck(Model model, @ModelAttribute StoreBean store) {
		System.out.println(store);
		model.addAttribute("storeInfo", store);
		auth.backController("R20", model);
		log.info("< {} >", store);
		System.out.println("hello");
		return (StoreBean)model.getAttribute("store");
	}
	
	@PostMapping("/getPromotion")
	public UserBean getPromotion(Model model, @ModelAttribute UserBean user) {
		System.out.println(user);
		model.addAttribute("userInfo", user);
		
		mgr.backController("GP10", model);
		
		log.info("< {} >", user);
		
		return (UserBean)model.getAttribute("user");
	}
	
	
	
	
	@PostMapping("/Dupcheck")
	public StoreBean idDupCheck(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		auth.backController("R12", model);
		log.info("< {} >", store);
		return (StoreBean)model.getAttribute("store");
	}
	
	@PostMapping("/selLogin")
	public StoreBean token(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		log.info("<{}>", store);
		System.out.println("selLogin");
		auth.backController("L12", model);
		return (StoreBean)model.getAttribute("store");
	}
	@PostMapping("/checkEmail")
	public StoreBean checkEmail(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		System.out.println(store);
		log.info("<{}>", store);
		auth.backController("R15", model);
		return (StoreBean)model.getAttribute("store");
	}
	@PostMapping("/emailCode")
	public StoreBean emailCode(Model model, @ModelAttribute StoreBean store) {
		model.addAttribute("store", store);
		System.out.println(store);
		log.info("<{}>", store);
		auth.backController("R16", model);
		return (StoreBean)model.getAttribute("store");
	}
	
	@PostMapping("/insBoard")
	public StoreBean insBoard(Model model, @ModelAttribute BoardBean board) {
		System.out.println(board);
		model.addAttribute("board", board);
		boardPage.backController("B15", model);
		System.out.println("여기임"+ board);
		return (StoreBean)model.getAttribute("store");
	}
	
	@PostMapping("/getJWT")
	public UserBean getJWT(Model model, @ModelAttribute UserBean user) {
		System.out.println(user);
		model.addAttribute("user", user);
		auth.backController("ApiJWT", model);
	
		return (UserBean)model.getAttribute("user");
	}
	
	@PostMapping("/api/InsAdd")
	public StoreBean insAdd(Model model, @ModelAttribute StoreBean store) {
		System.out.println("ㅎㅇㅇ");
		System.out.println("API 80 : "+store);
		model.addAttribute("store", store);
		mgrTrain.backController("TR99", model);
		return(StoreBean)model.getAttribute("store");
	}
	
	@PostMapping("/beforeLogout")
	public UserBean beforeLogout(Model model, @ModelAttribute UserBean user) {
		System.out.println(user);
		model.addAttribute("user", user);
		auth.backController("R17", model);
	
		return (UserBean)model.getAttribute("user");
	}


	@PostMapping("/fileUpload")
    public StoreBean uploadFile(Model model, @ModelAttribute StoreBean store ,@RequestParam("file") MultipartFile[] files) {
       		
		model.addAttribute("store", store);
		model.addAttribute("file",files);
		
		mgr.backController("F11", model);

		return (StoreBean)model.getAttribute("store");
	}
	
	@PostMapping("/api/insuserBoard")
	public UserBean insuserBoard(Model model, @ModelAttribute UserBean user) {
		user.getBoardList().get(0).setImages("00000");
		System.out.println("qwe"+user);
		model.addAttribute("user", user);
		boardPage.backController("B25", model);
		return (UserBean)model.getAttribute("user");
	}
	
	
	
	
	@PostMapping("/api/addDiary")
		public UserBean addDiary(Model model, @ModelAttribute UserBean user) {
		System.out.println("eeee"+user);
			model.addAttribute("user", user);
			this.mypet.backController("M19", model);
			return (UserBean)model.getAttribute("user");
		}
	
	@PostMapping("/api/modifyMy")
	public UserBean modifyMy(Model model, @ModelAttribute UserBean user) {
		model.addAttribute("user", user);
		this.mypage.backController("M15", model);
		return (UserBean)model.getAttribute("userInfo");
	}
	
	@PostMapping("/api/InsReserve")
	public StoreBean insReserveTime(Model model, @ModelAttribute StoreBean store) {
		
		model.addAttribute("store", store);
		System.out.println("insReserveTime = " + store);
		
		this.mgrHp.backController("AHP08", model);
		
		
		return (StoreBean)model.getAttribute("storeInfo");
	}
	@PostMapping("/api/insPet")
	public UserBean insPet(Model model, @ModelAttribute UserBean user) {
		model.addAttribute("user",user);
		System.out.println(model);
		mypet.backController("M16", model);
		return (UserBean)model.getAttribute("userInfo");
	}

	@PostMapping("api/getImage")
	public StoreBean getImage(Model model, @ModelAttribute StoreBean store) {
		
		
		model.addAttribute("store",store);
		System.out.println(model);
		this.mgr.backController("GI11", model);
		
		
		return (StoreBean)model.getAttribute("storeInfo");
	}
	
	@PostMapping("api/getPetUser")
	public UserBean getPetUser(Model model, @ModelAttribute UserBean user) {
		model.addAttribute("userInfo", user);
		this.mgrTrain.backController("TR00", model);
		return (UserBean)model.getAttribute("userInfo");
	}
	
	@PostMapping("api/insTcDiary")
	public StoreBean insTcDiary(Model model, @ModelAttribute StoreBean store) {
		System.out.println("asd"+store);
		model.addAttribute("storeInfo", store);
		this.mgrTrain.backController("TR13", model);
		return (StoreBean)model.getAttribute("storeInfo");
	}
	
	
	
	
	
}