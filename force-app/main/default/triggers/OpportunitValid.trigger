trigger OpportunitValid on Opportunity (before insert, before Update) {
    
    switch on trigger.operationType{
        when BEFORE_UPDATE{
            for(Opportunity eachOpp :  Trigger.new){
                system.debug('get data befor updated : ' + eachOpp);
                if((eachOpp.StageName == 'Closed Won')
                   && eachOpp.TotalOpportunityQuantity == 0){
                    eachOpp.StageName.addError('you can not closed without No OpportunityLineItem');
                }
               
            }
        }
    }
    
}