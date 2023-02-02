public class LeadBatch implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }
    
    public void execute (Database.BatchableContext BC, List<Lead> scope){
        for(Lead LeadRecord : scope){
            LeadRecord.LeadSource = 'Other';
        }
        update scope;
    }
    
    
    public void finish(Database.BatchableContext BC){
        system.debug('Batch finished');
    }
    
}