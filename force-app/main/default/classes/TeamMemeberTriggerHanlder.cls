public class TeamMemeberTriggerHanlder {
    public static void checkTeamAllocation(List<Team_Member__c> TeamList){
        set<Id> listContact = new Set<id>();
        for(Team_Member__c tm: TeamList){
            listContact.add(tm.Contact__c);
        }
        Map<Id,List<Team_Member__c>> mapContToTmMem = New Map<Id,List<Team_Member__c>>();
        if(!listContact.isEmpty()){
			List<contact> conList = [SELECT Id, (SELECT Id, Allocation_to_Team__c FROM Team_Members__r) FROM contact WHERE Id IN :listContact];
			
            
        }
    }
    
}