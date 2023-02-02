public with sharing class CTPeopleTracingController {
  public static List<People_tracing__c> getTraces(String recordId){
      List<People_tracing__c> peopleTracingReacord = 
      [SELECT Id,  Contact_Date__c, Person_1__c, Person_1__r.Health_Status__c,Person_1__r.Token__c,
      Person_2__c , Person_2__r.Health_Status__c, Person_2__r.Token__c
      FROM People_Tracing__c 
      WHERE Person_1__c = : recordId OR Person_2__c =: recordId
      ORDER BY Contact_Date__c DESC];

      System.debug(peopleTracingReacord);
      return peopleTracingReacord;
  }

  public static List<People_tracing__c> checkDuplicates(List<People_tracing__c> newPeopleTraces){
      // unique person ids
    set<Id> personIds = new  set<Id>();
    for (People_tracing__c eachTrace : newPeopleTraces) {
        personIds.add(eachTrace.Person_1__c);
        personIds.add(eachTrace.Person_2__c);
    }

    //List duplicates  reacords
    List<People_tracing__c> duplicates = new List<People_tracing__c>();

    //map id and set<id>
Map<Id, Set<Id>> mapOfExistingrecord = new Map<Id, Set<Id>>();

//query existing reacords
    List<People_Tracing__c> existingRecord = [SELECT Id, Person_1__c, Person_2__c 
                                        FROM People_Tracing__c
                                        WHERE Person_1__c IN :personIds
                                        Or Person_2__c IN :personIds];

    if(existingRecord != null && existingRecord.size() > 0){
        for (People_Tracing__c trace : existingRecord) {
                if (! mapOfExistingrecord.containsKey(trace.Person_1__c)) {
                    mapOfExistingrecord.put(trace.Person_1__c, new Set<Id>());
                }
                mapOfExistingrecord.get(trace.Person_1__c).add(trace.Person_2__c);
            
                //build map for person 2

                if(! mapOfExistingrecord.containsKey(trace.Person_2__c)){
                    mapOfExistingrecord.put(trace.Person_2__c, new Set<Id>());
                }
                mapOfExistingrecord.get(trace.Person_2__c).add(trace.Person_1__c);
        }

        // loop over existing records to find duplicates
        for (People_Tracing__c eachData : newPeopleTraces) {
            // check for duplicate in map
            if(
               ( mapOfExistingrecord.containsKey(eachData.Person_1__c) && 
            mapOfExistingrecord.get(eachData.Person_1__c).contains(eachData.Person_2__c))
            ||
            (mapOfExistingrecord.containsKey(eachData.Person_2__c) &&
             mapOfExistingrecord.get(eachData.Person_2__c).contains(eachData.Person_1__c))
            )
            {
                duplicates.add(eachData);
            }
        }
    }
    System.debug('return : ' +duplicates);
    return duplicates;
  }
}