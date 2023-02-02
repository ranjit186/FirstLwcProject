public class leadTriggerHandle {
    public Static boolean alreadyexcuted = false;
    public static void beforeInsertHandler(List<Lead> newRecords){
        for(Lead leadRecord : newRecords){
            if(String.isBlank(leadRecord.LeadSource)){
                leadRecord.LeadSource = 'Other';
            }
            if(String.isBlank(leadRecord.Industry)){
                leadRecord.addError('The industry field can not be blank');
            }
        } 
    }
    
    public static void afterInsertHandler(List<Lead> newRecords){
        List<Task> leadTasks = new List<Task>();
        for(Lead leadRecord : newRecords){  
            Task leadTask = new Task(Subject = 'Follow up on Lead Status', WhoId = leadRecord.Id);
            leadTasks.add(leadTask);
        }
        insert leadTasks;
        if(leadTriggerHandle.alreadyexcuted == false){
            leadTriggerHandle.alreadyexcuted = True;
           Lead anotherLead  = 
            new Lead(LastName = 'Test Lead Single', Status ='Open-Not Contacted', Company='sfdcFacts', Industry = 'Finance');
        insert anotherLead;  
        }
       
    }
    
    public static void beforeUpdateHandler(List<Lead> newRecords, Map<Id, Lead> oldRecordMap){
        for(Lead  leadRecord : newRecords){  
            if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') 
               && oldRecordMap.get(leadRecord.Id).Status == 'Working - Contacted'){
                   leadRecord.Status.addError('you can\'t directly change ro closed form working');
               }
        }
    }
    
}