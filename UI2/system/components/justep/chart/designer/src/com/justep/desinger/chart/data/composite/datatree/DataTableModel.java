package com.justep.desinger.chart.data.composite.datatree;

import java.util.ArrayList;

public class DataTableModel {

	public ArrayList<Team> teamList = new ArrayList<Team>();

	public DataTableModel() {
		/*teams = new Team[3];
		
		teams[0] = new Team();
		teams[0].setId("1");

		teams[0].add(new DataEntry("data", "s1" ,"96年", "aaa", "bbb", "#FFFFFF"));
		teams[0].add(new DataEntry("link", "s1" ,"window", "明细-{}", "/SA/A?a=b", ""));

		teams[1] = new Team();
		teams[1].setId("2");
		teams[1].add(new DataEntry("data", "s1", "97年", "aaa", "bbb", "#FFFFFF"));
		teams[1].add(new DataEntry("link", "s1" ,"window", "明细-{}", "/SA/A?a=b", ""));

		teams[2] = new Team();
		teams[2].setId("3");
		teams[2].add(new DataEntry("data", "s1", "98年", "aaa", "bbb", "#FFFFFF"));
		teams[2].add(new DataEntry("link", "s1" ,"window", "明细-{}", "/SA/A?a=b", ""));*/
	}

	public Team findTeam(String teamId){
		Team temp = null;
		for(int i=0; i<teamList.size(); i++){
			if(teamList.get(i).getId().equals(teamId)){
				temp = teamList.get(i);
				break;
			}
		}
		return temp;
	}

	public ArrayList<Team> getTeamList() {
		return teamList;
	}

	public void setTeamList(ArrayList<Team> teamList) {
		this.teamList = teamList;
	}
	
	
}