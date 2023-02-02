trigger CTPeopleTracingTrigger on People_Tracing__c (before insert, after insert, before update, after update) {
        switch on Trigger.OperationType {
            when BEFORE_INSERT {
                System.debug('Start Trigger  '+ Trigger.new);
                CTPeopleTracingTriggerHandler.beforeInsert(Trigger.new);
            }
            
        }
}