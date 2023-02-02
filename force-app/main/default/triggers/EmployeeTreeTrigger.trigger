trigger EmployeeTreeTrigger on Employee__c (before insert, before update) {
    
    if (trigger.isInsert || trigger.isUpdate){
        
        
        map<id,Employee__c> empMap = new Map<id,Employee__c>([SELECT Id, Hierarchy_Path__c, Report_To__c, Position__c, Empno__c, Name FROM Employee__c]);
        
        for (Employee__c empObj : trigger.new ){
            
            
            if(empObj.Report_To__c!= null){
                if(empMap.get(empObj.Report_To__c).Report_To__c != null){
                    empObj.Hierarchy_Path__c= empObj.Empno__c +'--'+ empMap.get(empObj.Report_To__c).Empno__c + '--' + empMap.get(empMap.get(empObj.Report_To__c).Report_To__c).Empno__c;
                }else{
                    empObj.Hierarchy_Path__c= empObj.Empno__c +'--'+ empMap.get(empObj.Report_To__c).Empno__c;
                }
            }
            
            
        }
        
        
    }
    
}