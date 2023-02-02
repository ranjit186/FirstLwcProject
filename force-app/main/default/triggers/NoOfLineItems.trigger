trigger NoOfLineItems on OpportunityLineItem (after insert) {
    
    List<Account> updateNumberofLineofItem = new List<Account>();
    String opportunityid = '';
    for(OpportunityLineItem each: Trigger.new){
        opportunityid = each.OpportunityId;
    }
    
    AggregateResult[] getLineItems = [SELECT  Opportunity.accountId accId, Count(id) noOfLineItem
                                      FROM OpportunityLineItem Where OpportunityId =: opportunityid
                                      GROUP BY Opportunity.accountId];
    
    for(AggregateResult eachData: getLineItems){
        
        Account acc = new Account();
        acc.Id = (String)eachData.get('accId');
        acc.Number_Of_LineItems__c = (Integer)eachData.get('noOfLineItem');
        
        updateNumberofLineofItem.add(acc);
        system.debug('acc: '+acc);
        
    }
    
    
    system.debug('updateNumberofLineofItem: '+ updateNumberofLineofItem);
    update updateNumberofLineofItem;
}