package icia.cnd.petmate.beans;

import java.util.ArrayList;

import lombok.Data;

@Data
public class StoreBean {
	private String storeCode;
	private String storeId;
	private String storeName;
	private String storeGrade;
	private String storePassword;
	private String storeEmail;
	private String storePhone;
	private String storeAddress;
	private String storePlace;
	private String emailCode;
	private String message;
	
	private ArrayList<BoardBean> boardList;
	private ArrayList<PromotionBean> addList;
	private ArrayList<ImagesBean> imageList;
	private ArrayList<ReserveBean> reserveList;
	private ArrayList<IstimeBean> timeList;
	private ArrayList<UserstBean> usStList;
	private ArrayList<ReserveResultBean> reResultList;
}
