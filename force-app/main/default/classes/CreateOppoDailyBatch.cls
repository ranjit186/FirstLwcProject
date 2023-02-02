global class CreateOppoDailyBatch implements Database.Batchable<SObject>, schedulable {
    global Database.QueryLocator start(Database.BatchableContext Bc){
        return Database.getQueryLocator('select id from opportunity');
    }
    
    global void execute(Database.BatchableContext BC,  List<opportunity> newOpp){
        List<Opportunity>  listOpp = new List<Opportunity>();
        for(integer i = 0; i < 5; i++){
            Opportunity opp = new Opportunity();
            Opp.Name = 'ranjit' + i;
            opp.CloseDate = Date.valueOf('10/30/2021');
            
            listOpp.add(opp);
        }
        insert listOpp;
    }
    global void finish(Database.BatchableContext BC){
        
    }
    global void execute(SchedulableContext Sc){
        
    }
}