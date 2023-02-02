@isTest 
public class CountContactsTest {
	@isTest
    public static void getCountContact(){
        
        Account accObj = new Account();
        accObj.Name = 'testAccunt';
        
        insert accObj;
        Test.startTest();
        
        Contact conObj = new Contact();
        conObj.LastName = 'testcontact 1';
        conObj.AccountId = accObj.Id;
        
        insert conObj;
        
        Opportunity OpportunityObj = New Opportunity();
        OpportunityObj.AccountId = accObj.Id;
        OpportunityObj.Name = 'testOpportunity';
        OpportunityObj.ContactId = conObj.Id;
        OpportunityObj.CloseDate = Date.today();
        OpportunityObj.StageName ='Qualification';
        
        insert OpportunityObj;
        
        
        
        List<Account> accList =  [SELECT Id, Name, (SELECT Name from contacts), (SELECT Name FROM Opportunities) FROM Account];
        
        Map<Id, List<String>> contactData = new map<Id, List<String>>();
        
        for(Account acc : accList){
            
            
            for(Contact contacts: acc.Contacts){
                if(!contactData.containsKey(acc.Id)){
                    contactData.put(acc.Id, new List<String>());
                }
                contactData.get(acc.Id).add((String.valueOf(contacts.Name)));
            }
            
            for(Opportunity opp : acc.Opportunities){
                  if(contactData.get(acc.Id) != null){
                    if(contactData.get(acc.Id).contains(String.ValueOf(opp.Name))){
                        system.debug(acc.Name+' the number of contact have in account: ' + acc.contacts.size());
                    }
                }
            }
        }
        
        system.debug('ContactData: '+ contactData);
        Test.stopTest();
        
    }
}