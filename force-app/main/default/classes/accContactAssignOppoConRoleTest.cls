@isTest
public class accContactAssignOppoConRoleTest {
    @isTest
    public static void afterInsertOpportunity(){
        test.startTest();
        Account accObj = new Account();
        accObj.Name = 'TestClass';
        
        insert accObj;
        
        
        
        List<Contact> contactsList =  new List<Contact>();
        Contact contactobj = new Contact();
        contactobj.LastName = 'Test';
        contactobj.AccountId = accObj.id;
        contactsList.add(contactobj);
        insert contactsList;
        
        List<Opportunity> OpportunityList = new List<Opportunity>();
		Opportunity oppObj = new Opportunity();
		oppObj.Name = 'testOppo1';
        oppObj.AccountId = accObj.Id;
        oppObj.ContactId = contactsList[0].Id;
        oppObj.CloseDate = date.today();
        oppObj.StageName = 'Qualification';
        OpportunityList.add(oppObj);
        Insert OpportunityList;
        
        List<OpportunityContactRole> oportunitContactRoleList = new List<OpportunityContactRole>();
         OpportunityContactRole oppoConRole = new OpportunityContactRole();
         oppoConRole.ContactId = contactsList[0].Id;
         oppoConRole.OpportunityId = OpportunityList[0].Id;
         oportunitContactRoleList.add(oppoConRole);
        insert oportunitContactRoleList;
        
       /* 
        contactsList.add(new Contact(LastName = 'TestClass1', AccountId = accObj.Id));
        contactsList.add(new Contact(LastName = 'TestClass2', AccountId = accObj.Id));
        contactsList.add(new Contact(LastName = 'TestClass3', AccountId = accObj.Id));
        
        insert contactsList;
        
        test.startTest();
        
        OpportunityList.add(new Opportunity(Name = 'testOppo1', CloseDate = date.newInstance(2021, 12, 10),StageName = 'Qualification' ));
        OpportunityList.add(new Opportunity(Name = 'testOppo2', CloseDate = date.newInstance(2021, 12, 11),StageName = 'Qualification' ));
        OpportunityList.add(new Opportunity(Name = 'testOppo3', CloseDate = date.newInstance(2021, 12, 12),StageName = 'Qualification' ));
        
        insert OpportunityList;
        
        system.debug('OpportunityList  : '+ OpportunityList);
        List<OpportunityContactRole> OpportunityContactRoleList = new List<OpportunityContactRole>();
        
        for(Opportunity oppoItem : OpportunityList){
            for(Contact each: contactsList){
                
                OpportunityContactRole oppoContRoleObj = new OpportunityContactRole();
                oppoContRoleObj.ContactId = each.Id;
                oppoContRoleObj.OpportunityId = oppoItem.Id;
                
                OpportunityContactRoleList.add(oppoContRoleObj); 
            }
            
        }
        insert OpportunityContactRoleList;*/
        
        Test.stopTest();
    }
}