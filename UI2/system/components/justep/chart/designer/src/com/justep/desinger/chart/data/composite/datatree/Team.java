package com.justep.desinger.chart.data.composite.datatree;

import java.util.ArrayList;

public class Team {

	private String id;
	private ArrayList<DataEntry> dataEntrys = new ArrayList<DataEntry>();

	public Team() {}
	
	public boolean add(DataEntry dataEntry) {
		boolean added = dataEntrys.add(dataEntry);
		if (added){
			dataEntry.setTeam(this);
		}
		return added;
	}

	public void updateData(String dataRef ,String dataTitle ,String dataCategoryAxis, String dataNumberAxis ,String dataColor){
		for(int i=0; i<dataEntrys.size(); i++){
			DataEntry entry = dataEntrys.get(i);
			if(entry.getType().equals("data")){
				entry.setParam1(dataRef);
				entry.setParam2(dataTitle);
				entry.setParam3(dataCategoryAxis);
				entry.setParam4(dataNumberAxis);
				entry.setParam5(dataColor);			
			}
		}
	}
	
	public void updateLink(String dataRef ,String href, String hrefModel , String hrefTitle){
		for(int i=0; i<dataEntrys.size(); i++){
			DataEntry entry = dataEntrys.get(i);
			if(entry.getType().equals("link")){
				entry.setParam1(dataRef);
				entry.setParam2(href);
				entry.setParam3(hrefModel);
				entry.setParam4(hrefTitle);
				entry.setParam5("");			
			}
		}
	}
	
	
	public void updateDataByGantt(String dataRef ,String dataTitle ,String dataCategoryAxis, String startDate ,String endDate , String dataColor){
		for(int i=0; i<dataEntrys.size(); i++){
			DataEntry entry = dataEntrys.get(i);
			if(entry.getType().equals("data")){
				entry.setParam1(dataRef);
				entry.setParam2(dataTitle);
				entry.setParam3(dataCategoryAxis);
				entry.setParam4(startDate);
				entry.setParam5(endDate);
				entry.setParam6(dataColor);			
			}
		}
	}
	
	public void updateDataBySimpleMeter(String label ,String lower ,String upper, String bgc ,String oc , String os){
		for(int i=0; i<dataEntrys.size(); i++){
			DataEntry entry = dataEntrys.get(i);
			if(entry.getType().equals("simple-interval")){
				entry.setParam1(label);
				entry.setParam2(lower);
				entry.setParam3(upper);
				entry.setParam4(bgc);
				entry.setParam5(oc);
				entry.setParam6(os);			
			}
		}
	}
	
	
	public void updateDataByDialMeter(String lower ,String upper, String c ){
		for(int i=0; i<dataEntrys.size(); i++){
			DataEntry entry = dataEntrys.get(i);
			if(entry.getType().equals("dial-rangle")){
				entry.setParam1(lower);
				entry.setParam2(upper);
				entry.setParam3(c);
			}
		}
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ArrayList<DataEntry> getDataEntrys() {
		return dataEntrys;
	}

	public void setDataEntrys(ArrayList<DataEntry> dataEntrys) {
		this.dataEntrys = dataEntrys;
	}

	
	
}