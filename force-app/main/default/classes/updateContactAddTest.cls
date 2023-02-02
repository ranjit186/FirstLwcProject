@isTest
public class updateContactAddTest {
    @isTest
    public static void afterInsertConatctAdd(){
        test.startTest();
        Account acc = new Account(name = 'test1', BillingStreet ='12', BillingCity = 'newdelhi', BillingState='Delhi', BillingPostalCode = '110084', BillingCountry = 'India');
        insert acc;
        
        List<Contact> tectContact = new List<Contact>();
        Contact conObj = new Contact(); 
        conObj.AccountId = acc.Id;
        conObj.LastName = 'testclass1';
        conObj.Copy_Address_From_Account__c = true;
        conObj.Email = 'kr.ranjit143@gmail.com';  
        
        tectContact.add(conObj);
        
        insert tectContact;
        
        tectContact[0].MailingStreet = acc.BillingStreet;
        tectContact[0].MailingCity = acc.BillingCity;
        tectContact[0].MailingState = acc.BillingState;
        tectContact[0].MailingPostalCode = acc.BillingPostalCode;
        tectContact[0].MailingCountry = acc.BillingCountry;
        
       // update tectContact[0];
        update tectContact;
        test.stopTest();
        
        //List<Account> accs = [SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry FROM Account];
    }
}