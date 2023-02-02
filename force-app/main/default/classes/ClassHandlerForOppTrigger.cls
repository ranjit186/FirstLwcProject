public class ClassHandlerForOppTrigger {
    public static void AfterInsertCloneOpportunity(List<Opportunity> newReacords){
        //For  List of Clone Opportunity 
        List<Opportunity> oppsToUpdate = new List<Opportunity>();
        
        //For Mapping IDs from Opportunity to OpportunityLineItem 
        Map<Id,List<OpportunityLineItem>> oplitemsMap = new  Map<Id,List<OpportunityLineItem>>();
        
        //For Fetching Inserted Or Old list To Clone
        List<OpportunityLineItem> oppitemlist = new List<OpportunityLineItem>();
        
        //For Fetching Inserted IDs Or Old IDs To Clone Opportunity
        Set<Id> SetID = new Set<Id>();
        
        //For Fetching Newly Inserted Ids for OpportunityLineitem
        Set<id> oppIds = new set<Id>();
        
        //For Preventing Recursion
        if(OpportunityRecursiveTriggerHandler.isFirstTime){
            //Resursion Handler Class
            OpportunityRecursiveTriggerHandler.isFirstTime = false;
            
            //Fetching Insert and Old Opportunit Ids
            for(opportunity opp: newReacords)
            {
                SetID.add(opp.id);
            }//End oF 'for'
            
            //Checking the ids
            List<Opportunity> ListOpp = [Select id, Name, AccountId, Product_Type__c, CloseDate, StageName, Payment_Frequency__c, Most_Recent_Invoice_Date__c, Billing_Start_Date__c, Interval__c, Parent_Opportunity__c, Clone_Opportunity__c from Opportunity where id IN:SetID];
            // List<Opportunity> ListOpp = [Select id, Name, AccountId, CloseDate, StageName from Opportunity where id IN:SetID];
            
            //For Newly Inserted Opportunity
            
            //Cloning Opportunity 
            for(Opportunity opp : ListOpp)
            { 
                //If CheckBox Clone_Opportunity__c is checked
                if(opp.Clone_Opportunity__c)
                {
                    //IF StageName is Closed Won
                    if(opp.StageName == 'Closed Won')
                    {
                        //If Product Type is Subscription
                        if(opp.Product_Type__C == 'Subscription')
                        {
                            //if Payment Frequency is not Empty 
                            if(opp.Payment_Frequency__c != Null)
                            {
                                //If Next Invoice Date is Today
                                if(opp.Next_Invoice_Date__c == system.today())
                                {
                                    //If Parent Opportunity is Empty
                                    if(opp.Parent_Opportunity__c == Null)
                                    {
                                        
                                        oppIds.add(opp.Id);
                                        Opportunity newopp = new Opportunity(); 
                                        newopp.Name = opp.Name + ' Clone';
                                        newopp.AccountId = opp.AccountId;
                                        newopp.Product_Type__c = opp.Product_Type__c;
                                        newopp.CloseDate = opp.CloseDate;
                                        newopp.StageName = opp.StageName;
                                        newopp.Payment_Frequency__c = opp.Payment_Frequency__c;
                                        newopp.Most_Recent_Invoice_Date__c  = opp.Most_Recent_Invoice_Date__c;
                                        newopp.Billing_Start_Date__c = opp.Billing_Start_Date__c;
                                        newopp.Interval__c = opp.Interval__c;
                                        newopp.Parent_Opportunity__c = opp.Id;
                                        oppsToUpdate.add(newopp);
                                        
                                    }//End of If Parent Opportunity
                                    
                                }//End of if Next Invoice date 
                                
                            }//End of If Payment Frequency
                            
                        }//End Of If Product Type
                        
                    }//End of If StageName
                    
                }//End of if Checkbox
                
            }//End of for 
            
            //Iterating OpportunityLineitems For Opportunity to update related OpportunityLineItem if Present
            for(OpportunityLineitem opl : [SELECT Id, Product2Id, Quantity, UnitPrice,pricebookentryid, OpportunityId FROM OpportunityLineItem Where OpportunityId IN : oppIds])
            {
                //Mapping Inserted or Old opportunityIds to Clone the related OpportunityLineItem
                if(!oplitemsMap.containsKey(opl.OpportunityId))
                {
                    oplitemsMap.put(opl.OpportunityId, new List<OpportunityLineitem>{opl});
                }//End of IF Old IDs
                
                else
                {
                    oplitemsMap.get(opl.OpportunityId).add(opl);
                }//end of else
                
            }//End Of for iteration oppoopportunityLineItem
            
            //If Opportunity is Not Empty 
            if(!oppsToUpdate.IsEmpty())
            {
                //Cloning Inserted Or Updated Opportunity  
                insert oppsToUpdate;
                system.debug('Cloning Inserted Or Updated Opportunity oppsToUpdate : ' + oppsToUpdate);
                //Iterating Cloned Inserted Or Updated Opportunity for OpportunityLineItem 
                for(Opportunity op : oppsToUpdate)
                {
                    //system.debug(' Id --> ' + op.Id);
                    //system.debug(' Parent Id --> ' + op.Parent_Opportunity__c);
                    
                    //for inserted Or updated Opportunity if Parent_opportunity__c is equals Opportunity
                    if(oplitemsMap.containsKey(op.Parent_Opportunity__c))
                    {
                        //Iterating OpportunityLineitem From Parent Opportunity For Cloning Its OpportunityLineItem
                        for(OpportunityLineitem ol : oplitemsMap.get(op.Parent_Opportunity__c))
                        {
                            OpportunityLineItem oli = new OpportunityLineitem();
                            oli.OpportunityId = op.Id;
                            oli.Product2Id = ol.Product2Id;
                            oli.Quantity = ol.Quantity;
                            oli.UnitPrice = ol.UnitPrice;
                            oli.pricebookentryid=ol.pricebookentryid;
                            oppitemlist.add(oli);
                        }//End of for
                        
                    }//End of If
                    
                }//End Of For
                
                //Cloning OpportunityLineItem From Parent Opportunity OpportunityLineItem 
                if(!oppitemlist.isEmpty())
                {
                    insert oppitemlist;
                    
                    system.debug('oppitemlist line no 137 : '+ oppitemlist);
                }//End Of if
                
            }//End of If for Cloning 
        }
        
    }
    
    
    public static void AfterUpdateCloneOpportunity(List<Opportunity> newReacords, Map<Id, Opportunity> oldRecords){
        
        //For  List of Clone Opportunity 
        List<Opportunity> oppsToUpdate = new List<Opportunity>();
        
        //For Mapping IDs from Opportunity to OpportunityLineItem 
        Map<Id,List<OpportunityLineItem>> oplitemsMap = new  Map<Id,List<OpportunityLineItem>>();
        
        //For Fetching Inserted Or Old list To Clone
        List<OpportunityLineItem> oppitemlist = new List<OpportunityLineItem>();
        
        //For Fetching Inserted IDs Or Old IDs To Clone Opportunity
        Set<Id> SetID = new Set<Id>();
        
        //For Fetching Newly Inserted Ids for OpportunityLineitem
        Set<id> oppIds = new set<Id>();
        
        //For Preventing Recursion
        if(OpportunityRecursiveTriggerHandler.isFirstTime){
            //Resursion Handler Class
            OpportunityRecursiveTriggerHandler.isFirstTime = false;
            
            //Fetching Insert and Old Opportunit Ids
            for(opportunity opp: newReacords)
            {
                SetID.add(opp.id);
            }//End oF 'for'
            
            //Checking the ids
            List<Opportunity> ListOpp = [Select id, Name, AccountId, Product_Type__c, CloseDate, StageName, Payment_Frequency__c, Most_Recent_Invoice_Date__c, Billing_Start_Date__c, Interval__c, Parent_Opportunity__c, Clone_Opportunity__c from Opportunity where id IN:SetID];
            // List<Opportunity> ListOpp = [Select id, Name, AccountId, CloseDate, StageName from Opportunity where id IN:SetID];
            
            //for Updated new Opportunity 
            for(Opportunity opp : ListOpp)
            { 
                //checking Old ids checkbox
                if(oldRecords.get(opp.Id).Clone_Opportunity__c != opp.Clone_Opportunity__c && opp.Clone_Opportunity__c)
                {
                    //IF StageName is Closed Won
                    if(opp.StageName == 'Closed Won')
                    {
                        //If Product Type is Subscription
                        if(opp.Product_Type__C == 'Subscription')
                        {
                            //if Payment Frequency is not Empty 
                            if(opp.Payment_Frequency__c != Null)
                            {
                                //If Next Invoice Date is Today
                                if(opp.Next_Invoice_Date__c == system.today())
                                {
                                    //If Parent Opportunity is Empty
                                    if(opp.Parent_Opportunity__c == Null)
                                    {
                                        
                                        oppIds.add(opp.Id);
                                        Opportunity newopp = new Opportunity(); 
                                        newopp.Name = opp.Name + ' Clone';
                                        newopp.AccountId = opp.AccountId;
                                        newopp.Product_Type__c = opp.Product_Type__c;
                                        newopp.CloseDate = opp.CloseDate;
                                        newopp.StageName = opp.StageName;
                                        newopp.Payment_Frequency__c = opp.Payment_Frequency__c;
                                        newopp.Most_Recent_Invoice_Date__c  = opp.Most_Recent_Invoice_Date__c;
                                        newopp.Billing_Start_Date__c = opp.Billing_Start_Date__c;
                                        newopp.Interval__c = opp.Interval__c;
                                        newopp.Parent_Opportunity__c = opp.Id;
                                        oppsToUpdate.add(newopp);
                                        
                                    }//End of If Parent Opportunity
                                    
                                }//End of if Next Invoice date 
                                
                            }//End of If Payment Frequency
                            
                        }//End Of If Product Type
                        
                    }//End of If StageName
                    
                }//End of If Checkbox
                
            }//End of for 
            
            
            //Iterating OpportunityLineitems For Opportunity to update related OpportunityLineItem if Present
            for(OpportunityLineitem opl : [SELECT Id, Product2Id, Quantity, UnitPrice,pricebookentryid, OpportunityId FROM OpportunityLineItem Where OpportunityId IN : oppIds])
            {
                //Mapping Inserted or Old opportunityIds to Clone the related OpportunityLineItem
                if(!oplitemsMap.containsKey(opl.OpportunityId))
                {
                    oplitemsMap.put(opl.OpportunityId, new List<OpportunityLineitem>{opl});
                }//End of IF Old IDs
                
                else
                {
                    oplitemsMap.get(opl.OpportunityId).add(opl);
                }//end of else
                
            }//End Of for iteration oppoopportunityLineItem
            
            //If Opportunity is Not Empty 
            if(!oppsToUpdate.IsEmpty())
            {
                //Cloning Inserted Or Updated Opportunity  
                insert oppsToUpdate;
                system.debug('Cloning Inserted Or Updated Opportunity oppsToUpdate line 250 : '+oppsToUpdate);
                //Iterating Cloned Inserted Or Updated Opportunity for OpportunityLineItem 
                for(Opportunity op : oppsToUpdate)
                {
                    //system.debug(' Id --> ' + op.Id);
                    //system.debug(' Parent Id --> ' + op.Parent_Opportunity__c);
                    
                    //for inserted Or updated Opportunity if Parent_opportunity__c is equals Opportunity
                    if(oplitemsMap.containsKey(op.Parent_Opportunity__c))
                    {
                        //Iterating OpportunityLineitem From Parent Opportunity For Cloning Its OpportunityLineItem
                        for(OpportunityLineitem ol : oplitemsMap.get(op.Parent_Opportunity__c))
                        {
                            OpportunityLineItem oli = new OpportunityLineitem();
                            oli.OpportunityId = op.Id;
                            oli.Product2Id = ol.Product2Id;
                            oli.Quantity = ol.Quantity;
                            oli.UnitPrice = ol.UnitPrice;
                            oli.pricebookentryid=ol.pricebookentryid;
                            oppitemlist.add(oli);
                        }//End of for
                        
                    }//End of If
                    
                }//End Of For
                
                //Cloning OpportunityLineItem From Parent Opportunity OpportunityLineItem 
                if(!oppitemlist.isEmpty())
                {
                    insert oppitemlist;
                    system.debug('oppitemlist 280 : '+ oppitemlist);
                }//End Of if
                
            }//End of If for Cloning  
        }
    }
}