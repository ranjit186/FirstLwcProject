public with sharing class CTPersonController {
    public static String getToken(String mobileNo){
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);
        
        // get the string value of hash blob
        return EncodingUtil.base64Encode(hash);
    } 

    public static List<Person__c> getRecentHealthChanges(){
        List<Person__c> personData = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
         FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
        // System.debug(personData);
        return personData;
    }

    public static List<Person__c> searchPeople(String searchTerm){

        searchTerm = searchTerm + '%';

        List<Person__c> searchedPersonData = 
        [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
        FROM Person__c 
        WHERE Name LIKE :searchTerm
             OR Mobile__c LIKE :searchTerm 
             OR Token__c LIKE :searchTerm 
        ORDER BY Status_Update_Date__c
        DESC NULLS LAST ];
        System.debug(searchedPersonData);
        return searchedPersonData;
    }
    public static Person__c getPersonById(String personId){
        List<Person__c> getPersonData = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
        FROM Person__c WHERE Id =:personId ];
        System.debug(getPersonData);
        if (getPersonData != null && getPersonData.size() > 0) {
            return getPersonData[0];  
        }
       return null; 
    }

    public static map<String, Integer> getHealthStatusCount(){
        Map<String, Integer> HealthCountStatus = new Map<String, Integer>();
        for (AggregateResult aggResult : [SELECT Health_Status__c, COUNT(Id) countMember FROM Person__c GROUP BY Health_Status__c]) {
            HealthCountStatus.put((string)aggResult.get('Health_Status__c'), (Integer)aggResult.get('countMember'));
        }
            System.debug(HealthCountStatus);
        return HealthCountStatus;
    }

    public static set<id> getCohabitants(set<id> personsId, set<id> alreadyProcessed){

        List<String> healthStatus = new List<String>{'Green', 'Yellow'};

        List<People_Tracing__c> peopleTracing = [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c
                                                WHERE (Person_1__c IN :personsId OR Person_2__c IN :personsId)
                                                AND Contact_Type__c = 'Cohabitant'
                                                AND (Person_1__r.Health_Status__c IN :healthStatus OR person_2__r.Health_Status__c IN :healthStatus)];
        set<Id> Cohabitants = new set<Id>();
        for (People_Tracing__c pT : peopleTracing) {
            if(!alreadyProcessed.contains(pT.Person_1__c)){
                Cohabitants.add(pT.Person_1__c);
                alreadyProcessed.add(pT.Person_1__c);
            }
            if(!alreadyProcessed.contains(pT.Person_2__c)){
                Cohabitants.add(pT.Person_2__c);
                alreadyProcessed.add(pT.Person_2__c);
            }
        } 
        return Cohabitants ;                
    }
    

    public static set<Id> getNeighbours(set<Id> personsId, set<id> alreadyProcessed){
        List<People_Tracing__c> peopleTarcing = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c
                                                  WHERE ( Person_1__c IN :personsId OR Person_2__c IN :personsId)
                                                  AND Contact_Type__c = 'Neighbour'
                                                  AND (Person_1__r.Health_Status__c = 'Green' OR person_2__r.Health_Status__c = 'Green') ];

            set<Id> neighbours = new set<Id>();
            for (People_Tracing__c pt : peopleTarcing) {
                if(!alreadyProcessed.contains(pt.Person_1__c)){
                    neighbours.add(pt.Person_1__c);
                    alreadyProcessed.add(pt.Person_1__c);
                }
                if(!alreadyProcessed.contains(pt.Person_2__c)){
                    neighbours.add(pt.Person_2__c);
                    alreadyProcessed.add(pt.Person_2__c);
                }
            }

        return neighbours;
    }

    public static set<Id> getprimaryPerson(set<id> personsId, set<id> alreadyProcessed){
        List<string> HealthStatus = new List<String>{'Green', 'Yellow'};
        List<People_Tracing__c> peopleTarcing = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c
                                                WHERE (Person_1__c In:personsId OR person_2__c IN :personsId)
                                                AND Contact_Type__c ='Other'
                                                AND Contact_Date__c = LAST_N_DAYS:10
                                                AND (Person_1__r.Health_Status__c IN :HealthStatus OR person_2__r.Health_Status__c IN :HealthStatus) ];
    
        set<Id> primaryContact = new Set<Id>();
        for (People_Tracing__c pt : peopleTarcing) {
            if(!alreadyProcessed.contains(pt.Person_1__c)){
                primaryContact.add(pt.Person_1__c);
                alreadyProcessed.add(pt.Person_1__c);
            }
            if(!alreadyProcessed.contains(pt.Person_2__c)){
                primaryContact.add(pt.Person_2__c);
                alreadyProcessed.add(pt.Person_2__c);
            }
        }

        return primaryContact;
    }

    public static set<Id> getSecondaryContact(set<id> primaryId, set<id> alreadyProcessed){

        List<People_Tracing__c> peopleTracing = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c
                                                WHERE (Person_1__c IN :primaryId OR person_2__c IN :primaryId)
                                                AND Contact_Type__c = 'Other'
                                                AND Contact_Date__c = LAST_N_DAYS:10
                                                AND (Person_1__r.Health_Status__c ='Green' OR person_2__r.Health_Status__c = 'Green')];

        set<Id> SecondaryContacts = new set<id>();

        for (People_Tracing__c pt : peopleTracing) {
            if(!alreadyProcessed.contains(pt.Person_1__c)){
                SecondaryContacts.add(pt.Person_1__c);
                alreadyProcessed.add(pt.Person_1__c);
            }
            if(!alreadyProcessed.contains(pt.Person_2__c)){
                SecondaryContacts.add(pt.Person_2__c);
                alreadyProcessed.add(pt.Person_2__c);
            }
        }

        return SecondaryContacts;
    }

}