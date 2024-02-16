package icia.cnd.petmate.beans;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImagesBean {
	
	private String imageCode;
	private String imageLocation;
	private ArrayList<FileBean> fileList;
	
}
