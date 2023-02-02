global class CaseBatch implements Database.Batchable<sObject>{
    
    set<Id> AccIds = new set<id>();
    
   global CaseBatch(set<id> newRecords){
        AccIds = newRecords;
    }
  
    // start method
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([Select id,Summary__c ,(Select id,Description from Cases) from Account where Id IN : AccIds]);
    }
    
    // Execute method
    global void execute(Database.BatchableContext BC, List<Account> scope){
        List<Account> accList=new List<Account>();
        for(Account acc :scope){
            String s ='';
            for(Case Con :acc.Cases){
                s+=Con.Description +',';
            }
            
            acc.Summary__c =  s.removeEnd(',');
            acclist.add(acc);
        }
        
        if(acclist.size()>0){
            update accList; 
            system.debug('accList : '+ accList);
        }
    }
    
    //Finish method
    global void finish(Database.BatchableContext BC){
        system.debug('Deleted all Account which is created before 10Days');
    }
   
}