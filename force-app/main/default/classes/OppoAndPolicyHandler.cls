public class OppoAndPolicyHandler {
    public static void oppoAndPolicy(List<Policy__c> newDatarecord){
        List<Policy__c> policyData = new List<Policy__c>();
        
        set<String> policyNum = new set<String>();
        
        set<string> parentPolicyId = new set<String>();
        for(Policy__c each : newDatarecord){
            
            policyNum.add(each.Policy_Number__c);
            
            policyData.add(each);
            if(each.Parent_Policy__c != null){
                system.debug(each.Parent_Policy__c);
                parentPolicyId.add(each.Parent_Policy__c);
            }
        }
        
        List<Opportunity> getAllSimilarPolicyOpp = [SELECT Id, Name, Policy_Number__c, StageName FROM Opportunity where Policy_Number__c IN : policyNum];

        for(Opportunity eachdata : getAllSimilarPolicyOpp){
            for(Policy__c eachitem: policyData){
                if(eachitem.Policy_Number__c == eachdata.Policy_Number__c){
                    eachdata.StageName = 'Closed Won';
                    eachitem.Opportunity_Name__c = eachdata.Id;
                    
                }
            }
        }
        
        if(getAllSimilarPolicyOpp.size() >0){
         update  getAllSimilarPolicyOpp;  
        }
        
        if(parentPolicyId.size() > 0){
            List<Policy__c> getParentPolicy = [SELECT ID, Name, Renew_Policy__c from Policy__c where id IN:parentPolicyId ];
            
            for(Policy__c items :getParentPolicy ){
                items.Renew_Policy__c = true;
            }
            
            update getParentPolicy;
        }
        
    }
}