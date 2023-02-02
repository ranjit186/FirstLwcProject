public class sginInPageCtrl {
    @AuraEnabled public Static Contact searchUser(String email, String pswd) {
        Contact getContact = [SELECT Name, Id, Email FROM Contact WHERE Email = :email AND Password__c  = :pswd];
        
        return getContact;
    }
    
    @AuraEnabled public static List<Contact> getContactDetail(String contId){
       List<Contact> getContactDeatil = [SELECT Id, Name, Account.Name, Phone, MobilePhone, Email, CreatedDate FROM Contact WHERE Id = :contId];
        
        return getContactDeatil;
    }
    @AuraEnabled public static List<Contact> createNewUser(string FName, String LName, String Email, String pswd){
        
        Contact contactObj =  new Contact(FirstName = FName, LastName = LName, Email = Email, Password__c = pswd);
        insert contactObj;
        
        List<Contact> newContact = [SELECT Id, Name, Account.Name, Phone, MobilePhone, Email, CreatedDate FROM Contact WHERE Id = :contactObj.Id];
        
        return newContact;
    }
}