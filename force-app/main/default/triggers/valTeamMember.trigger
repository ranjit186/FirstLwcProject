trigger valTeamMember on Team_Member__c (after insert, after update) {
	List<Team_Member__c> teamList = new List<Team_Member__c>();
    
    for(Team_Member__c each: trigger.new){
        teamList.add(each);
    }
    if(!teamList.isEmpty()){
        TeamMemeberTriggerHanlder.checkTeamAllocation(teamList);
    }
}