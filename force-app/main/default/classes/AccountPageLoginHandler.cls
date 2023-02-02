public class AccountPageLoginHandler {
    @AuraEnabled
    public static Account findAccount(String Email, String pswd){
        system.debug('Email : '+Email);
        system.debug('pswd : '+pswd);
        Account getAccount = [SELECT Name, Id FROM Account WHERE Useraname__c = :Email AND Password__c = :pswd];
        
        return getAccount;
    }
    
    @AuraEnabled
    public static List<Contact> getUserDetails(String accId){
        List<Contact> allContactsRelatedAcc = [SELECT Id, Account.Name, Name, LastName, FirstName, MailingAddress, Phone, Email, CreatedDate FROM Contact WHERE AccountId = :accId  ];
        system.debug('allContactsRelatedAcc : ' + allContactsRelatedAcc);
        
        return allContactsRelatedAcc;
    }
    
    @AuraEnabled
    public static Boolean updateContactEdited(List<Contact> editedSAList){
        try{
            List<Contact> updateList = new List<Contact>();
            List<Contact> insertList = new List<Contact>();
            for(Contact each :editedSAList){
                system.debug('each.Id : '+each.Id);
                if(each.Id != null){
                    updateList.add(each);
                }
                else{
                    
                    insertList.add(each);
                }
            }
            update updateList;
            insert insertList;
            return true;
        }catch(Exception e){
            system.debug('Error : ' + e.getMessage());
            return  false;
        }
    }
    
    @AuraEnabled 
    public static Boolean deleteContact(String deleteContacts){
        try{
            system.debug('deleteContacts : '+deleteContacts);
            if(deleteContacts != null){
                Contact getCaontact = [SELECT ID, Name, AccountId From Contact WHERE Id = :deleteContacts] ;
                delete getCaontact;  
            }
            return true;
        }catch(Exception e){
            system.debug('Error : ' + e.getMessage());
            return false;
        }
    }
}