trigger CTPersonTrigger on Person__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    switch on trigger.operationType{
        when BEFORE_INSERT{
            CTPersonTriggerHandler.beforeInsert(Trigger.new);
            }

        when BEFORE_UPDATE{
            CTPersonTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
             }

        when AFTER_UPDATE{
            CTPersonTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }

}