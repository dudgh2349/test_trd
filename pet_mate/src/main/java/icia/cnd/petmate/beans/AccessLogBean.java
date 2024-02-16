package icia.cnd.petmate.beans;

import lombok.Data;

@Data
public class AccessLogBean {
	private String accessDate; //sysdate
	private int accessType; //0 1
	private String accessCode; //userCode,storeCode
	
}
