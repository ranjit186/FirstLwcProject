public with sharing class CTPersonTriggerHandler {
    public static void beforeInsert(List<Person__c> newReacord) {
        for(Person__c person : newReacord){
            person.Health_Status__c  = 'Green';
            person.Mobile__c = CTPersonController.getToken(person.Mobile__c);
        }
    }

    public static void beforeUpdate(List<Person__c> newUpdateRec, Map<Id, Person__c> oldPersonMap){
        for(Person__c each : newUpdateRec){
           if(each.Health_Status__c != oldPersonMap.get(each.id).Health_Status__c){
             each.Status_Update_Date__c = Date.Today();  
           } 
        }
    }

    public static void afterUpdate(List<Person__c> newUpdateRec, Map<Id, Person__c> oldPersonMap){
        set<Id> statusChange = new set<Id>();
        set<Id> redStatus = new set<Id>();
        for(Person__c each : newUpdateRec){
           if(each.Health_Status__c != oldPersonMap.get(each.id).Health_Status__c){
            statusChange.add(each.id);
           } 
           if(each.Health_Status__c == 'Red' && oldPersonMap.get(each.id).Health_Status__c != 'Red'){
            redStatus.add(each.id);
            } 
        }
        Set<id> alreadyProcessed = new Set<id>();
        alreadyProcessed.addAll(redStatus);
        Set<Id> orangeStatus = new Set<Id>();
        Set<Id> yellowStatus = new Set<Id>();

        List<Person__c> personToUpdate = new List<Person__c>();


        orangeStatus.addAll(CTPersonController.getCohabitants(redStatus, alreadyProcessed));
       
        Set<Id> PrimaryContacts = CTPersonController.getprimaryPerson(redStatus, alreadyProcessed);
        orangeStatus.addAll(PrimaryContacts);

        yellowStatus.addAll(CTPersonController.getNeighbours(redStatus, alreadyProcessed));

        yellowStatus.addAll(CTPersonController.getSecondaryContact(redStatus, alreadyProcessed));

        for (Id pid : orangeStatus) {
            personToUpdate.add(new Person__c(Id=pid, Health_Status__c = 'Orange'));
        }

        for (id pid : yellowStatus) {
            personToUpdate.add(new Person__c(Id = pid, Health_Status__c = 'Yellow'));
        }

        if(personToUpdate.size() > 0){
            Update personToUpdate;
        }

        List<Location_Tracing__c> LocationTraces = CTLocationTracingController.getLocationByPersonIds(statusChange);
        if (LocationTraces != null && LocationTraces.size() > 0) {
            set<Id> locationIds = new set<Id>();
            for (Location_Tracing__c traces : LocationTraces) {
                locationIds.add(traces.Location__c);
            }
            CTLoactionController.updateRedScore(locationIds);
        }
    }
}