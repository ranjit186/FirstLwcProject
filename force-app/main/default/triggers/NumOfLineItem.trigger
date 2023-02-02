trigger NumOfLineItem on Opportunity (before Update) {
        
   set<Id> OpprId = new set<Id>();
    
    for(Opportunity each :trigger.old){
        OpprId.add(each.id);
    }
    
    List<opportunity> getData = [SELECT Id, AccountId, (SELECT Id FROM OpportunityLineItems) FROM Opportunity Where Id IN: OpprId];
    
    List<Account> updateAcc = new List<Account>();
    
    for(opportunity eachData: getData){
        Account acc =  new Account();
        acc.Id = eachData.AccountId;
        acc.No_of_opportunity_line_Item__c = eachData.OpportunityLineItems.size();
        
        updateAcc.add(acc);
    }
    update updateAcc;
}