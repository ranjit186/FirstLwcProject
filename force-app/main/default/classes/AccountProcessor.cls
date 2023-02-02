public class AccountProcessor {

    @future
    public static void countContacts(List<id> AccountIds){
        List<Account> accounts = [Select id, Name, (SELECT id, Name from contacts) from Account where Id In:AccountIds];
        
        for(Account each : accounts){
            each.Number_of_Contacts__c = each.contacts.size();
        }
        
        update accounts;
       system.debug('accounts : '+ accounts);
    }
    
}