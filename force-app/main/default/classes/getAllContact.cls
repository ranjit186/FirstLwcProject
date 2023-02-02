public class getAllContact {
	@AuraEnabled
    public static List<Contact> fetchAllContact(){
        List<Contact> contactList = [SELECT Id, LastName, Name, Account.Name, FirstName, HomePhone, Email, Active__c , CreatedDate FROM Contact];
        return contactList;
    }
}