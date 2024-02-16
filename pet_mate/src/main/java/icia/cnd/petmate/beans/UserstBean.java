package icia.cnd.petmate.beans;

import java.util.ArrayList;

import lombok.Data;

@Data
public class UserstBean {

	
	
	private String stCode;
	private String stName;
	private String stAddress;
	private String stEmail;
	private String stPhone;
	private String staddCode;
	private String staddTitle;
	private String staddSubTitle;
	private String staddContent;
	private String staddImages;
	
	private ArrayList<IstimeBean> timeList;
}
