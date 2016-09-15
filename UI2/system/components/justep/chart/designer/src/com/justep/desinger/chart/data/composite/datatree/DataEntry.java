package com.justep.desinger.chart.data.composite.datatree;

public class DataEntry {
	
	private Team team;
	
	private String type;
	private String param1;   //ref             								   //label
	private String param2;   //title		   //href			//				//lower
	private String param3;	 //categoryAxis    //hrefModel						//upper
	private String param4;	 //numberAxis      //hrefTitle		//startDate		//bgc
	private String param5;	 //color							//endDate		//oc
	private String param6;										//color			//os
	
	public DataEntry(String type ,String param1 ,String param2, String param3 ,String param4 ,String param5,String param6) {
		this.type = type;
		this.param1 = param1;
		this.param2 = param2;
		this.param3 = param3;
		this.param4 = param4;
		this.param5 = param5;
		this.param6 = param6;
	}
	
	public void setTeam(Team team) {
		this.team = team;
	}
	
	public Team getTeam() {
		return team;
	}

	public String getParam1() {
		return param1;
	}

	public void setParam1(String param1) {
		this.param1 = param1;
	}

	public String getParam2() {
		return param2;
	}

	public void setParam2(String param2) {
		this.param2 = param2;
	}

	public String getParam3() {
		return param3;
	}

	public void setParam3(String param3) {
		this.param3 = param3;
	}

	public String getParam4() {
		return param4;
	}

	public void setParam4(String param4) {
		this.param4 = param4;
	}

	public String getParam5() {
		return param5;
	}

	public void setParam5(String param5) {
		this.param5 = param5;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getParam6() {
		return param6;
	}

	public void setParam6(String param6) {
		this.param6 = param6;
	}
	
	
}