@isTest
public class copyAddressFormAccTest {
	@isTest
    public static void afterInsertCopyAddress() {
        Account acc = new Account();
        acc.Name = 'TestClass';
        acc.BillingCity = 'New Delhi';
        acc.BillingCountry = 'India';
        acc.BillingState ='Delhi';
        acc.BillingPostalCode = '110084';
        acc.BillingStreet = '12';
        
        insert acc;
        Test.startTest();
        List<Contact> conList = new List<Contact>();
        
        /*conList.add(new Contact(LastName = 'TestClass1', AccountId = acc.Id, MailingStreet = acc.BillingStreet, MailingCity = acc.BillingCity, MailingState =acc.BillingState,
                                MailingPostalCode = acc.BillingPostalCode, MailingCountry = acc.BillingCountry ));
        conList.add(new Contact(LastName = 'TestClass2', AccountId = acc.Id, MailingStreet = acc.BillingStreet, MailingCity = acc.BillingCity, MailingState =acc.BillingState,
                                MailingPostalCode = acc.BillingPostalCode, MailingCountry = acc.BillingCountry ));
        conList.add(new Contact(LastName = 'TestClass3', AccountId = acc.Id, MailingStreet = acc.BillingStreet, MailingCity = acc.BillingCity, MailingState =acc.BillingState,
                                MailingPostalCode = acc.BillingPostalCode, MailingCountry = acc.BillingCountry ));
        conList.add(new Contact(LastName = 'TestClass4', AccountId = acc.Id, MailingStreet = acc.BillingStreet, MailingCity = acc.BillingCity, MailingState =acc.BillingState,
                                MailingPostalCode = acc.BillingPostalCode, MailingCountry = acc.BillingCountry ));
        conList.add(new Contact(LastName = 'TestClass5', AccountId = acc.Id, MailingStreet = acc.BillingStreet, MailingCity = acc.BillingCity, MailingState =acc.BillingState,
                                MailingPostalCode = acc.BillingPostalCode, MailingCountry = acc.BillingCountry ));*/
        
        Contact contactObj = new Contact();
        contactObj.LastName = 'test';
        contactObj.Copy_Address_From_Account__c = true;
        contactObj.AccountId = acc.Id;
        conList.add(contactObj); 
        insert conList;
        
        conList[0].MailingStreet = acc.BillingStreet;
            conList[0].MailingCity = acc.BillingCity;
            conList[0].MailingState = acc.BillingState;
            conList[0].MailingPostalCode = acc.BillingPostalCode;
        conList[0].MailingCountry = acc.BillingCountry;
        
        Update conList; 
            
            
        
       //    Database.SaveResult results = Database.insert(conList, false);
        Test.stopTest();
    }
}