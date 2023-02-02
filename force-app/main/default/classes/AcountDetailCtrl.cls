public class AcountDetailCtrl {
    public static Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
	@AuraEnabled
    public static List<Account> getAllAccountDetail(){
        List<Account> getAccetails =  [SELECT Id, Name, Phone, Number_of_Contacts__c, Number_of_Cases__c FROM Account];  
        return getAccetails;
    }
}