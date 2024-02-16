package icia.cnd.petmate.beans;

import java.util.ArrayList;

import lombok.Data;

@Data
public class PromotionBean {
	private String addCode;
	private String addTitle;
	private String addSubTitle;
	private String addContent;
	private String addPrice;
	private String addImages;
	private String addDate;
		
	
	private ArrayList<DetailPromotionBean> dtPromotion;
	private ArrayList<ReserveBean> addReserveList;
}
