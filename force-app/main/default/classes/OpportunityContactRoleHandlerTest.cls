@isTest
public class OpportunityContactRoleHandlerTest {
 @isTest    public static void validationOnUptoTwoContactRole(){
        
        Contact contactObj = new Contact();
        contactObj.LastName = 'testContact';
        
        insert contactObj;
        
        Opportunity OppoObj = new Opportunity();
        OppoObj.CloseDate = date.today();
        OppoObj.Name = 'test';
        OppoObj.ContactId = contactObj.Id;
        OppoObj.StageName = 'Qualification';
        
        insert OppoObj;
        
        Product2 ProductObj = new Product2();
        ProductObj.Name = 'testProduct';
        
        insert ProductObj;
        Test.startTest();   
        
     // Pricebook2 pricbookId =  [SELECT Id, Name FROM Pricebook2 where Pricebook2.isStandard = true LIMIT 1];
        
        PricebookEntry PricebookEntryObj = new PricebookEntry();
        PricebookEntryObj.Pricebook2Id = Test.getStandardPricebookId();
        PricebookEntryObj.Product2Id = ProductObj.Id;
        PricebookEntryObj.UnitPrice = Decimal.valueOf('5');
        PricebookEntryObj.IsActive = true;
		
        insert PricebookEntryObj;
        
        
        
        List<OpportunityContactRole> OpportunityContactRoleList = new List<OpportunityContactRole>();
        
      
        OpportunityContactRoleList.add(new OpportunityContactRole(ContactId = contactObj.Id, OpportunityId = OppoObj.Id ));
        OpportunityContactRoleList.add(new OpportunityContactRole(ContactId = contactObj.Id, OpportunityId = OppoObj.Id ));
        OpportunityContactRoleList.add(new OpportunityContactRole(ContactId = contactObj.Id, OpportunityId = OppoObj.Id ));
        OpportunityContactRoleList.add(new OpportunityContactRole(ContactId = contactObj.Id, OpportunityId = OppoObj.Id ));
        
           List<OpportunityLineItem> OpportunityLineItemList = new List<OpportunityLineItem>();
        
        OpportunityLineItemList.add(new OpportunityLineItem(OpportunityId =OppoObj.Id, PricebookEntryId =  PricebookEntryObj.Id, UnitPrice = 10.00, Quantity  = 2));
        OpportunityLineItemList.add(new OpportunityLineItem(OpportunityId =OppoObj.Id, PricebookEntryId =  PricebookEntryObj.Id,  UnitPrice = 10.00, Quantity  = 3));
        OpportunityLineItemList.add(new OpportunityLineItem(OpportunityId =OppoObj.Id, PricebookEntryId =  PricebookEntryObj.Id,  UnitPrice = 10.00, Quantity  = 5));
        OpportunityLineItemList.add(new OpportunityLineItem(OpportunityId =OppoObj.Id, PricebookEntryId =  PricebookEntryObj.Id,  UnitPrice = 10.00, Quantity  = 9));
        
        /*
            for(Integer i = 0; i >=3 ; i++){
                //opportunityLineItem
                OpportunityLineItem OpportunityLineItemObj = new OpportunityLineItem();
                OpportunityLineItemObj.OpportunityId =OppoObj.Id;
                OpportunityLineItemObj.PricebookEntryId =  PricebookEntryObj.Id;
                OpportunityLineItemObj.TotalPrice = Decimal.valueOf('200');
                OpportunityLineItemObj.UnitPrice = Decimal.valueOf('10');
                
                OpportunityLineItemList.add(OpportunityLineItemObj);
                
                // opportunity contact role
                OpportunityContactRole OpportunityContactRoleObj = new OpportunityContactRole();
                OpportunityContactRoleObj.ContactId = contactObj.Id;
                OpportunityContactRoleObj.OpportunityId = OppoObj.Id;
                
                OpportunityContactRoleList.add(OpportunityContactRoleObj);
                
             
                    }*/
        insert OpportunityLineItemList;
        insert OpportunityContactRoleList;
        
        List<opportunity> getAllData = [select id, Name, 
                                        (select Id from opportunityLineItems), 
                                        (select id from opportunityContactRoles) from opportunity 
                                        where id = :OppoObj.Id And (StageName = 'Qualification' OR StageName = 'Prospecting')];
        
        system.debug('getAllData data : '+ getAllData);
        if(getAllData.size() > 0){
            for(Opportunity eachItem : getAllData){
                system.debug('eachItem :'+ eachItem.opportunityLineItems.size());
                if(eachItem.opportunityLineItems.size() > 2){
                    system.debug('opportunityContactRoles : ' + eachItem.opportunityContactRoles + 'size : ' +eachItem.opportunityContactRoles.size() );
                    if(eachItem.opportunityContactRoles.size() > 2){
                        
                        for(opportunityContactRole roleItem :eachItem.opportunityContactRoles){
                            roleItem.addError('Please enter a only upto 2 contact role');
                        } 
                    }
                }
            }
        }
        

	Test.stopTest();        
    }
}