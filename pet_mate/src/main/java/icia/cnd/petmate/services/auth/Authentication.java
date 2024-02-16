package icia.cnd.petmate.services.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.cnd.petmate.beans.AccessLogBean;
import icia.cnd.petmate.beans.EmailBean;
import icia.cnd.petmate.beans.ImagesBean;
import icia.cnd.petmate.beans.JWTBean;
import icia.cnd.petmate.beans.PromotionBean;
import icia.cnd.petmate.beans.StoreBean;
import icia.cnd.petmate.beans.UserBean;
import icia.cnd.petmate.beans.UserstBean;
import icia.cnd.petmate.services.mgr.Manager;
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
public class Authentication extends TransactionAssistant {

	@Autowired
	private Manager mgr;
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

	
	
	public Authentication() {
	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "L12":
			this.insLogin(model);
			break;
		case "R12":
			this.idDupCheck(model);
			break;
		case "R15":
			this.emailAuthCheckCtl(model);
			break;
		case "R16":
			this.emailAccessCtl(model);
			break;
		case "API01":
			this.APIlogin(model);
			break;
		case "ApiJWT":
			this.apiJWT(model);
			break;
		case "R17":
			this.insAccessLogout(model);
			break;
			
		case "R20":
			this.stCodeDupcheck(model);
			break;
		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		
		case "API01":
			this.naverLogin(mav);
			break;
		case "R14":
			this.insReg(mav);
			break;
		case "R15":
			this.insAccessLog(mav);
			break;
		
		}
	}
	
	
	
	private void insAccessLogout(Model model) {
		UserBean user = (UserBean) model.getAttribute("user");

		this.tranManager = this.getTransaction(false);
		String message = "로그아웃 실패";

		System.out.println(user);

		try {
			this.tranManager.tranStart();

			user.getAccessList().get(0).setAccessType(-1);
			System.out.println("auth 111 ="+ user);
			
			if(user.getUserCode() == null) {			
				user.setUserCode(this.sqlSession.selectOne("selUserCode", user));
			}
			
			if(convertToBoolean(this.sqlSession.insert("insAccessLogout", user))) {
				System.out.println("logout 성공");
				message = "로그아웃 성공";
				this.tranManager.commit();
				this.util.removeAttribute("userInfo");
			} else {
				this.tranManager.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.tranManager.tranEnd();
			user.setMessage(message);

		}

	}

	private void insAccessLog(ModelAndView mav) {
		this.tranManager = this.getTransaction(false);
		StoreBean store = (StoreBean) mav.getModel().get("store");
		AccessLogBean accessLog = new AccessLogBean();
		ArrayList<PromotionBean> add = new ArrayList<PromotionBean>();
		String message = null;
		String page = "login";
		try {
			this.tranManager.tranStart();

			
			System.out.println("아이디 넘어오냐? "+ store);
			
			/*
			 * String aesStrings1 = enc.aesEncode(store.getStoreId(),
			 * "HoongZzangvictoryWin!"); store.setStoreId(aesStrings1);
			 */
			
				accessLog.setAccessType(1);
				accessLog.setAccessCode(this.sqlSession.selectOne("getStoreCode", store));
				
				
				
				System.out.println(accessLog);
				store.setStoreCode(accessLog.getAccessCode());
				System.out.println("ac" + accessLog);
				if (convertToBoolean(this.sqlSession.insert("insAccessLog", accessLog))) {
					this.tranManager.commit();
					this.util.setAttribute("storeInfo", store);
					message = "로그인 성공";
					
					if(store.getStoreCode().substring(0, 1).equals("H")) {
						
						store = this.sqlSession.selectOne("getStoreInfo", store);
						List<PromotionBean> addList = this.sqlSession.selectList("getAddInfo", store);
						for(int i = 0; i<addList.size(); i++) {
							addList.get(i);
						}
						add.addAll(addList);
						store.setAddList(add);
						System.out.println("Auth insAccessLog 176= "+ store);
						page = "mgr_hp/mgr_Hospital";
					
					
					}else {
						page = "mgr_tc/mgr_TrainCenter";
		
						store = this.sqlSession.selectOne("getStoreInfo", store);
						System.out.println("insAccessLog = " + store);
						List<PromotionBean> addList = this.sqlSession.selectList("getAddInfo", store);
						
						if(addList.size() != 0) {
							for(int i = 0; i<addList.size(); i++) {
								addList.get(i);
							}
							add.addAll(addList);
							store.setAddList(add);
							
							System.out.println("Auth insAccessLog addList = " + store);
											
						}else message = "등록된 정보가 없습니다.";
						
						
			
						System.out.println("selMgInfo - "+store);
						store.setMessage(message);
					}

					/*
					 * System.out.println("현재 2023 03 14 = "+ store);
					 * 
					 * List<ImagesBean> image = this.sqlSession.selectList("getStImage", store);
					 * ArrayList<ImagesBean> imageList = new ArrayList<ImagesBean>();
					 * 
					 * imageList.addAll(image); System.out.println("Mgr - mgrHomePage = "+
					 * imageList);
					 * 
					 * store.setImageList(imageList);
					 */
					
					
				}

				else {
					this.tranManager.rollback();
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		} finally {
			this.tranManager.tranEnd();
			mav.setViewName(page);
			mav.addObject(message, message);
			mav.addObject("storeInfo", store);
			
		}
	}
	
	

	private void insLogin(Model model) {
		this.tranManager = this.getTransaction(true);
		String message = null;
	
		StoreBean store = (StoreBean) model.getAttribute("store");
		try {
			this.tranManager.tranStart();
			if (convertToBoolean(this.sqlSession.selectOne("selId", store))) {
				if (convertToBoolean(this.sqlSession.selectOne("selPw", store))) {
					/* JWT 발행 및 Response에 적재 */
					JWTBean jwtBody = JWTBean.builder().userId(store.getStoreId()).build();

					this.util.transferJWTByResponse(this.jwts.tokenIssuance(jwtBody, store.getStoreId()));
					log.info("JWT =" + this.jwts.tokenIssuance(jwtBody, store.getStoreId()));
					message = "login successful";

				} else {
					message = "비밀번호가 틀렸습니다.";
				}
			} else {
				message = "존재하지 않는 계정입니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		} finally {
			this.tranManager.tranEnd();
			store.setMessage(message);

		}
	}

	/* api로그인시 JWT발행 및 insAccessLog */
	private void apiJWT(Model model) {
		this.tranManager = this.getTransaction(false);
		UserBean user = (UserBean) model.getAttribute("user");
		AccessLogBean accessLog = new AccessLogBean();
		
		String message = null;
		String page = "login";
		try {
			this.tranManager.tranStart();
			System.out.println("auth 170"+this.util.getAttribute("userInfo"));

	
			

			/* JWT 발행 및 Response에 적재 */
			JWTBean jwtBody = JWTBean.builder().userId(user.getUserId()).build();

			this.util.transferJWTByResponse(this.jwts.tokenIssuance(jwtBody, user.getUserId()));

			System.out.println("JWT =" + this.jwts.tokenIssuance(jwtBody, user.getUserId()));

			if (true/* 토큰 확인 했을 경우 */) {
				accessLog.setAccessType(1);

				accessLog.setAccessCode(this.sqlSession.selectOne("getUserCode", user));
				
				System.out.println("apiJWT = "+ accessLog);
				
				
				if (convertToBoolean(this.sqlSession.insert("insAccessLog", accessLog))) {
					this.tranManager.commit();
					user.setUserCode(accessLog.getAccessCode());
					page = "main";
					System.out.println("auth 231 = "+ user);
					this.util.setAttribute("userInfo", user);
					message = "로그인 성공";
				
				} else {
					this.tranManager.rollback();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		} finally {
			this.tranManager.tranEnd();
			user.setPage(page);
			user.setMessage(message);
		}

	}

	/* 아이디 중복체크 후 아이디 템프 테이블에 INS */
	private void idDupCheck(Model model) {
		String message = "중복된 아이디 있음";
		StoreBean store = (StoreBean) model.getAttribute("store");
		this.tranManager = this.getTransaction(true);

		try {
			this.tranManager.tranStart();
			/* 아이디 중복 체크 */
			store.setStoreEmail("NULL");
			if (!convertToBoolean(this.sqlSession.selectOne("tempDupChk", store))) {
				
				/* 겹치는 아이디가 없다면 템프 테이블 INS */
				if (this.convertToBoolean(this.sqlSession.insert("insIdTemp", store))) {
					this.tranManager.commit();
					message = null;
				
					// log.info("<{}>",convertToBoolean(this.sqlSession.insert("insTemp", store)));
				} else {
					this.tranManager.rollback();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		} finally {
			this.tranManager.tranEnd();
			store.setMessage(message);
		}

	}

	/* 회원가입 하는 메서드(Store table ins --> Temp Table del */
	private void insReg(ModelAndView mav) {
		this.tranManager = this.getTransaction(false);
		StoreBean store = (StoreBean) mav.getModel().get("store");

		String message = null;
		String page = "reg_Admin";
		try {
			this.tranManager.tranStart();
		
			
			System.out.println("insReg = "+ store);
			
			
			if (store.getStoreGrade().equals("1")) {
				store.setStoreCode("H" + store.getStoreCode());
			} else {
				store.setStoreCode("T" + store.getStoreCode());
			}
			
			
			try {
				/*
				 * String aesStrings1 = enc.aesEncode(store.getStoreId(),
				 * "HoongZzangvictoryWin!"); String aesStrings2 =
				 * enc.aesEncode(store.getStorePassword(), "HoongZzangvictoryWin!");
				 * store.setStoreId(aesStrings1); store.setStorePassword(aesStrings2);
				 */
				
				System.out.println("auth 263 : " + store);
				
			} catch (Exception e) {	e.printStackTrace();}
			
			
			if (convertToBoolean(this.sqlSession.insert("insReg", store))) {
				System.out.println("insReg");
			//	store.setStoreId(enc.aesDecode(store.getStoreId(), store.getEmailCode()));
				
				System.out.println(store);
				if (convertToBoolean(this.sqlSession.delete("delTemp", store))) {
					System.out.println("delTemp");
					this.tranManager.commit();
					page = "index";
					message = "회원가입 성공";
				
					this.util.removeAttribute("storeInfo");
				}
			} else {
				this.tranManager.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		} finally {

			this.tranManager.tranEnd();
			mav.setViewName(page);
			mav.addObject("message", message);
		}

	}
	
	private void stCodeDupcheck(Model model) {
		String message = "이미 가입 된 사업자 번호";
		StoreBean store = (StoreBean) model.getAttribute("store");
		this.tranManager = this.getTransaction(true);
		
		try {
			this.tranManager.tranStart();
			if(store.getStoreGrade().equals("1")) {
				store.setStoreCode("H"+store.getStoreCode());
			}else {
				store.setStoreCode("T"+store.getStoreCode());
			}
			if(!convertToBoolean(this.sqlSession.selectOne("dupStCode", store))) {
				message = null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		} finally {
			this.tranManager.tranEnd();
			store.setMessage(message);
		}
	}
	
	

	private void emailAuthCheckCtl(Model model) {

		StoreBean store = (StoreBean) model.getAttribute("store");
		String message = "이메일이 발송되었습니다. 확인해주세요";
		boolean result = false;

		/* ReceiverList 만들기 */
		ArrayList<String[]> receiverList = new ArrayList<String[]>();
		String[] receiver = { store.getStoreName(), store.getStoreEmail() };
		receiverList.add(receiver);

		String emailCode = this.email_Code();

		/* SEND MAIL : subject, content, sender, receiver */
		result = email
				.sendEmail(EmailBean.builder().sender("coding0314@naver.com").receiver(receiverList)
						.isHtml(true)
						.subject("[본인 인증] 이메일 인증을 절차에 따라 진행해 주세요")
						.contents("<H1>[SMART POS] 이메일 본인 인증</H1>"
								+ "<H3>아래의 인증코드를 시스템의 알림을 참고하여 수락하여 주시기 바랍니다.</H3><H2>인증코드 : " + emailCode + "</H2>")
						.build());
		

		if (result) {
			this.tranManager = this.getTransaction(false);
			this.tranManager.tranStart();
			store.setEmailCode(emailCode);

			

			if (convertToBoolean(this.sqlSession.update("insTempCode", store))) {
				
				this.tranManager.commit();
				message="이메일 전송 완료";

			
			}
		}else {
			this.tranManager.rollback();
			message = "이메일 주소를 확인해주세요.";
		}
		
		try {
			String storeJson = new Gson().toJson(store);
			this.util.setAttribute("storeInfo", storeJson);
		} catch (Exception e) {e.printStackTrace();}
		finally {
			this.tranManager.tranEnd();
		}
		store.setEmailCode(null);

		store.setMessage(message);
	}

	private void emailAccessCtl(Model model) {
		String message = null;
		System.out.println("emailAccessCtl");

		StoreBean store = (StoreBean) model.getAttribute("store");
		
		System.out.println("스토어 = " + store);
		if (store.getEmailCode() != null) {
		
			this.tranManager = this.getTransaction(true);
			this.tranManager.tranStart();
			if (convertToBoolean(this.sqlSession.selectOne("selEmailCode", store))) {
				message = "이메일 인증이 성공되었습니다.";
				System.out.println(message);
				try {
				
					String storeJson = new Gson().toJson(store);
					this.util.setAttribute("storeInfo", storeJson);
				
					
				} catch (Exception e) {e.printStackTrace();}
				finally {
					this.tranManager.tranEnd();
				}

			}
		}
		store.setEmailCode(null);
		store.setMessage(message);
	}

	

	private void naverLogin(ModelAndView mav) {
		UserBean user = (UserBean) mav.getModel().get("userInfo");
		String message = "Naver Login";
		String page = "index";

		user.setUserCode("N" + this.user_Code());

		/* Session에 BackEnd수행에 필요한 기본 자료 저장 */
		try {
			/* Transaction */
			this.tranManager = this.getTransaction(false);
			this.tranManager.tranStart();

			if (convertToBoolean(this.sqlSession.insert("insAPILogin", user))) {

				this.tranManager.commit();
				this.util.setAttribute("userInfo", user);

			}

			/* JWT 발행 및 Response에 적재 */
			JWTBean jwtBody = JWTBean.builder().userId(user.getUserId()).build();

			this.util.transferJWTByResponse(this.jwts.tokenIssuance(jwtBody, user.getUserId()));

			System.out.println("JWT =" + this.jwts.tokenIssuance(jwtBody, user.getUserId()));

			message = "login successful";
			page = "user/main";
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		this.tranManager.tranEnd();

		mav.setViewName(page);
		mav.addObject("message", message);
	}

	private String user_Code() {
		String ALPHABET = "adsnlvsaoiethpq24385960123845cpijqtlkjklasdf";
		Random RANDOM = new Random();

		int length = 10;
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			int randomIndex = RANDOM.nextInt(ALPHABET.length());
			char randomChar = ALPHABET.charAt(randomIndex);
			sb.append(randomChar);
		}
		return sb.toString();

	}

	private String email_Code() {
		String ALPHABET = "adsnlvsaoiethpq24385960123845cpijqtlkjklasdf";
		Random RANDOM = new Random();

		int length = 16;
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			int randomIndex = RANDOM.nextInt(ALPHABET.length());
			char randomChar = ALPHABET.charAt(randomIndex);
			sb.append(randomChar);
		}
		return sb.toString();

	}

	private void APIlogin(Model model) {
		UserBean user = (UserBean) model.getAttribute("user");
		String message = "false";

		try {
			this.tranManager = this.getTransaction(false);
			this.tranManager.tranStart();

			if (convertToBoolean(this.sqlSession.selectOne("isUser", user))) {

				message = "이미 가입되어 있습니다.";
			
				List<UserstBean> utList = this.sqlSession.selectList("getstcodeList3", user); 
				  ArrayList<UserstBean> stList = new ArrayList<UserstBean>(); 
				  stList.addAll(utList);
				  user.setStoreList(stList);
				  
				  List<UserstBean> reserve = this.sqlSession.selectList("getusPromotion", user);
				    user.getStoreList().clear();
				    
				    stList.addAll(reserve);
				    user.setStoreList(stList);
				    
				    System.out.println("main.jps = "+ user);
				    
				    this.util.setAttribute("userInfo", user);
			}

			else {
				this.kakaoLogin(model);
				// this.tranManager.commit();
				message = "api login";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		this.tranManager.tranEnd();

		user.setMessage(message);
	}

	private void kakaoLogin(Model model) {
		UserBean user = (UserBean) model.getAttribute("user");
		String message = "false";

	

		if (user.getAccessToken() != null) {
			user.setUserCode("K" + this.user_Code());
			 user.setUserBirth("00/03/14");
			 user.setUserPhone("01000000000");
			 user.setUserPassword("null");
		//	user.setUserBirth("910314");
		//	user.setUserPhone("01066248449");
			user.setUserName(user.getUserNickname());
		//	user.setUserPassword("12312312312");

			
			System.out.println("카카오 로그인 = "+ user);
			/* Session에 BackEnd수행에 필요한 기본 자료 저장 */
			try {
				/* Transaction */
				//this.tranManager = this.getTransaction(false);
				//this.tranManager.tranStart();

				if (convertToBoolean(this.sqlSession.insert("insAPILoginRe", user))) {
					System.out.println("480 : " + user);
					this.tranManager.commit();
					String userJson = new Gson().toJson(user);
					this.util.setAttribute("userInfo", userJson);
					/* JWT 발행 및 Response에 적재 */
					JWTBean jwtBody = JWTBean.builder().userId(user.getUserId()).build();

					this.util.transferJWTByResponse(this.jwts.tokenIssuance(jwtBody, user.getUserId()));
					System.out.println("JWT =" + this.jwts.tokenIssuance(jwtBody, user.getUserId()));
				}else {
					message = "로그인이 실패하였습니다.";
				}

			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//this.tranManager.tranEnd();
			}
		}user.setMessage(message);
	}

	/* boolean 변환 */
	protected boolean convertToBoolean(int value) {
		return value > 0 ? true : false;
	}

	/*
	 * private String getUserData() { UserBean userInfo = null; String result =
	 * null; try {
	 * 
	 * userInfo = (UserBean)this.util.getAttribute("user"); result = new
	 * ObjectMapper().writeValueAsString( ServerData.builder()
	 * 
	 * 
	 * .build()); } catch(Exception e) {e.printStackTrace();}
	 * 
	 * return result; }
	 */

}
