trigger IncreOpptunity on Opportunity (before insert, after update) {
    
    Switch on trigger.operationType{
        When AFTER_UPDATE{
            List<Product2> productUpdate = new List<Product2>();
            for(Opportunity each:  trigger.new){
                if(each.StageName == 'Closed Won'){
                    List<OpportunityLineItem> 
                        opplineItemGets = [SELECT Id, Product2Id, Quantity, OpportunityId, Product2.No_Of_Products_Sold__c 
                                                                 FROM OpportunityLineItem Where OpportunityId =: each.Id];
                    
                    for(OpportunityLineItem eachOpp: opplineItemGets){
                        Product2 products =  new Product2();
                        products.Id = eachOpp.Product2Id;
                        products.No_Of_Products_Sold__c = eachOpp.Product2.No_Of_Products_Sold__c + eachOpp.Quantity;
                        /*
                        // if No_Of_Products_Sold__c increment only one when na opportunity closed won
                        products.No_Of_Products_Sold__c = eachOpp.Product2.No_Of_Products_Sold__c + 1;
                        */
                        productUpdate.add(products);
                    }
                }
            }
            update productUpdate;
        }
    }
}