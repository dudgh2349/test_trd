package icia.cnd.petmate.beans;

import java.util.ArrayList;

import lombok.Data;

@Data
public class PetBean {
	private String petCode;
	private String petName;
	private String petBirth;
	private String petGender;
	private String petNote;
	private String petSpecies;
	private ArrayList<HealthBean> healthList;
	
}
