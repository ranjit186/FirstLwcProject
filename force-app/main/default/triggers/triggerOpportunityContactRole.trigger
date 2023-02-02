trigger triggerOpportunityContactRole on OpportunityContactRole (after insert, before update) {
    switch on Trigger.OperationType{
        when AFTER_INSERT{
            OpportunityContactRoleHandler.BeforeInsertOpportunityContactRole(trigger.new);
        }
    }
}