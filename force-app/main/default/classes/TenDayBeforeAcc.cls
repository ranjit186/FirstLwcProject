global class TenDayBeforeAcc implements Database.Batchable<sObject>, schedulable{
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Name, Id, CreatedDate FROM Account where CreatedDate >= LAST_N_DAYS:10');
    }
    
    global void execute(Database.BatchableContext BC, List<Account> Acc){
        delete Acc;
    }
    
    global void finish(Database.BatchableContext BC){
        system.debug('Deleted all Account which is created before 10Days');
    }
    
    global void execute(SchedulableContext sc){
        
    }
}