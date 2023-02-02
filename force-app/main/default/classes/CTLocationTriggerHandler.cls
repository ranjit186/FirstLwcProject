public with sharing class CTLocationTriggerHandler {
    public  static void beforeInsert(List<Location__c> newReacords){
        for (Location__c location : newReacords) {
            location.Status__c = 'Green';
        }
    }

    public static void beforeUpdate(List<Location__c> newReacords, Map<Id, Location__c> oldReacord){
            for (Location__c location : newReacords) {
                if(location.Status__c != oldReacord.get(location.Id).Status__c){
                    location.Status_Update_Date__c = Date.today();
                }
            }
    }

    public static void afterUpdate(List<Location__c> newReacords, Map<Id, Location__c> oldReacord){

        set<id> statusChange = new set<Id>();

        for (Location__c location : newReacords) {
            if(location.Status__c == 'Red' && oldReacord.get(location.Id).Status__c != 'Red'){
                statusChange.add(location.Id);
            }
        }

        List<Location_Tracing__c> locationTraces = CTLocationTracingController.getLoactionByLocationIds(statusChange);

        set<Id> personIds  = new Set<Id>();

        for (Location_Tracing__c traces : locationTraces) {
            personIds.add(traces.Person__c);
        }

        List<Person__c> peopleToUpdate = new List<Person__c>();

        for (Id pid : personIds) {
            peopleToUpdate.add(new Person__c(Id = pid, Health_Status__c = 'Yellow'));
        }

        if(peopleToUpdate.size() > 0){
            Update peopleToUpdate;
        }
    }
}