trigger triggerOpportunity on Opportunity (before insert, after insert,  after update) {
	
    switch on trigger.operationType{
        when AFTER_INSERT{
            //OpportunityTriggerHandler.afterInsertOpportunity(trigger.new);
            ClassHandlerForOppTrigger.AfterInsertCloneOpportunity(trigger.new);
        }
        when AFTER_UPDATE{
            //OpportunityTriggerHandler.afterUpdateOpportunity(trigger.old, trigger.oldMap, trigger.new, trigger.newMap);
            
            ClassHandlerForOppTrigger.AfterUpdateCloneOpportunity(trigger.new, trigger.oldMap);
        }
      
    }
}