public with sharing class Contacttrigger {
    public static  void afteInsertHandler(List<Contact> newContactReacord){
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newContactReacord){
            if(String.isNotBlank(con.AccountId)){ 
                accountIds.add(con.AccountId);
            }
        }

        AccountContactService.updateActiveAccount(accountIds);
    }

    public static void afterUpdateHandler(List<Contact> newContactRecords, Map<Id, Contact> oldContactsMap){
        Set<Id> accountIds = new Set<id>();

        for(Contact Con : newContactRecords){
            if(String.isNotBlank(con.AccountId) && oldContactsMap.get(con.Id).Active__c != con.Active__c){
                accountIds.add(con.AccountId);
            }
            else if(oldContactsMap.get(con.Id).AccountId != con.AccountId){
                accountIds.add(con.AccountId);
                accountIds.add(oldContactsMap.get(con.Id).AccountId);
            }
        }

        AccountContactService.updateActiveAccount(accountIds);
    }

    public static void afterDeleteHandler(List<Contact> oldContacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : oldContacts){
        
            if(String.isNotBlank(con.AccountId)){ 
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveAccount(accountIds);
    }
    public static void afterUndeletehandler(List<Contact> newCOntacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newCOntacts){
        
            if(String.isNotBlank(con.AccountId)){ 
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateActiveAccount(accountIds);
    }
}