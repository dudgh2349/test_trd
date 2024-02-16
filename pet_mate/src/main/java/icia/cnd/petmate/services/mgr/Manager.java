package icia.cnd.petmate.services.mgr;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import icia.cnd.petmate.beans.ImagesBean;
import icia.cnd.petmate.beans.PetBean;
import icia.cnd.petmate.beans.PromotionBean;
import icia.cnd.petmate.beans.StoreBean;
import icia.cnd.petmate.beans.UserBean;
import icia.cnd.petmate.beans.UserstBean;
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
public class Manager extends TransactionAssistant {

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


	public Manager() {
	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model){
		switch(serviceCode) {
		case "MG02":
			this.checkManager(model);
			break;
		
		case "F11":
			this.fileUpload(model);
			break;		
		case "TH0":
			this.insPro(model);
			break;
		case "GI11":
			this.getImage(model);
			break;
			
//		case "GP10":
//			this.getPromotion(model);
//			break;
			
			
		}
	}
	

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch(serviceCode) {
		case "GT01":
			this.getTcPromotion(mav);
			break;
		case "TH1":
			this.getStoreInfo(mav);
			break;
		case "TH2":
			this.mgrHomePage(mav);
			break;
		
		case "SS01":
			this.HomePage(mav);
			break;
		
		}
	}
	
	
	private void getImage(Model model) {
		this.tranManager = this.getTransaction(true);
		
		try {
			this.tranManager.tranStart();
			StoreBean store = (StoreBean) this.util.getAttribute("storeInfo");
		
			System.out.println("getImage = "+ store);
			
		List<ImagesBean> image = this.sqlSession.selectList("getImages", store);
		ArrayList<ImagesBean> imageList = new ArrayList<ImagesBean>();
		imageList.addAll(image);
		store.setImageList(imageList);
		
		
		
		System.out.println("getImage = "+ image );
		
		model.addAttribute("storeInfo", store);
		
		} 

		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
	
		}
	}
	
	
	
	private void HomePage(ModelAndView mav) {
		StoreBean store = new StoreBean();
		String page = "index";
		this.tranManager = this.getTransaction(true);
		
		try {
			this.tranManager.tranStart();
				
		List<UserstBean> storeList = this.sqlSession.selectList("startHome", store);
		ArrayList<UserstBean> firstList = new ArrayList<UserstBean>();
		firstList.addAll(storeList);
		store.setUsStList(firstList);
		
		System.out.println(store);
		
			
			
			
			mav.addObject("storeInfo", store);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			mav.setViewName(page);
		}
		
	}
	
	
	
	/* "mgr_hp/mgr_Hospital" OR "mgr_tc/mgr_TrainCenter" */
	private void mgrHomePage(ModelAndView mav) {
		String page = null;
		this.tranManager = this.getTransaction(true);
		ArrayList<PromotionBean> add = new ArrayList<PromotionBean>();
		try {
			this.tranManager.tranStart();
			StoreBean store = (StoreBean) this.util.getAttribute("storeInfo");
			store = this.sqlSession.selectOne("getStoreInfo", store);
			if(store.getStoreGrade().equals("1")) {
				page="mgr_hp/mgr_Hospital";
			}else {
				page = "mgr_tc/mgr_TrainCenter";
			}
			List<PromotionBean> addList = this.sqlSession.selectList("getAddInfo", store);
			
			for(int i = 0; i<addList.size(); i++) {
				addList.get(i);
			}
			add.addAll(addList);
			store.setAddList(add);
			System.out.println("현재 2023 03 14 = "+ store);
			/*
			 * List<ImagesBean> image = this.sqlSession.selectList("getStImage", store);
			 * ArrayList<ImagesBean> imageList = new ArrayList<ImagesBean>();
			 * 
			 * imageList.addAll(image); System.out.println("Mgr - mgrHomePage = "+
			 * imageList);
			 * 
			 * store.setImageList(imageList);
			 * 
			 */
			mav.addObject("storeInfo", store);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			mav.setViewName(page);
		}
		
	}
	
	
	
