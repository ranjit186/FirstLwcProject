public class OpportunityContactRoleHandler {
    public static void BeforeInsertOpportunityContactRole(List<OpportunityContactRole> newReacords){
        try{
        set<id> OpportunityIds = new set<id>();
        for(OpportunityContactRole eachItem : newReacords){
            system.debug('eachItem :'+ eachItem);
            OpportunityIds.add(eachItem.OpportunityId);
        }
        
        List<opportunity> getAllData = [select id, Name, 
                                        (select Id from opportunityLineItems), 
                                        (select id from opportunityContactRoles) from opportunity 
                                        where id IN:OpportunityIds And (StageName = 'Qualification' OR StageName = 'Prospecting')];
        
        if(getAllData.size() > 0){
            for(Opportunity eachItem : getAllData){
                system.debug('eachItem :'+ eachItem.opportunityLineItems.size());
                if(eachItem.opportunityLineItems.size() > 2){
                    system.debug('opportunityContactRoles : ' + eachItem.opportunityContactRoles + 'size : ' +eachItem.opportunityContactRoles.size() );
                    if(eachItem.opportunityContactRoles.size() > 2){
                        
                        for(opportunityContactRole roleItem :eachItem.opportunityContactRoles){
                            roleItem.addError('Please enter a only upto 2 contact role');
                        } 
                    }
                }
            }
        }
        
        }
        catch(Exception e){
            system.debug('message :' + e.getMessage() + 'at' + e.getLineNumber());
        }
    
    }
}