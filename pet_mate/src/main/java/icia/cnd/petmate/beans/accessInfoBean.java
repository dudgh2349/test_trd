package icia.cnd.petmate.beans;

import lombok.Data;

@Data
public class accessInfoBean {

	
	private String accessId;   //userId & storeId
	private String accessCode; //userCode & storeCode
	private String accessEmail;
	private String accessAddress; // 사업자 주소
	private String accessNickname; // 
	
	
}
