@isTest
public with sharing class ContactTriggerHandlerTest {
  @isTest 
  public static void afterInsertHandlerTest(){
     List<Account> TestAccountList = new List<Account>();

     TestAccountList.add(new Account(Name = 'Test 1'));
     TestAccountList.add(new Account(Name = 'Test2'));

     insert TestAccountList;

     List<Contact> testConList = new List<Contact>();

     testConList.add(new Contact(LastName = 'testContat1', AccountId = TestAccountList[0].Id, Email = 'kr.ranjit143@gmail.com'));
     testConList.add(new Contact(LastName = 'testContat2', AccountId = TestAccountList[0].Id, Email = 'kr.ranjit143@gmail.com'));
     testConList.add(new Contact(LastName = 'testContat3', AccountId = TestAccountList[0].Id, Email = 'kr.ranjit143@gmail.com'));
     testConList.add(new Contact(LastName = 'testContat4', AccountId = TestAccountList[1].Id, Email = 'kr.ranjit143@gmail.com'));
     testConList.add(new Contact(LastName = 'testContat5', AccountId = TestAccountList[1].Id, Email = 'kr.ranjit143@gmail.com'));

     insert testConList;
      
	 updateContactAdd.updateContactMailineAddress(testConList);
     List<Account> accs = [SELECT ID,  Active_Contacts__c FROM Account];

     System.assertEquals(2, accs.size());
     System.assertEquals(0, accs[0].Active_Contacts__c);
     System.assertEquals(0, accs[1].Active_Contacts__c);

     List<Contact> ListContact = [SELECT Id FROM Contact];

     System.assertEquals(5, ListContact.size());
  }
}