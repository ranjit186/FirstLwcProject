public with sharing class CTPeopleTracingTriggerHandler {
    public static void beforeInsert(List<People_Tracing__c> newReacords){
        List<People_tracing__c> duplicates = CTPeopleTracingController.checkDuplicates(newReacords);
        System.debug('duplicate data:  '+ duplicates);
        for (People_Tracing__c trace : duplicates) {
            trace.addError('duplicate record found. Person 1 ' + trace.Person_1__c + ' person 2 '+ trace.Person_2__c);
        }
    }
}