package icia.cnd.petmate.beans;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserBean {
	private String userCode;
	private String userId;
	private String userEmail;
	private String userNickname;
	private String userName;
	private String userBirth;
	private String userPhone;
	private String userPassword;
	private String accessToken;
	private String message;
	private String page;
	
	private ArrayList<PetBean> petInfoList;
	private ArrayList<BoardBean> boardList;
	private ArrayList<AccessLogBean> accessList;
	private ArrayList<PromotionBean> promotionList;
	private ArrayList<UserstBean> storeList;
	
	
}

