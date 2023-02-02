trigger AssignAllcontactRole on Opportunity (after insert) {
    switch on trigger.operationType{
        when AFTER_INSERT{
            List<OpportunityContactRole> setOpporContactRole = new List<OpportunityContactRole>();
            for(Opportunity each : Trigger.new){
                List<Contact>  getContactData =
                    [SELECT Id, AccountId, Name FROM Contact where  AccountId =: each.AccountId];
                
                for(Contact cont: getContactData){
                    OpportunityContactRole newConRole = new OpportunityContactRole();
                    newConRole.ContactId = cont.Id;
                    newConRole.OpportunityId = each.Id;
                   setOpporContactRole.add(newConRole); 
                }
                
            }
            system.debug('setOpporContactRole: ' + setOpporContactRole);
            insert setOpporContactRole;
        }
    }
}