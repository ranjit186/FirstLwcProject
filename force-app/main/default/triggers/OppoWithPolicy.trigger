trigger OppoWithPolicy on Policy__c (before update, after update) {
    Switch on trigger.operationType{
        
        When BEFORE_UPDATE{
            
            OppoAndPolicyHandler.oppoAndPolicy(trigger.new);
            
            
            
        
            
           /* 
            
            Set<String> policy_number = new Set<String>();
            set<String> PolicyId =  new set<String>();
            Map<Id, String> parentIds = new Map<Id, String>();
            
            for(Policy__c each : trigger.new){
                policy_number.add(String.valueOf(each.Policy_Number__c));
                PolicyId.add(each.id);
                // update policy checkbox
                system.debug('--------------->'+each.Parent_Policy__c);
                if(each.Parent_Policy__c !=  null){
                    
                    parentIds.put(each.Policy_Number__c, each.Parent_Policy__c);
                    
                } 
            }
            system.debug('parentIds: '+ parentIds.size());
            
            
            
            // get all oportunity that have same policy number.
            List<opportunity> getAllOpp = [SELECT Id, name, Policy_Number__c from opportunity Where Policy_Number__c =: policy_number];
            system.debug('getAllOpp: '+ getAllOpp);
            
            List<Opportunity> UpdateList = new List<Opportunity>();
            
            
            List<Policy__c> checkBoxdata = new List<Policy__c>();
            
            List<Policy__c> setPolicyData = new List<Policy__c>();
            for(Opportunity eachData:  getAllOpp){
                opportunity opp = new opportunity();
                opp.Id = eachData.Id;
                opp.Name = eachData.Name +' '+ eachData.Id;
                opp.StageName = 'Closed Won';
                
                UpdateList.add(opp);
                if(parentIds.size() > 0){
                  Policy__c poly = new Policy__c();
                system.debug('Policy_Number__c: '+ eachData.Policy_Number__c);
                poly.id = parentIds.get(eachData.Policy_Number__c);
                poly.Renew_Policy__c = true;
                
                checkBoxdata.add(poly);  
                }
                
                for(String item: PolicyId){
                    Policy__c policySet = new Policy__c();
                    policySet.id = item;
                    policySet.Opportunity_Name__c = eachData.Name;
                    setPolicyData.add(policySet);
                }
                
            }
            update setPolicyData;
            update checkBoxdata;
            update UpdateList;
            */
        }
    }
}