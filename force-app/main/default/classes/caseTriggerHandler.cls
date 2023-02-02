public class caseTriggerHandler {
    public static void findDuplicateCase(List<Case> newReacords){
        String policyVariable;
        string typevalue;
        Datetime createdDateValue;
        
        List<Case> caseList = new List<Case>();
        List<Case> cadup = new List<Case>();
        set<Case> caseSet = new set<Case>();
        set<Id> caseId = new set<Id>();
        for( Case each : newReacords){
            if(each.policy__c != null && each.Type == 'QRC'){
                policyVariable = each.Policy__c;
                typevalue = each.Type;
                createdDateValue = each.CreatedDate;
                caseId.add(each.Id);
            }
        }
        
        system.debug('policyVariable>>> '+policyVariable);
        system.debug('typevalue>>> '+typevalue);
        
        if(policyVariable != null && typevalue == 'QRC'){
            system.debug('in>>>> ');
            cadup =[select id, policy__c, Type, ParentId from case 
                    where policy__c =: policyVariable  AND Type = 'QRC' AND ID != :caseId ];
        }
        system.debug('cadup>>>> '+cadup);
        if(cadup.size() > 0){
            for(Id csId : caseId){
                for(case cse : cadup){
                    system.debug('oldcaseid'+cse);
                    Case ce = New Case();
                    ce.Id = csId;
                    ce.ParentId = cse.Id;
                    caseSet.add(ce);
                }
            }
        }
        system.debug('caseSet>>>> '+caseSet);
        
        for(Case csSet : caseSet){
            caseList.add(csSet);
        }
        system.debug('caseList : '+ caseList);
        Update caseList;
    }
}