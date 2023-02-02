public with sharing class CTLocationTracingController {
    public static List<Location_Tracing__c> getVisitors(String locationId){
        List<Location_Tracing__c> locationTracingGet = 
        [SELECT Id, Name, Person__c, Location__c, Visit_Date__c, Person__r.Health_Status__c, Person__r.Token__c
         FROM Location_Tracing__c 
         WHERE Id =: locationId
         ORDER BY Visit_Date__c DESC NULLS Last];

         return locationTracingGet;
    }

    public static List<Location_Tracing__c> getLocationByPersonIds(Set<Id> personIds){
       // personId = personId + '%';
        List<Location_Tracing__c> matchPerson = [SELECT Id, Name, Person__c, Location__c, Visit_Date__c
        FROM Location_Tracing__c 
        WHERE Person__c  IN:personIds
        AND Visit_Date__c =  LAST_N_DAYS:10 ];

        return matchPerson;
    }

    public static List<Location_Tracing__c> getLoactionByLocationIds(Set<Id> locationId){
        List<Location_Tracing__c> locationIdmatchData =
         [SELECT Id, Name, Person__c, Location__c, Visit_Date__c, Person__r.Health_Status__c
        FROM Location_Tracing__c 
        WHERE Location__c  IN:locationId 
        AND Person__r.Health_Status__c = 'Green'
        AND Visit_Date__c =  LAST_N_DAYS:10
        ];

        return locationIdmatchData;
    }

    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newLocationTraces){
      Set<Id> locationIds = new set<Id>();
      set<Id> personIds = new set<id>();

      for (Location_Tracing__c traces : newLocationTraces) {
        locationIds.add(traces.Location__c);
        personIds.add(traces.Person__c);
      }

      Map<Id, Set<Id>> mapOfExistingrecord = new Map<Id, Set<Id>>();

      // query existing tracing records
     List<Location_Tracing__c> existingRecord = [SELECT Id, Person__c, Location__c
      FROM Location_Tracing__c 
      WHERE Location__c  IN:locationIds 
      AND  Person__c IN :personIds];

      // list of duplicate records
      List<Location_Tracing__c>duplicates = new List<Location_Tracing__c>();

      if (existingRecord != null && existingRecord.size() > 0) {
          for(Location_Tracing__c trace : existingRecord){
            if(!  mapOfExistingrecord.containsKey(trace.Location__c)){
                mapOfExistingrecord.put(trace.Location__c, new Set<Id>());
            }
            mapOfExistingrecord.get(trace.Location__c).add(trace.Person__c);
          }

          // loop over new location tracing reacord

          for (Location_Tracing__c trace : newLocationTraces) {
              // first check for locationid
              //if item found in map, then check for person in set
              if(mapOfExistingrecord.containsKey(trace.Location__c) 
              && mapOfExistingrecord.get(trace.Location__c).contains(trace.Person__c)){
                duplicates.add(trace);
              }
          }
      }



      return duplicates;
    }
}