private void getTcPromotion(ModelAndView mav) {
	String page = "user/user_Training";
	
	this.tranManager = this.getTransaction(false);
	
	try {
		this.tranManager.tranStart();

		UserBean user = (UserBean) this.util.getAttribute("userInfo");
		
		System.out.println("userInfo = "+ user);
	
		  List<UserstBean> store = this.sqlSession.selectList("getstcodeList", user);
		  System.out.println("getstoreCodeList = " +store); 
		  ArrayList<UserstBean> stList = new ArrayList<UserstBean>(); 
		  stList.addAll(store);
		  
		  System.out.println("stList = "+ stList);
		  user.setStoreList(stList);
		  
		  System.out.println(user);
		 
		  try {
			    List<UserstBean> reserve = this.sqlSession.selectList("getusPromotion", user);
			    user.getStoreList().clear();
			    System.out.println("reserve = " + reserve);
//			    for(int i=0; i<reserve.size(); i++) {
//			    	user.getStoreList().get(i).setStCode(reserve.get(i).getStCode());
//			    	user.getStoreList().get(i).setStaddCode(reserve.get(i).getStaddCode());
//			    	user.getStoreList().get(i).setStaddContent(reserve.get(i).getStaddContent());
//			    	user.getStoreList().get(i).setStaddImages(reserve.get(i).getStaddImages());
//			    	user.getStoreList().get(i).setStAddress(reserve.get(i).getStAddress());
//			    	user.getStoreList().get(i).setStaddSubTitle(reserve.get(i).getStaddSubTitle());
//			    	user.getStoreList().get(i).setStaddTitle(reserve.get(i).getStaddTitle());
//			    	user.getStoreList().get(i).setStEmail(reserve.get(i).getStEmail());
//			    	user.getStoreList().get(i).setStName(reserve.get(i).getStName());
//			    	user.getStoreList().get(i).setStPhone(reserve.get(i).getStPhone());
//			    }
			 	stList.addAll(reserve);
			    user.setStoreList(stList);
			    
			    List<PetBean> pet = this.sqlSession.selectList("getpetList", user);
			    ArrayList<PetBean> petList = new ArrayList<PetBean>();
			    
			    System.out.println("pet = "+ pet);
			    petList.addAll(pet);
			    user.setPetInfoList(petList);
			    
			    System.out.println("last user = " +user);
			    mav.addObject("userInfo", user);
			} catch (Exception e) {
			    e.printStackTrace();
			}
		  		  
		  
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		this.tranManager.tranEnd();
		mav.setViewName(page);
	}
	
}
	
	
	
	
	
	
	
	
	
