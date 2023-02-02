trigger NumberOfProductsSold on Opportunity (after update) {
        
    set<id> oppoId = new set<Id>();
    for(Opportunity each : trigger.new){
        oppoId.add(each.Id);
    }
    List<Opportunity> oppLineItems = [SELECT Id, Name, AccountId ,
                                              (SELECT name FROM opportunityLineItems)
                                              FROM Opportunity WHERE Id IN:oppoId ];
    List<Account> accUpdate = new List<Account>();
    for(Opportunity eachData: oppLineItems){
        Account upAcc = new Account();
        upAcc.Id = eachData.AccountId;
        upAcc.Number_of_Products__c = eachData.opportunityLineItems.size();
        
        
        accUpdate.add(upAcc);
    }
    update accUpdate;
}