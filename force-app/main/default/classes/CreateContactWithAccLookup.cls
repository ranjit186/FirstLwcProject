public class CreateContactWithAccLookup {
   @AuraEnabled public static List<Account> getAllAccounts(){
        List<Account> getAccs = [SELECT ID, Name FROM Account];
        
        return getAccs;
    }
    
    @AuraEnabled public Static Contact createNewContact(String slectedAcc, String lName){
        
        Contact conObj = new Contact();
        conObj.LastName = lName;
        conObj.AccountId = slectedAcc;
        
        insert conObj;
        system.debug('conObj : '+conObj);
        return conObj;
    }
}