trigger CloseOppWIthCamp on Campaign (After insert, after update) {
    
    Switch on trigger.operationType{
       /* When AFTER_INSERT{
            List<Opportunity> InsertListOpp = new List<Opportunity>();
            for(Campaign each: Trigger.new){
                if(each.Status == 'Completed'){
                    List<opportunity> getOppr = [SELECT Name, Id, StageName, CampaignId, TotalOpportunityQuantity
                                           FROM Opportunity where CampaignId =: each.Id];
                    for(opportunity eachOpp: getOppr){
                        opportunity newUpdateOpp = new opportunity();
                        newUpdateOpp.Id = eachOpp.Id;
                        if(eachOpp.TotalOpportunityQuantity > 0){
                            newUpdateOpp.StageName = 'Closed Won';
                        }else{
                            newUpdateOpp.StageName = 'Closed Lost';
                        }
                        
                       InsertListOpp.add(newUpdateOpp);
                    }
                    
                }
            }
            
            update InsertListOpp;
        }
        */
        When AFTER_UPDATE{
           
                 List<Opportunity> updtedListOpp = new List<Opportunity>();
            for(Campaign uppEach: Trigger.new){
                if(uppEach.Status == 'Completed'){
                    List<opportunity> getOppr = [SELECT Name, Id, StageName, CampaignId, TotalOpportunityQuantity
                                           FROM Opportunity where CampaignId =: uppEach.Id];
                    for(opportunity uppEachOpp: getOppr){
                        opportunity newUpdateOpp = new opportunity();
                        newUpdateOpp.Id = uppEachOpp.Id;
                        if(uppEachOpp.TotalOpportunityQuantity > 0){
                            newUpdateOpp.StageName = 'Closed Won';
                        }else{
                            newUpdateOpp.StageName = 'Closed Lost';
                        }
                        
                       updtedListOpp.add(newUpdateOpp);
                    }
                    
                
            }
            
            update updtedListOpp;
            }  
        }
    }
   
}