trigger triggerCustomerLocation on Customer_Location__c (after insert, after update) {
   /* switch on Trigger.operationType{
        when AFTER_INSERT{
            CustomerLoactionHandler.afterInsertChanges(trigger.new);
        }
        when AFTER_UPDATE{
            CustomerLoactionHandler.afterInsertChanges(trigger.new);
        } 
    }*/
}