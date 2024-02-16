package icia.cnd.petmate.services.page;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import icia.cnd.petmate.beans.BoardBean;
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
public class Board extends TransactionAssistant {
	@Autowired
	private Encryption enc;
	@Autowired
	private ProjectUtils util;
	@Autowired
	private JsonWebTokenService jwts;
	@Autowired
	private EmailService email;
	private SimpleTransactionManager tranManager;

	public Board() {
	}

	/* Ajax 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, Model model) {
		switch (serviceCode) {
		case "B25":
			this.insuserBoard(model);
			break;
		case "B15":
			this.insBoard(model);
			break;
		case "B17":
			this.insBoardCommit(model);
			break;
		case "B18":
			this.delBoardCommit(model);
			break;

		}
	}

	/* View 방식의 요청 컨트롤러 */
	public void backController(String serviceCode, ModelAndView mav) {
		switch (serviceCode) {
		case "B11":
			this.moveboardPage(mav);
			break;
		case "B12":
			this.moveShowBoard(mav);
			break;
		case "B14":
			this.moveinsBoard(mav);
			break;
		case "B16":
			this.cancelBoardpage(mav);
			break;
		case "BL0":
			this.boardListCtl(mav);
			break;
		case "BL1":
			this.boardSCtl(mav);
			break;

		}
	}

	private void insuserBoard(Model model) {
		System.out.println("back : 91" + model);
		String message = null;
		UserBean user = (UserBean) model.getAttribute("user");
		this.tranManager = this.getTransaction(false);

		try {
			this.tranManager.tranStart();
			if (this.convertToBoolean(this.sqlSession.insert("insBoardB", user))) {
				this.tranManager.commit();
				System.out.println("성공");
				message = "글 등록 성공";
			}else {
				System.out.println("실패");
				this.tranManager.rollback(); message = "네트워크 오류";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		}finally {
			this.tranManager.tranEnd();
			user.setMessage(message);
			model.addAttribute("userInfo", user);
		}
	}
	
	private void insBoard(Model model) {
		System.out.println("back" + model);
		StoreBean storeInfo = new StoreBean();
		this.tranManager = this.getTransaction(false);
		BoardBean board = (BoardBean) model.getAttribute("board");
		String message = null;
		board.setImages("12345");
		try {
			this.tranManager.tranStart();
			ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
			storeInfo = (StoreBean) this.util.getAttribute("storeInfo");
			boardList.add(board);
			storeInfo.setBoardList(boardList);
			if (this.convertToBoolean(this.sqlSession.insert("insBoardA", storeInfo))) {
				this.tranManager.commit();
				message = "글 등록 성공";
			} else {
				this.tranManager.rollback();
				message = "네트워크 오류";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		} finally {
			this.tranManager.tranEnd();
			storeInfo.setMessage(message);
			model.addAttribute("store", storeInfo);
		}

	}

	private void insBoardCommit(Model model) {

	}

	private void delBoardCommit(Model model) {

	}

	private void moveboardPage(ModelAndView mav) {

	}

	private void moveShowBoard(ModelAndView mav) {

	}

	private void moveinsBoard(ModelAndView mav) {

	}

	private void cancelBoardpage(ModelAndView mav) {

	}

	private void boardListCtl(ModelAndView mav) {
		String page = null;
		String message = null;
		BoardBean board = new BoardBean();
		
		List<BoardBean> boardList = this.sqlSession.selectList("boardList");
		for(int i = 0; i<boardList.size(); i++) {
		boardList.get(i);
		}
		mav.addObject("board", boardList);
		mav.setViewName("board_Free");
		mav.addObject("message", message);
	}
	
	private void boardSCtl(ModelAndView mav) {
		String page = null;
		String message = null;
		List<BoardBean> boardList = null;
		
		try {
			System.out.println(this.util.getAttribute("userInfo"));
			if(this.util.getAttribute("userInfo") != null) {
				page = "board_write";
				System.out.println("ㅇㅇ");
			}else {
				BoardBean board = new BoardBean();
				
				boardList = this.sqlSession.selectList("boardList");
				for(int i = 0; i<boardList.size(); i++) {
				boardList.get(i);
				}
				page = "board_Free";
				message = "권한이 없습니다";
				System.out.println(" ㄴㄴ");
			}
//			this.util.getAttribute("storeInfo");
//			this.util.getAttribute("userInfo");
		} catch (Exception e) {
			e.printStackTrace();
			message = "네트워크 오류:네트워크가 불안정합니다.잠시 후 다시 시도해주세요";
		}
		
		System.out.println(page);
		mav.addObject("board", boardList);
		mav.setViewName(page);
		mav.addObject("message", message);
		
	}

	protected boolean convertToBoolean(int value) {
		return value > 0 ? true : false;
	}

}