//	private void getPromotion(Model model) {
//		String message = null;
//		this.tranManager = this.getTransaction(true);
//		
//		ArrayList<PromotionBean> add = new ArrayList<PromotionBean>();
//		try {
//			this.tranManager.tranStart();
//			UserBean user = (UserBean) this.util.getAttribute("userInfo");
//			 = this.sqlSession.selectOne("getStoreInfo", user);
//			
//			
//			List<PromotionBean> addList = this.sqlSession.selectList("getAddInfo", store);
//			for(int i = 0; i<addList.size(); i++) {
//				addList.get(i);
//			}
//			add.addAll(addList);
//			store.setAddList(add);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			this.tranManager.tranEnd();
//			
//		}
//	}
	
	
	
	private void insPro(Model model) {
		String message = null;
		StoreBean store = (StoreBean)model.getAttribute("store");
		this.tranManager = this.getTransaction(false);
		
		try {
			this.tranManager.tranStart();
			System.out.println(store);
			if(store.getStoreGrade().equals("1")) {
				if(this.convertToBoolean(this.sqlSession.insert("insAddListH", store))) {
					message = "게시물 등록 성공";
					this.tranManager.commit();
				}else {
					this.tranManager.rollback();
					message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
				}
			}else {
				if(this.convertToBoolean(this.sqlSession.insert("insAddListT", store))) {
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
	
	
	
	
	
	
	
	
	
	/* "mgr_hp/mgr_hpPromotion" OR "mgr_tc/mgr_tcPromotion" */
	private void getStoreInfo(ModelAndView mav) {
		String page = null;
		this.tranManager = this.getTransaction(true);
		ArrayList<PromotionBean> add = new ArrayList<PromotionBean>();
		try {
			this.tranManager.tranStart();
			StoreBean store = (StoreBean) this.util.getAttribute("storeInfo");
			store = this.sqlSession.selectOne("getStoreInfo", store);
			if(store.getStoreGrade().equals("1")) {
				page="mgr_hp/mgr_hpPromotion";
			}else {
				page = "mgr_tc/mgr_tcPromotion";
			}
			List<PromotionBean> addList = this.sqlSession.selectList("getAddInfo", store);
			for(int i = 0; i<addList.size(); i++) {
				addList.get(i);
			}
			add.addAll(addList);
			store.setAddList(add);
			mav.addObject("storeInfo", store);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.tranManager.tranEnd();
			mav.setViewName(page);
		}
		
	}
	
	
	private String imageCode() {
		String ALPHABET = "adsnlvsaoiethpq24385960123845cpijqtlkjklasdf";
		Random RANDOM = new Random();

		int length = 4;
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			int randomIndex = RANDOM.nextInt(ALPHABET.length());
			char randomChar = ALPHABET.charAt(randomIndex);
			sb.append(randomChar);
		}
		return sb.toString();

	}
	
	
	
	
	
	private void fileUpload(Model model) {
	    StoreBean store = (StoreBean) model.getAttribute("store");
	    MultipartFile[] files = (MultipartFile[]) model.getAttribute("file");
	    ArrayList<ImagesBean> images = new ArrayList<ImagesBean>();
	    System.out.println("fileUpload =  "+ store);
	  ImagesBean image = null;
	   
	
	    for (MultipartFile file : files) {
	        try {
	        	 
	    	    image = new ImagesBean();
	            	
	            // 파일 이름
	            String fileName = file.getOriginalFilename();
	            // 파일 내용
	            byte[] bytes = file.getBytes();
	            // 파일 경로
	            String filePath = "D:\\pet mate\\pet_mate\\src\\main\\webapp\\resources\\Items\\" + store.getStoreCode() + "\\" + fileName;
	            // 파일 저장
	            Path path = Paths.get(filePath);
	            Files.createDirectories(path.getParent()); // 디렉토리가 없으면 생성
	            Files.write(path, bytes);
	            
	            
	            
	            
	            
	                image.setImageCode(imageCode());
	            	image.setImageLocation(store.getStoreCode() + "\\" + fileName);
	            	images.add(image); 
	          
	            	 
	        } catch (IOException e) {e.printStackTrace();} 
	    }
	  
	   
	   System.out.println(images);
	
	    try {
	    	if(images != null) {
	   		 
	    	this.tranManager = this.getTransaction(false);
        	this.tranManager.tranStart();
        	
	    	store.setImageList(images);
	    	System.out.println("fileUpload : "+store);
	    	if(convertToBoolean(this.sqlSession.insert("insImages",store))) {
	    	
	    		System.out.println("image insert sucessfully");	    		
	    		
	    		this.tranManager.commit();
    		model.addAttribute(store);

	    	}else this.tranManager.rollback();	    		    	
		} 
	 } 
	    catch (Exception e) {e.printStackTrace();} 
	    this.tranManager.tranEnd();
	} 
	

	private void checkManager(Model model) {
	
	}
	
	/*
	 * private void selMgInfo(ModelAndView mav) { String message = "selMg 정보조회 완료";
	 * this.tranManager = this.getTransaction(true); try { ArrayList<PromotionBean>
	 * add = new ArrayList<PromotionBean>(); this.tranManager.tranStart(); StoreBean
	 * store = (StoreBean) this.util.getAttribute("storeInfo"); store =
	 * this.sqlSession.selectOne("getStoreInfo", store);
	 * 
	 * List<PromotionBean> addList = this.sqlSession.selectList("getAddInfo",
	 * store);
	 * 
	 * if(addList.size() != 0) { for(int i = 0; i<addList.size(); i++) {
	 * addList.get(i); } add.addAll(addList); store.setAddList(add);
	 * 
	 * 
	 * }else message = "등록된 정보가 없습니다.";
	 * 
	 * 
	 * System.out.println(message); System.out.println("selMgInfo - "+store);
	 * store.setMessage(message);
	 * 
	 * mav.addObject(message, message); mav.addObject("storeInfo", store);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }finally {
	 * this.tranManager.tranEnd();
	 * 
	 * }
	 * 
	 * }
	 */
	
	
	
	
	/* boolean 변환 */
	protected boolean convertToBoolean(int value) {
		return value > 0 ? true : false;
	}
	
	
}
