public with sharing class AccountContactService {
    public static void  updateActiveAccount(Set<Id> accountIds){
        List<AggregateResult> results =  [SELECT AccountId,  COUNT(Id) totalContact FROM Contact where Active__c = true AND AccountId IN: accountIds Group by AccountId];
            
        // Map<Id, Account> accUpdate = new Map<Id, Account>();
        Map<Id, Account> accUpdate = new Map<id, Account>();
        for (aggregateResult aggresults : results) {
        //get account id and number of active contacts
        String accId = String.valueOf(aggresults.get('AccountId'));
        Integer totalActiveContact = Integer.valueOf(aggresults.get('totalContact'));
            
        Account acc  = new Account(Id = accId, Active_Contacts__c = totalActiveContact) ;
   
        accUpdate.put(accId, acc);
            }
            for(Id accId : accountIds){

                if(!accUpdate.containsKey(accId)){
                    accUpdate.put(accId, new Account(Id = accId, Active_Contacts__c = 0));
                }
            }
        Update accUpdate.values();
    }
}