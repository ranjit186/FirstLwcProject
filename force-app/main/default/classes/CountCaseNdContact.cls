public class CountCaseNdContact {
    public static void getCountCaseContact(){
        
        List<Account> updateAccount = new List<Account>();
        
        set<Id>Accoutids = new Set<id>();
        List<Account> GetAcountData = [Select Id from Account];
        for(Account each : GetAcountData){
            Accoutids.add(each.Id);
        }
        
        AggregateResult[] getCases = [SELECT Count(id) totalCase, AccountId from case where AccountId IN: Accoutids GROUP BY AccountId];
        AggregateResult[] getContacts = [SELECT Count(id) totalContact, AccountId from contact where AccountId IN: Accoutids GROUP BY AccountId];
        
        // match accountId of contact and case and after match set the value of number_of_cases and number_of_contacts
        for(AggregateResult conData : getContacts){
            for(AggregateResult eachCase : getCases){
                if(conData.get('AccountId') == eachCase.get('AccountId')){
                    Account singleAccUpdte =
                        new Account(Id = (Id)eachCase.get('AccountId'), Number_of_Contacts__c = (Decimal)conData.get('totalContact'), Number_of_Cases__c = (Decimal)eachCase.get('totalCase'));
                    updateAccount.add(singleAccUpdte);         
                }
                
            }
        }
        Update updateAccount;
        system.debug('update account: '+ updateAccount);
    }
}