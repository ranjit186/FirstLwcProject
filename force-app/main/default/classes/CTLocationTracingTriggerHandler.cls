public with sharing class CTLocationTracingTriggerHandler {
    public static void beforeInsert(List<Location_Tracing__c> newReacords){
        List<Location_Tracing__c> duplicates = CTLocationTracingController.checkDuplicates(newReacords);
        for (Location_Tracing__c locationTrace : duplicates) {
            locationTrace.addError('duplicate record found.Location Id' + locationTrace.Location__c + ' Person Id: ' + locationTrace.Person__c);
        }
    }
}