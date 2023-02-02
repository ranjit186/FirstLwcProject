public with sharing class CTLoactionController {
    public static List<Location__c> getRecentStatusChanges(){
        List<Location__c> locationQuery = 
        [SELECT Red_Score__c, Status__c, Status_Update_Date__c, Id, Name, Pincode__c, Address__c 
        FROM Location__c 
      
        ORDER BY Status_Update_Date__c DESC
        NULLS LAST LIMIT 100];

    System.debug(locationQuery);
        return locationQuery;
    }

    public static List<Location__c> searchLocations(String searchTerm){
        searchTerm = searchTerm + '%';
        List<Location__c> locationGetData = 
        [SELECT Red_Score__c, Status__c, Status_Update_Date__c, Id, Name, Pincode__c, Address__c
         FROM Location__c
         WHERE Name LIKE :searchTerm 
         OR Pincode__c LIKE :searchTerm
         OR Address__c LIKE :searchTerm
         ORDER BY Status_Update_Date__c DESC  NULLS LAST];
          System.debug(locationGetData);
          return locationGetData;

    }

    public static Location__c getLocationById(String locationId){
        List<Location__c> locationSearchedData = [SELECT Red_Score__c, Status__c, Status_Update_Date__c, Id, Name, Pincode__c, Address__c 
        FROM Location__c 
        WHERE Id =:locationId ];
        if (locationSearchedData != null && locationSearchedData.size() > 0) {
            return locationSearchedData[0];
        }
        return null;
    }

    public static Map<String, Integer> getStatusCount(){
        Map<String, Integer> numberLocationStatus = new map<String, Integer>();

        for (AggregateResult aggresult : [SELECT Status__c, COUNT(Id) totalId 
                                            FROM Location__c GROUP BY  Status__c ]) {
        numberLocationStatus.put((String)aggresult.get('Status__c'), (Integer)aggresult.get('totalId'));                            
        }

        return numberLocationStatus;
    }


    public static void updateRedScore(set<Id> locationIds){

        List<Location__c> LocationToUpdate = new List<Location__c>();

       AggregateResult[] redPeopleLocation = [SELECT Location__c, COUNT(Id) total FROM Location_Tracing__c
                                                WHERE Person__r.Health_Status__c = 'Red'
                                                AND Visit_Date__c = LAST_N_DAYS :10
                                                AND Location__c IN :locationIds
                                                GROUP BY Location__c];

        for (AggregateResult ar : redPeopleLocation) {
            string locationId = string.valueOf(ar.get('Location__c'));
            Integer redScore = Integer.valueOf(ar.get('total'));
            String status = getStatus(redScore);
            LocationToUpdate.add(new Location__c(Id = locationId, Red_Score__c = redScore, Status__c = status));
        }

        if(LocationToUpdate != null && LocationToUpdate.size() > 0){
            update LocationToUpdate;
        }
    }
    public static String getStatus(Integer redScore){
        if(redScore == 0){
           return 'Green';
        } else if (redScore <= 5) {
            return 'Yellow';
        } else if(redScore <= 10){
            return 'Orange';
        } else {
            return 'Red';
        }
    }
}