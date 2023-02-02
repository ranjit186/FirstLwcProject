global class UpdateCountContact implements Database.Batchable<SObject>, schedulable{
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id,Count__c, (SELECT Id FROM Contacts) FROM Account');
    } 
    global void execute(Database.BatchableContext BC, List<Account> AccUp){
        try{
           List<Account> newListAcc = new List<Account>();
        for(Account each: AccUp){
            Account acc = new Account();
            acc.id = each.id;
            acc.Count__c = each.Contacts.size();
            
            newListAcc.add(acc);
        }
        update newListAcc; 
        }catch(Dmlexception e){
             System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
    }
    global void finish(Database.BatchableContext BC){
        system.debug('finshed update count filed');
    }
   global void execute(SchedulableContext Sc){
        
    }
}