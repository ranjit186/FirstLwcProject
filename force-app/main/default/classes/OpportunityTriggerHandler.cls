public class OpportunityTriggerHandler {
    public static void afterInsertOpportunity(List<opportunity> newReacords){
        
        set<id> accountsId = new set<id>();
        set<Id>opportunityIds = new set<id>();
        for(Opportunity each :newReacords){
            accountsId.add(each.AccountId);
            opportunityIds.add(each.Id);
        }
        system.debug('accountsId : '+accountsId + 'size :'+ accountsId.size());
        if(accountsId != null){
             List<Contact> getContactList = [SELECT Id, Name, AccountId FROM Contact where  AccountId IN :accountsId And AccountId != NULL];
        
            
        List<OpportunityContactRole> oportunitContactRoleList = new List<OpportunityContactRole>();
        
        for(Id oppId : opportunityIds){
            for(Contact item : getContactList){
                
                system.debug('getContactList item: '+ item);
                OpportunityContactRole oppoConRole = new OpportunityContactRole();
                oppoConRole.ContactId = item.Id;
                oppoConRole.OpportunityId = oppId;
                oportunitContactRoleList.add(oppoConRole);
            }
        }
        
        insert oportunitContactRoleList;
        }
       
    }
    
    public static void afterUpdateOpportunity(List<Opportunity> oldReacords, Map<Id, Opportunity> oldMapReacords, List<Opportunity> newReacord, Map<Id, Opportunity> newMapReacords){
        system.debug('oldReacords : '+oldReacords);
         system.debug('oldMapReacords : '+oldMapReacords);
         system.debug('newReacord : '+newReacord);
         system.debug('newMapReacords : '+newMapReacords);
    }
}